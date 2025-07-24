//****************************************************************************
// Description:
// This module serializes a wide parallel data bus into a stream of
// single-precision floating-point words, writing one word per cycle to an SRAM.
//****************************************************************************
module write_out#(
    // Parameters now reflect the final output format
    parameter ARRAY_SIZE = 32,
    parameter DATA_WIDTH = 32, // The width of a single output word (single-precision float)
    parameter K_ACCUM_DEPTH = 64,
    parameter MAC_LATENCY = 4
)
(
    input clk,
    input srstn,
    input sram_write_enable, // Master write enable from top module
    input [8:0] cycle_num,   // Current cycle number from top module

    // Wide parallel data bus from the PE core
    input [(ARRAY_SIZE*DATA_WIDTH)-1:0] parallel_data_in, 
    
    // Outputs for the narrow, final SRAM
    output reg sram_we,
    output reg [(ARRAY_SIZE*DATA_WIDTH)-1:0] sram_wdata,
    output reg sram_waddr
);

    // Using a single clocked always block for robust, latch-free logic.
    always @(posedge clk or negedge srstn) begin
        if (~srstn) begin
            // Reset all outputs
            sram_we    <= 1'b0;
            sram_wdata <= 0;
            sram_waddr <= 0;
        end else begin
            // By default, disable the write operation each cycle.
            sram_we <= 1'b0;

            // Activate only during the designated write-out phase.
            if (sram_write_enable && (cycle_num == K_ACCUM_DEPTH + MAC_LATENCY + 1)) begin
                
                // 1. Assert the write enable signal.
                sram_we <= 1'b1;
                
                // 2. 直接写入
                sram_waddr <=  0;
                
                // 3. Select (slice) the correct data word from the parallel input bus.
                // The address calculated above is used as the index to select the word.
                sram_wdata <= parallel_data_in;
            end
        end
    end

endmodule
