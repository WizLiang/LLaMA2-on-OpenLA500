

//Defines


module CB_top #(
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 4,
    parameter MAC_SRAM_W_ADDR_WIDTH = 6, // 假设 $clog2(SRAM_W_DEPTH) = 6
    parameter MAC_SRAM_V_ADDR_WIDTH = 6, // 假设 $clog2(SRAM_V_DEPTH) = 6
    parameter MAC_SRAM_O_ADDR_WIDTH = 1, // 假设 $clog2(SRAM_O_DEPTH) = 5
    parameter MAC_SRAM_W_DATA_WIDTH = 1024,
    parameter MAC_SRAM_V_DATA_WIDTH = 32,
    parameter MAC_SRAM_O_DATA_WIDTH = 1024,
    parameter ADDR_WD = 32,  // DMA地址宽度
    parameter DATA_WD = 32  // DMA数据宽度
)
(
    
//clk & rst
    input clk,
    input rst_n,
    output CB_done,

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
    output         m_rready,


//Debug
    output [3:0]  debug_state,
    output [15:0] debug_data



);

//MAC
wire mac_start, mac_done;
wire mac_error = 1'b0;

wire mat_write_finished;
assign mat_write_finished = (mac_w_sram_waddr == 63) ? 1'b1 : 1'b0; // 假设写入完成条件为地址到达63

assign CB_done = ctrl_done;

//DMA
wire                       cmd_valid;       // DMA 命令有效
wire                       cmd_ready;       // 控制器就绪

wire [31:0]                cmd_src_addr;    // 源地址
wire [31:0]                cmd_dst_addr;    // 目的地址
wire [1:0]                 cmd_burst;       // 00=INCR, 01=FIXED, 10=WRAP
wire                       cmd_rw;          // 0=读, 1=写
wire [10:0]                cmd_len;         // 传输字节数
wire [2:0]                 cmd_size;        // AXI beat 大小 (0=1B,1=2B,2=4B,…)
wire                       dma_done; 
wire                       ctrl_done;       // DMA 启动信号 
//wire [STRB_WD-1:0]         R_strobe;        // 读通道 byte-enable（不需可接全 1）

    wire [1:0]                 dma_target_sram; // 00=Vec, 01=Weight, 10=Output, 11=Reserved
    wire                       mac_access_mode; // 0=计算模式, 1=DMA访问模式

    // 来自 DMA 的 SRAM 接口信号
    wire dma_sram_we;
    wire [ADDR_WD-1:0] dma_sram_waddr;
    wire [DATA_WD-1:0] dma_sram_wdata;
    wire [ADDR_WD-1:0] dma_sram_raddr;
    wire [DATA_WD-1:0] dma_sram_rdata; // 从 MAC 输入到 DMA

    // 连接到mac_top的Weight SRAM的写端口
    reg  mac_w_sram_we;
    reg  [MAC_SRAM_W_ADDR_WIDTH-1:0] mac_w_sram_waddr;
    reg  [MAC_SRAM_W_DATA_WIDTH-1:0] mac_w_sram_wdata;

    // 连接到mac_top的Vector SRAM的写端口
    reg  mac_v_sram_we;
    reg  [MAC_SRAM_V_ADDR_WIDTH-1:0] mac_v_sram_waddr;
    reg  [MAC_SRAM_V_DATA_WIDTH-1:0] mac_v_sram_wdata;

    reg  mac_w_sram_w_flop; // 用于控制写使能的寄存器

    // 连接到mac_top的Outcome SRAM的读端口
    wire [MAC_SRAM_O_ADDR_WIDTH-1:0] mac_o_sram_raddr;
    wire [MAC_SRAM_O_DATA_WIDTH-1:0] mac_o_sram_rdata;

    // DMA 读 (主存 -> SRAM) 路径所需的寄存器
    reg  [MAC_SRAM_W_DATA_WIDTH-1:0] mat_sram_write_buffer; // 1024位写缓冲器，用于拼接数据
    reg  [$clog2(MAC_SRAM_W_DATA_WIDTH/DATA_WD)-1:0] mat_write_sub_cnt; // 0-31计数器
    reg  [MAC_SRAM_W_ADDR_WIDTH-1:0] mat_sram_addr_cnt;

    // DMA 写 (SRAM -> 主存) 路径所需的寄存器
    reg  [MAC_SRAM_O_DATA_WIDTH-1:0] out_sram_read_buffer;  // 1024位读缓冲器，用于锁存和切片
    reg  [$clog2(MAC_SRAM_O_DATA_WIDTH/DATA_WD)-1:0] out_read_sub_cnt;  // 0-31切片计数器

    // 连接到 DMA 的 sram_rdata 的 MUX 输出
    wire [DATA_WD-1:0] muxed_sram_rdata;
    wire [15:0] debug_data;

assign cmd_size = 2'b10;


// assign mac_v_sram_we    = (dma_target_sram == 2'b00) ? dma_sram_we    : 1'b0;
// assign mac_v_sram_waddr = (dma_target_sram == 2'b00) ? dma_sram_waddr[MAC_SRAM_V_ADDR_WIDTH-1:0]  : 0;
// assign mac_v_sram_wdata = (dma_target_sram == 2'b00) ? dma_sram_wdata : 0;


// assign mac_w_sram_we    = (dma_target_sram == 2'b01) ? dma_sram_we    : 1'b0;
// assign mac_w_sram_waddr = (dma_target_sram == 2'b01) ? dma_sram_waddr[MAC_SRAM_W_ADDR_WIDTH-1:0]  : 0;
// assign mac_w_sram_wdata = (dma_target_sram == 2'b01) ? dma_sram_wdata : 0;


// assign mac_o_sram_raddr = (dma_target_sram == 2'b10) ? dma_sram_raddr[MAC_SRAM_O_ADDR_WIDTH-1:0]  : 0;

// assign dma_sram_rdata   = (dma_target_sram == 2'b10) ? mac_o_sram_rdata : 0;


// --- 路径 1: DMA 读 (DDR -> SRAM)，数据写入本地 SRAM ---

always @(posedge clk) begin
    if (!rst_n) begin
        mac_v_sram_we <= 1'b0;
        mac_w_sram_we <= 1'b0;
        mat_sram_write_buffer <= 'd0;
        mat_write_sub_cnt <= 'd0;
        mac_w_sram_wdata <= 'd0;
        mac_v_sram_waddr <= 'd0;
        mac_v_sram_wdata <= 'd0;
        mac_w_sram_waddr <= 'd0;
        mat_sram_addr_cnt <= 'd0;
        mac_w_sram_w_flop <= 1'b0; // 初始化写使能标志
    end 
    else begin
        // 默认情况下，关闭写使能
        mac_v_sram_we <= 1'b0;
        mac_w_sram_we <= 1'b0;
        mac_w_sram_w_flop <= 1'b0; // 清除写使能标志

        if (dma_sram_we) begin // 当DMA控制器想要写SRAM时
            case (dma_target_sram)
                2'b00: begin // 目标: 32位 Vector SRAM
                    // 直通逻辑
                    mac_v_sram_we    <= 1'b1;
                    mac_v_sram_waddr <= dma_sram_waddr[MAC_SRAM_V_ADDR_WIDTH-1:0];
                    mac_v_sram_wdata <= dma_sram_wdata;
                end
                
                2'b01: begin // 目标: 1024位 Weight SRAM
                    // 拼接逻辑
                    mat_sram_write_buffer[mat_write_sub_cnt * DATA_WD +: DATA_WD] <= dma_sram_wdata;
                    mat_write_sub_cnt <= mat_write_sub_cnt + 1;

                    if (mat_write_sub_cnt == (MAC_SRAM_W_DATA_WIDTH/DATA_WD - 1)) begin
                        // 缓冲区满了，触发一次1024位的写操作
                        // mac_w_sram_we    <= 1'b1;
                        // mat_sram_addr_cnt <= mat_sram_addr_cnt + 1; // 更新地址计数器
                        // mac_w_sram_waddr <= mat_sram_addr_cnt;   //TODO 修改
                        // mac_w_sram_wdata <= mat_sram_write_buffer;
                        // mat_write_sub_cnt <= 'd0; // 计数器清零
                        mac_w_sram_w_flop <= 1'b1; // 设置写使能标志
                    end
                end
                default: ;
            endcase
        end
    end
end

always @(posedge clk) begin
    if (mac_w_sram_w_flop) begin
        mac_w_sram_we    <= 1'b1;
        mat_sram_addr_cnt <= mat_sram_addr_cnt + 1; // 更新地址计数器
        mac_w_sram_waddr <= mat_sram_addr_cnt;   //TODO 修改
        mac_w_sram_wdata <= mat_sram_write_buffer;
        mat_write_sub_cnt <= 'd0; // 计数器清零
        mac_w_sram_w_flop <= 1'b0; // 清除写使能标志
    end else begin
        mac_w_sram_we    <= 1'b0;
        mac_w_sram_waddr <= 'd0; // 清除地址
        mac_w_sram_wdata <= 'd0; // 清除数据
    end
end


// --- 路径 2: DMA 写 (SRAM -> DDR)，从本地 SRAM 读取数据 ---

// Part A: 地址路由 (组合逻辑)
// 将DMA的读地址请求路由到正确的SRAM
assign mac_o_sram_raddr = 1'd0; // 只读一个地址，假设为0


// Part B: 数据锁存和切片控制 (时序逻辑)
always @(posedge clk) begin
    if (!rst_n) begin
        out_sram_read_buffer <= 'd0;
        out_read_sub_cnt     <= 'd0;
    end
    else begin
        // 当目标是 Outcome SRAM (1024位) 且一个字块的传输刚开始时，锁存新数据
        // 判断开始的条件可以是 sub_cnt=0 并且 DMA 有效
        if ((dma_target_sram == 2'b10) && (out_read_sub_cnt == 0) && (cmd_valid && cmd_rw)) begin
             out_sram_read_buffer <= mac_o_sram_rdata;
        end

        // 当DMA成功将一个32位数据写入AXI总线后，更新切片计数器
        if (m_wvalid && m_wready) begin
            if (out_read_sub_cnt == (MAC_SRAM_O_DATA_WIDTH/DATA_WD)- 1) begin
                out_read_sub_cnt <= 'd0;
            end else begin
                out_read_sub_cnt <= out_read_sub_cnt + 1;
            end
        end
    end
end

// Part C: 数据选择 MUX (组合逻辑)
// 根据目标SRAM和切片计数器，将正确的数据喂给DMA
assign muxed_sram_rdata = (dma_target_sram == 2'b10) 
                        ? out_sram_read_buffer >> ((31 - out_read_sub_cnt) * 32)    //TODO 如果宽度更大，可以调整
                        : 32'hDEADBEEF; // 默认或用于其他SRAM的路径

assign dma_sram_rdata = muxed_sram_rdata;


CB_Controller u_controller(
    .clk(clk),
    .rst_n(rst_n),

    //Debug
    .debug_state(debug_state),

    .mat_write_finished(mat_write_finished), // 连接到MAC的写完成信号

    .cmd_valid      (cmd_valid),
    .cmd_ready      (cmd_ready),
    .cmd_src_addr   (cmd_src_addr),
    .cmd_dst_addr   (cmd_dst_addr),
    .cmd_burst      (cmd_burst),
    .cmd_rw         (cmd_rw),      // 0 = read, 1 = write
    .cmd_len        (cmd_len),     // 单位：Byte
    .dma_done       (dma_done),
    .ctrl_done      (ctrl_done),   // 控制器完成信号

    //TODO: MAC_Engine
    .mac_start(mac_start),
    .mac_done(mac_done),
    .mac_error(mac_error),
    .mac_access_mode(mac_access_mode), // 0=计算模式, 1=DMA访问模式
    .dma_target_sram(dma_target_sram), // 00=Vec, 01=Weight, 10=Output, 11=Reserved


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
        .clk(clk), 
        .srstn(rst_n), 
        .start_processing(mac_start),
        .processing_done(mac_done),

        .dma_access_mode(mac_access_mode),
        .dma_w_sram_we(mac_w_sram_we),
        .dma_w_sram_waddr(mac_w_sram_waddr),
        .dma_w_sram_wdata(mac_w_sram_wdata),
        .dma_v_sram_we(mac_v_sram_we),
        .dma_v_sram_waddr(mac_v_sram_waddr),
        .dma_v_sram_wdata(mac_v_sram_wdata),
        .dma_o_sram_raddr(mac_o_sram_raddr),
        .dma_o_sram_rdata(mac_o_sram_rdata),
        .debug_data(debug_data)
    );

    

    axi_dma_controller #(
        .ADDR_WD (32),  
        .DATA_WD (32),   
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
    .dma_done       (dma_done),

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
    .M_AXI_BREADY   (m_bready),
    //-------------------------------------------------
    // DMA Target SRAM Interface
    //-------------------------------------------------
    .sram_we(dma_sram_we),
    .sram_waddr(dma_sram_waddr),
    .sram_wdata(dma_sram_wdata),
    .sram_raddr(dma_sram_raddr), // 读写地址共用
    .sram_rdata(dma_sram_rdata)
);

endmodule