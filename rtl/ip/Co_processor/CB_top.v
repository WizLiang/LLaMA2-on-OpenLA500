

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
    input           s_rready,


//AXI Master (for DMA)
    // Write address channel (AW)
    output [3 :0]  m_awid,
    output [31:0]  m_awaddr,
    output [7 :0]  m_awlen,
    output [2 :0]  m_awsize,
    output [1 :0]  m_awburst,
    output         m_awlock,
    output [3 :0]  m_awcache,
    output [2 :0]  m_awprot,
    output         m_awvalid,
    input          m_awready,

// Write data channel (W)
    output [31:0]  m_wdata,
    output [3 :0]  m_wstrb,
    output         m_wlast,
    output         m_wvalid,
    input          m_wready,

// Write response channel (B)
    input  [3 :0]  m_bid,
    input  [1 :0]  m_bresp,
    input          m_bvalid,
    output         m_bready,

// Read address channel (AR)
    output [3 :0]  m_arid,
    output [31:0]  m_araddr,
    output [7 :0]  m_arlen,
    output [2 :0]  m_arsize,
    output [1 :0]  m_arburst,
    output         m_arlock,
    output [3 :0]  m_arcache,
    output [2 :0]  m_arprot,
    output         m_arvalid,
    input          m_arready,

// Read data channel (R)
    input  [3 :0]  m_rid,
    input  [31:0]  m_rdata,
    input  [1 :0]  m_rresp,
    input          m_rlast,
    input          m_rvalid,
    output         m_rready


//Debug
    



);

wire                       cmd_valid;       // DMA 命令有效
wire                       cmd_ready;       // 控制器就绪

wire [31:0]                cmd_src_addr;    // 源地址
wire [31:0]                cmd_dst_addr;    // 目的地址
wire [1:0]                 cmd_burst;       // 00=INCR, 01=FIXED, 10=WRAP
wire                       cmd_rw;          // 0=读, 1=写
wire [9:0]                 cmd_len;         // 传输字节数
wire [2:0]                 cmd_size;        // AXI beat 大小 (0=1B,1=2B,2=4B,…)

//wire [STRB_WD-1:0]         R_strobe;        // 读通道 byte-enable（不需可接全 1）

assign cmd_size = 2'b10;

CB_Controller u_controller(
    .clk(clk),
    .rst_n(rst_n),


    //TODO: DMA_Ctrl
    .cmd_valid      (cmd_valid),
    .cmd_ready      (cmd_ready),
    .cmd_src_addr   (cmd_src_addr),
    .cmd_dst_addr   (cmd_dst_addr),
    .cmd_burst      (cmd_burst),
    .cmd_rw         (cmd_rw),      // 0 = read, 1 = write
    .cmd_len        (cmd_len),     // 单位：Byte

    //TODO: MAC_Engine


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
    axi_dma_controller #(
    .ADDR_WD (32),   // 地址宽度
    .DATA_WD (32),   // 数据宽度
    .ID_WD   (4)     
) u_axi_dma_controller (
    //-------------------------------------------------
    // Global
    //-------------------------------------------------
    .clk            (clk),
    .rst            (!rst_n),

    //-------------------------------------------------
    // DMA Command interface
    //-------------------------------------------------
    .cmd_valid      (cmd_valid),
    .cmd_ready      (cmd_ready),
    .cmd_src_addr   (cmd_src_addr),
    .cmd_dst_addr   (cmd_dst_addr),
    .cmd_burst      (cmd_burst),
    .cmd_rw         (cmd_rw),      // 0 = read, 1 = write
    .cmd_len        (cmd_len),     // 单位：Byte
    .cmd_size       (cmd_size),    // AXI beat size
    .R_strobe       (4'b1111),    // 读通道 byte-enable

    //-------------------------------------------------
    // AXI-4 Read Address Channel
    //-------------------------------------------------
    .M_AXI_ARVALID  (m_arvalid),
    .M_AXI_ARADDR   (m_araddr),
    .M_AXI_ARLEN    (m_arlen),
    .M_AXI_ARSIZE   (m_arsize),
    .M_AXI_ARBURST  (m_arburst),
    .M_AXI_ARREADY  (m_arready),
    .M_AXI_ARID     (m_arid),
    .M_AXI_ARLOCK   (m_arlock),
    .M_AXI_ARPROT   (m_arprot),
    .M_AXI_ARCACHE  (m_arcache),

    //-------------------------------------------------
    // AXI-4 Read Data Channel
    //-------------------------------------------------
    .M_AXI_RVALID   (m_rvalid),
    .M_AXI_RDATA    (m_rdata),
    .M_AXI_RRESP    (m_rresp),
    .M_AXI_RLAST    (m_rlast),
    .M_AXI_RREADY   (m_rready),
    .M_AXI_RID      (m_rid),

    //-------------------------------------------------
    // AXI-4 Write Address Channel
    //-------------------------------------------------
    .M_AXI_AWVALID  (m_awvalid),
    .M_AXI_AWADDR   (m_awaddr),
    .M_AXI_AWLEN    (m_awlen),
    .M_AXI_AWSIZE   (m_awsize),
    .M_AXI_AWBURST  (m_awburst),
    .M_AXI_AWREADY  (m_awready),
    .M_AXI_AWID     (m_awid),
    .M_AXI_AWLOCK   (m_awlock),
    .M_AXI_AWPROT   (m_awprot),
    .M_AXI_AWCACHE  (m_awcache),

    //-------------------------------------------------
    // AXI-4 Write Data Channel
    //-------------------------------------------------
    .M_AXI_WVALID   (m_wvalid),
    .M_AXI_WDATA    (m_wdata),
    .M_AXI_WSTRB    (m_wstrb),
    .M_AXI_WLAST    (m_wlast),
    .M_AXI_WREADY   (m_wready),

    //-------------------------------------------------
    // AXI-4 Write Response Channel
    //-------------------------------------------------
    .M_AXI_BVALID   (m_bvalid),
    .M_AXI_BRESP    (m_bresp),
    .M_AXI_BID      (m_bid),
    .M_AXI_BREADY   (m_bready)
);

endmodule