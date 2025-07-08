`timescale 1ns / 1ps
// PE_core module refactored to use a dedicated fp_mac (Multiply-Accumulate) unit.
// This improves modularity by encapsulating the multiply and add operations.
module PE_core#(
    parameter ARRAY_SIZE = 32,
    parameter SRAM_DATA_WIDTH = 1024, // 32*32=1024
    parameter DATA_WIDTH = 32,       // 32-bit floating point
    parameter K_ACCUM_DEPTH = 64,    // Accumulation depth
    parameter OUTCOME_WIDTH = 32     // Output 32-bit floating point
)
(
    input clk,
    input srstn,
    input alu_start,
    input [8:0] cycle_num,
    input [SRAM_DATA_WIDTH-1:0] sram_rdata_w, // A column of the matrix
    input [DATA_WIDTH-1:0] sram_rdata_v,      // A single vector value
    output [(ARRAY_SIZE * OUTCOME_WIDTH) - 1:0] mul_outcome
);

// Internal registers
reg [DATA_WIDTH-1:0] weight_queue [0:ARRAY_SIZE-1];
reg [DATA_WIDTH-1:0] vec_reg;
reg [OUTCOME_WIDTH-1:0] acc_reg [0:ARRAY_SIZE-1];

// Loop variable
integer i;

// Weight queue loading logic
always @(posedge clk) begin
    if (~srstn) begin
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
            weight_queue[i] <= 32'b0;
        end
        vec_reg <= 32'b0;
    end else if (alu_start) begin
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
            // Load a slice of the wide SRAM data into each weight queue element
            weight_queue[i] <= sram_rdata_w[i*DATA_WIDTH +: DATA_WIDTH];
        end
        vec_reg <= sram_rdata_v;
    end
end

// *** MODIFICATION START ***
// The separate mul_result and add_result wires are replaced by a single mac_result wire.
wire [OUTCOME_WIDTH-1:0] mac_result [0:ARRAY_SIZE-1];

genvar gi;
generate
    // Instantiate the new fp_mac unit for each element in the array.
    // This replaces the separate fp_mul and fp_add instantiations.
    for (gi = 0; gi < ARRAY_SIZE; gi = gi + 1) begin: MAC_PIPE
        fp_mac u_fp_mac (
            .a(weight_queue[gi]), // Multiplicand 1
            .b(vec_reg),     // Multiplicand 2
            .c(acc_reg[gi]),      // Value to add (from accumulator)
            .result(mac_result[gi]) // Output of the MAC operation
        );
    end
endgenerate

// Accumulator register logic
always @(posedge clk) begin
    if(~srstn) begin
        for(i=0; i<ARRAY_SIZE; i=i+1) begin
            acc_reg[i] <= 32'b0;
        end
    // The accumulation now uses the result from the fp_mac unit
    end else if(alu_start & cycle_num <= K_ACCUM_DEPTH + 1) begin
        for(i=0; i<ARRAY_SIZE; i=i+1) begin
            acc_reg[i] <= mac_result[i];
        end
    end
end
// *** MODIFICATION END ***


// Combinational logic to assign accumulator values to the output port
reg [(ARRAY_SIZE * OUTCOME_WIDTH) - 1:0] mul_outcome_reg;
always @(*) begin
    for(i=0; i<ARRAY_SIZE; i=i+1) begin
        // This maps acc_reg[i] to the corresponding slice of the output vector.
        // The indexing reverses the order, so mul_outcome = {acc_reg[0], acc_reg[1], ...}
        mul_outcome_reg[((ARRAY_SIZE-i) * OUTCOME_WIDTH) - 1 -: OUTCOME_WIDTH] = acc_reg[i];
    end
end
assign mul_outcome = mul_outcome_reg;

endmodule


// *** NEW MODULE ***
// Floating-Point Multiply-Accumulate (MAC) Unit
// This module wraps the fp_mul and fp_add modules into a single unit.
// It performs the operation: result = (a * b) + c
module fp_mac (
    input  [31:0] a,
    input  [31:0] b,
    input  [31:0] c,
    output [31:0] result
);

    // Internal wire for the multiplication result
    wire [31:0] mul_result;

    // Instantiate the multiplier
    fp_mul u_fp_mul (
        .a(a),
        .b(b),
        .result(mul_result)
    );

    // Instantiate the adder
    // It adds the multiplication result to the input 'c'
    fp_add u_fp_add (
        .a(mul_result),
        .b(c),
        .out(result)
    );

endmodule
