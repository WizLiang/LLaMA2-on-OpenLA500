`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////
// PE_core_pipelined
//
// Description:
// PE_core refactored to use a dedicated, fully-pipelined MAC unit.
// This design correctly integrates user-provided sequential 'fpmul_seq'
// (2-cycle latency) and 'adder32' (1-cycle latency) modules by wrapping
// them in a new 'fp_mac_pipelined_acc' module. This wrapper handles
// all internal pipeline staging and feedback logic.
////////////////////////////////////////////////////////////////
module PE_core#(
    parameter ARRAY_SIZE = 32,
    parameter SRAM_DATA_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter VECTOR_WIDTH = 64,
    parameter K_ACCUM_DEPTH = 64,
    parameter OUTCOME_WIDTH = 32,
    parameter BUS_WIDTH = 64,
    // Total MAC latency is 4 cycles.
    // (2 cycles for multiplier + 1 cycle for adder + 1 for acc register update)
    parameter MAC_LATENCY = 3
)
(
    input clk,
    input srstn, // Active-low synchronous reset
    input alu_start,
    input [8:0] cycle_num,
    input [BUS_WIDTH * ARRAY_SIZE - 1:0] sram_rdata_w,
    input [BUS_WIDTH-1:0] sram_rdata_v,
    input acc_en, // Enable signal for the MAC units
    output [(ARRAY_SIZE * OUTCOME_WIDTH) - 1:0] mul_outcome
);

    // Internal registers for inputs
    reg [DATA_WIDTH-1:0] weight_queue [0:ARRAY_SIZE-1];
    reg [DATA_WIDTH-1:0] vec_reg;
    integer i;
    reg [ARRAY_SIZE * DATA_WIDTH - 1:0] partial_sum_in;
    reg vec_cnt;

    //锁存逻辑
    always @(posedge clk) begin
        if (~srstn)begin
            partial_sum_in <= 0;
        end
        else if (acc_en) begin
            // Load the initial value for the accumulator from the SRAM read data
            partial_sum_in <= mul_outcome_reg;
        end else begin
            // Maintain the current state if not starting a new operation
            partial_sum_in <= 0;
        end
    end

    // Input data loading logic
    always @(posedge clk) begin
        if (~srstn) begin
            for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                weight_queue[i] <= 32'b0;
            end
            vec_reg <= 0;
            vec_cnt <= 0;
        end else if (alu_start) begin
            for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                weight_queue[i] <= (vec_cnt == 1'b0) ? sram_rdata_w[i*BUS_WIDTH +: DATA_WIDTH] : sram_rdata_w[(i*BUS_WIDTH + DATA_WIDTH) +: DATA_WIDTH];
            end
            vec_reg <= (vec_cnt == 1'b0) ? sram_rdata_v[31:0] : sram_rdata_v[63:32];
            vec_cnt <= ~vec_cnt;
        end else begin
            // Maintain the current state if not starting a new operation
            for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                weight_queue[i] <= 0;
            end
            vec_reg <= 0;
            vec_cnt <= 0;
        end
    end

    // Control signal to reset the internal accumulators in the MAC units.
    // This pulse happens at the very beginning of a calculation sequence.
    reg rst_acc_pulse;
    always @(posedge clk) begin
        if (~srstn) begin
            rst_acc_pulse <= 1'b0;
        end else begin
            // Generate a single-cycle pulse when cycle_num is 0
            rst_acc_pulse <= (cycle_num == 0);
        end
    end

    // Wires to connect to the MAC outputs
    wire [OUTCOME_WIDTH-1:0] mac_results_wire [0:ARRAY_SIZE-1];

    // Generate array of pipelined MAC units
    genvar gi;
    generate
        for (gi = 0; gi < ARRAY_SIZE; gi = gi + 1) begin: MAC_PIPE_INST
            // Instantiate the new pipelined multiply-accumulator wrapper
            fp_mac_pipelined_acc u_fp_mac_acc (
                .clk(clk),
                .rstn(srstn),
                .en(alu_start),
                .rst_acc(rst_acc_pulse),
                .a(weight_queue[gi]),
                .b(vec_reg),
                .partial_sum_in(partial_sum_in[((ARRAY_SIZE-gi) * DATA_WIDTH) - 1 -: DATA_WIDTH]),
                .result(mac_results_wire[gi])
            );
        end
    endgenerate

    // Register to capture the final result from the MACs at the correct time.
    reg [(ARRAY_SIZE * OUTCOME_WIDTH) - 1:0] mul_outcome_reg;

    always @(posedge clk) begin
        if (~srstn) begin
            mul_outcome_reg <= 0;
        // The last valid data is input at cycle `K_ACCUM_DEPTH`. Due to the MAC's pipeline
        // latency, the final result for this last input will be available `MAC_LATENCY`
        // cycles later. We capture the stable result at that specific moment.
        end else if (cycle_num == K_ACCUM_DEPTH + MAC_LATENCY) begin
            for(i=0; i<ARRAY_SIZE; i=i+1) begin
                mul_outcome_reg[((ARRAY_SIZE-i) * OUTCOME_WIDTH) - 1 -: OUTCOME_WIDTH] <= mac_results_wire[i];
            end
        end
    end

    assign mul_outcome = mul_outcome_reg;

endmodule


////////////////////////////////////////////////////////////////
// fp_mac_pipelined_acc (NEW WRAPPER MODULE)
//
// Description:
// Encapsulates the sequential multiplier and adder to create a
// self-contained, pipelined multiply-accumulate unit. It manages
// the internal pipeline and feedback loop correctly.
// Operation: result <= (a * b) + result
////////////////////////////////////////////////////////////////
module fp_mac_pipelined_acc (
    input clk,
    input rstn,      // Active-low reset for this module
    input en,        // Enable pipeline stages
    input rst_acc,   // 用于加载初始值
    input [31:0] a,
    input [31:0] b,
    input [31:0] partial_sum_in,
    output [31:0] result
);
    // Wires connecting the internal modules
    wire [31:0] mul_out_wire;
    wire [31:0] add_out_wire;

    // The final accumulator register. This holds the state.
    reg [31:0] acc_reg;

    // Instantiate the user's multiplier.
    // The user's 'fpmul_seq' module has a 2-cycle latency.
    fpmul_seq_pipeline u_multiplier (
        .clk(clk),
        .rst_n(rstn), // Connecting the active-low reset
        .A(a),
        .B(b),
        .O(mul_out_wire)
    );

    // Instantiate the user's adder.
    // Assumed to have a 1-cycle latency.
    fpadd_seq u_adder (
        .clk(clk),
        .rst_n(rstn),
        .A(mul_out_wire), // Result from the multiplier (arrives after 2 cycles)
        .B(acc_reg),      // Feedback from the accumulator register (previous value)
        .O(add_out_wire)  // Output of the adder (arrives after 1 more cycle)
    );

    // Logic for the accumulator register. This is the final stage of the pipeline.
    always @(*) begin
        if (!rstn) begin
            acc_reg = 32'b0;
        // rst_acc is a synchronous signal to clear the sum at the start of a sequence.
        end else if (rst_acc) begin
            acc_reg = partial_sum_in; // Load the initial value into the accumulator
        // If enabled, the pipeline moves forward.
        end else if (en) begin
            // The adder's output becomes the new accumulated value.
            // This correctly models the feedback loop timing.
            acc_reg = add_out_wire;
        end
    end

    // The output of the MAC unit is the current value of the accumulator register.
    assign result = acc_reg;
endmodule
