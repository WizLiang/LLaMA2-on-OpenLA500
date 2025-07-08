

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
    output          s_wready,
    //b
    output [4 :0]   s_bid,
    output [1 :0]   s_bresp,
    output          s_bvalid,
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
    output [31:0]   s_rdata,
    output [1 :0]   s_rresp,
    output          s_rlast,
    output          s_rvalid,
    input           s_rready

//TODO: AXI Master (for DMA)



//Debug
    



);

    wire mac_start_wire, mac_done_wire;
    wire mac_error_wire = 1'b0;


CB_Controller u_controller(
    .clk(clk),
    .rst_n(rst_n),


    //TODO: DMA_Ctrl
    .dma_start(),
    .dma_addr(),
    .dma_len(),
    .dma_dir(),
    .dma_done(1'b1),    //TODO: DMA_Ctrl
    .dma_error(1'b0),

    //TODO: MAC_Engine
    .mac_start(mac_start_wire),
    .mac_done(mac_done_wire),
    .mac_error(mac_error_wire),


    //TODO: Debug
    
    //AXI Slave bus

    .s_awid     (s_awid),
    .s_awaddr   (s_awaddr),
    .s_awlen    (s_awlen),
    .s_awsize   (s_awsize),
    .s_awburst  (s_awburst),
    .s_awlock   (s_awlock),
    .s_awcache  (s_awcache),
    .s_awprot   (s_awprot),
    .s_awvalid  (s_awvalid),
    .s_awready  (s_awready),

    .s_wdata    (s_wdata),
    .s_wstrb    (s_wstrb),
    .s_wlast    (s_wlast),
    .s_wvalid   (s_wvalid),
    .s_wready   (s_wready),

    .s_bid      (s_bid),
    .s_bresp    (s_bresp),
    .s_bvalid   (s_bvalid),
    .s_bready   (s_bready),

    .s_arid     (s_arid),
    .s_araddr   (s_araddr),
    .s_arlen    (s_arlen),
    .s_arsize   (s_arsize),
    .s_arburst  (s_arburst),
    .s_arlock   (s_arlock),
    .s_arcache  (s_arcache),
    .s_arprot   (s_arprot),
    .s_arvalid  (s_arvalid),
    .s_arready  (s_arready),

    .s_rid      (s_rid),
    .s_rdata    (s_rdata),
    .s_rresp    (s_rresp),
    .s_rlast    (s_rlast),
    .s_rvalid   (s_rvalid),
    .s_rready   (s_rready)
);


    mac_top mac_top_inst (
        .clk(clk), .srstn(rst_n), .start_processing(mac_start_wire),
        .processing_done(mac_done_wire)
    );

    
endmodule