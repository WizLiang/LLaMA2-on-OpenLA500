//****************************************************************************
// Description:
// A generic synchronous SRAM model with synthesizable initialization support.
// This version corrects Verilog syntax for broader compatibility.
//****************************************************************************
module sram #(
    parameter DATA_WIDTH = 512,
    parameter ADDR_WIDTH = 6,
    parameter INIT_FILE = "" 
)
(
    input clk,
    input csb,
    input wsb,
    input [DATA_WIDTH-1:0] wdata,
    input [ADDR_WIDTH-1:0] waddr,
    input [ADDR_WIDTH-1:0] raddr,
    output reg [DATA_WIDTH-1:0] rdata
);

    localparam DEPTH = 1 << ADDR_WIDTH;

    // The core memory array
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    reg [DATA_WIDTH-1:0] _rdata;

    // Synthesizable initialization block
    initial begin
        if (INIT_FILE != "") begin
            $readmemh(INIT_FILE, mem);
        end
    end

    // Synchronous write logic
    always @(posedge clk) begin
        if (~csb && ~wsb) begin
            mem[waddr] <= wdata;
        end
    end

    always@(posedge clk) begin
        if (~csb) begin
            _rdata <= mem[raddr];
        end
    end

    // This correctly models a registered output and resolves the concurrent
    // assignment error. The intermediate '_rdata' register is no longer needed.
    always@*
    begin
        rdata =  _rdata;
    end

endmodule
