`timescale 1ns/100ps
module sram_sp #(
    parameter AW = 16,
    parameter Init_File = "none"
)
(
    inout  [31:0] ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共享
    input [19:0] ram_addr, //BaseRAM地址
    input [ 3:0] ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
    input  ram_ce_n,       //BaseRAM片选，低有效
    input  ram_oe_n,       //BaseRAM读使能，低有效
    input  ram_we_n        //BaseRAM写使能，低有效

);
    localparam AWT = ((1<<(AW-0))-1);

    reg [31:0] BRAM [AWT:0];

    initial begin
        if(Init_File != "none") begin
            $readmemb(Init_File,BRAM);
        end
    end
    
    reg     [AW-1:0]  addr_q1;
    wire    [3:0]     write_enable;

    assign write_enable[3:0] = (~ram_be_n) & {4{(~ram_ce_n) & (~ram_we_n)}};


    always@(posedge write_enable[0]) begin
		#10;
        if(~ram_be_n[0]) BRAM[ram_addr][7:0] <= ram_data[7:0];
    end
    always@(posedge write_enable[1]) begin
		#10;
        if(~ram_be_n[1]) BRAM[ram_addr][15:8] <= ram_data[15:8];
    end
    always@(posedge write_enable[2]) begin
		#10;
        if(~ram_be_n[2]) BRAM[ram_addr][23:16] <= ram_data[23:16];
    end
    always@(posedge write_enable[3]) begin
		#10;
        if(~ram_be_n[3]) BRAM[ram_addr][31:24] <= ram_data[31:24];
    end

    wire [31:0] RDATA  = BRAM[ram_addr];

    assign ram_data = ((~ram_ce_n) & (~ram_oe_n)) ?  RDATA  : 32'hzzzzzzzz;

endmodule
