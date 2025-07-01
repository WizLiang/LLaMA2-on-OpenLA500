

//Defines


module CB_top(
    
//clk & rst
    input clk,
    input rst_n,

//AXI Slave bus
    //aw
    input  [4 :0]   s_awid,
    input  [31:0]   s_awaddr,
    input  [7 :0]   s_awlen,
    input  [2 :0]   s_awsize,
    input  [1 :0]   s_awburst,
    input           s_awlock,
    input  [3 :0]   s_awcache,
    input  [2 :0]   s_awprot,
    input           s_awvalid,
    output          s_awready,
    //w
    input  [31:0]   s_wdata,
    input  [3 :0]   s_wstrb,
    input           s_wlast,
    input           s_wvalid,
    output reg      s_wready,
    //b
    output [4 :0]   s_bid,
    output [1 :0]   s_bresp,
    output reg      s_bvalid,
    input           s_bready,
    //ar
    input  [4 :0]   s_arid,
    input  [31:0]   s_araddr,
    input  [7 :0]   s_arlen,
    input  [2 :0]   s_arsize,
    input  [1 :0]   s_arburst,
    input           s_arlock,
    input  [3 :0]   s_arcache,
    input  [2 :0]   s_arprot,
    input           s_arvalid,
    output          s_arready,
    //r
    output [4 :0]   s_rid,
    output reg [31:0]   s_rdata,
    output [1 :0]   s_rresp,
    output reg      s_rlast,
    output reg      s_rvalid,
    input           s_rready,

//TODO: AXI Master (for DMA)



//Debug
    



);
    
endmodule