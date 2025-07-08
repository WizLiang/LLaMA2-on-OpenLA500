//======================================================================
//==                              功能描述                             ==
//======================================================================
// 1、通过 axi 输入配置协处理器，例如矩阵的基地址、矩阵的大小等信息
// 2、axi 写控制寄存器，启动协处理器
// 3、等待读取状态寄存器与计算完成信号
// 4、通过 axi 清除控制寄存器，停止协处理器

//======================================================================
//==                       Register Address Map                       ==
//======================================================================
`define REG_CTRL_ADDR      16'h0000  // Control Register (RW)
`define REG_STATUS_ADDR    16'h0004  // Status Register (RO)
`define REG_ERR_CODE_ADDR  16'h0008  // Error Code Register (RO)
`define REG_VI_BASE_ADDR   16'h0010  // Input Vector Base Address (RW)
`define REG_MI_BASE_ADDR   16'h0014  // Input Matrix Base Address (RW)
`define REG_VO_BASE_ADDR   16'h0018  // Output Vector Base Address (RW)
`define REG_ROWS_ADDR      16'h0020  // Matrix Rows Count (RW)
`define REG_COLS_ADDR      16'h0024  // Matrix Columns Count (RW)

//======================================================================
//==                  Control/Status Register Bit Fields              ==
//======================================================================
// --- csr_ctrl (RW) ---
`define CSR_CTRL_START_BIT    0   // [0]: Write 1 to start the engine.

// --- csr_status (RO) ---
`define CSR_STATUS_BUSY_BIT     0   // [0]: 1 if the engine is busy, 0 if idle.
`define CSR_STATUS_DONE_BIT     1   // [1]: 1 if the engine has finished one task (sticky).
`define CSR_STATUS_DMA_ERR_BIT  8   // [8]: 1 if a DMA Error occurred.
`define CSR_STATUS_MAC_ERR_BIT  9   // [9]: 1 if a MAC Error occurred.


module CB_Controller (
    // Global Clock and Reset
    input               clk,
    input               rst_n,

    // --- Interfaces to Internal Engines ---
    // DMA Controller Interface
    output reg          dma_start,
    output reg  [31:0]  dma_addr,   //数据地址
    output reg  [31:0]  dma_len,    //传输数据长度
    output reg          dma_dir,    //ram2ddr&ddr2ram
    input               dma_done,
    input               dma_error,

    // MAC Engine Interface
    output reg          mac_start,
    input               mac_done,
    input               mac_error,

    // --- AXI4-Lite Slave Bus ---
    //aw
    input       [4:0]   s_awid,
    input       [31:0]  s_awaddr,
    input       [7:0]   s_awlen,
    input       [2:0]   s_awsize,
    input       [1:0]   s_awburst,
    input               s_awlock,
    input       [3:0]   s_awcache,
    input       [2:0]   s_awprot,
    input               s_awvalid,
    output              s_awready,
    //w
    input       [31:0]  s_wdata,
    input       [3:0]   s_wstrb,
    input               s_wlast,
    input               s_wvalid,
    output reg          s_wready,
    //b
    output      [4:0]   s_bid,
    output      [1:0]   s_bresp,
    output reg          s_bvalid,
    input               s_bready,
    //ar
    input       [4:0]   s_arid,
    input       [31:0]  s_araddr,
    input       [7:0]   s_arlen,
    input       [2:0]   s_arsize,
    input       [1:0]   s_arburst,
    input               s_arlock,
    input       [3:0]   s_arcache,
    input       [2:0]   s_arprot,
    input               s_arvalid,
    output              s_arready,
    //r
    output      [4:0]   s_rid,
    output reg  [31:0]  s_rdata,
    output      [1:0]   s_rresp,
    output reg          s_rlast,
    output reg          s_rvalid,
    input               s_rready
);

//======================================================================
//==                 Control and Status Registers (CSRs)              ==
//======================================================================
reg [31:0] csr_ctrl, csr_status, csr_err_code;
reg [31:0] csr_vi_base, csr_mi_base, csr_vo_base;
reg [31:0] csr_rows, csr_cols;

//======================================================================
//==                  AXI4-Lite Slave Interface Logic                 ==
//======================================================================
//Axi interface state
//Axi_R_or_W read true
reg Axi_busy,Axi_write,Axi_R_or_W;

reg [31:0] rdata_d;

//addr hs
wire ar_enter = s_arvalid & s_arready;
wire aw_enter = s_awvalid & s_awready;

wire r_retire = s_rvalid & s_rready & s_rlast;
wire w_enter  = s_wvalid & s_wready & s_wlast;
wire b_retire = s_bvalid & s_bready;

//only one transaction inflight
assign s_arready = ~Axi_busy & (!Axi_R_or_W| !s_awvalid);
assign s_awready = ~Axi_busy & ( Axi_R_or_W| !s_arvalid);

//outstanding transaction
always@(posedge clk)
    if(~rst_n) Axi_busy <= 1'b0;
    else if(ar_enter|aw_enter) Axi_busy <= 1'b1;
    else if(r_retire|b_retire) Axi_busy <= 1'b0;

//information buffer
reg [4 :0] buf_id;
reg [31:0] buf_addr;

//useless buffer
reg [7 :0] buf_len;
reg [2 :0] buf_size;
reg [1 :0] buf_burst;
reg        buf_lock;
reg [3 :0] buf_cache;
reg [2 :0] buf_prot;


always@(posedge clk)
    if(~rst_n) begin
        Axi_R_or_W  <= 1'b0;
        buf_id      <= 'b0;
        buf_addr    <= 'b0;
        buf_len     <= 'b0;
        buf_size    <= 'b0;
        buf_burst   <= 'b0;
        buf_lock    <= 'b0;
        buf_cache   <= 'b0;
        buf_prot    <= 'b0;
    end
    else
    if(ar_enter | aw_enter) begin
        Axi_R_or_W  <= ar_enter;
        buf_id      <= ar_enter ? s_arid   : s_awid   ;
        buf_addr    <= ar_enter ? s_araddr : s_awaddr ;

        buf_len     <= ar_enter ? s_arlen  : s_awlen  ;
        buf_size    <= ar_enter ? s_arsize : s_awsize ;
        buf_burst   <= ar_enter ? s_arburst: s_awburst;
        buf_lock    <= ar_enter ? s_arlock : s_awlock ;
        buf_cache   <= ar_enter ? s_arcache: s_awcache;
        buf_prot    <= ar_enter ? s_arprot : s_awprot ;
    end

always@(posedge clk)
    if(~rst_n) Axi_write <= 1'b0;
    else if(aw_enter) Axi_write <= 1'b1;
    else if(ar_enter)  Axi_write <= 1'b0;

always@(posedge clk)
    if(~rst_n) s_wready <= 1'b0;
    else if(aw_enter) s_wready <= 1'b1;
    else if(w_enter & s_wlast) s_wready <= 1'b0;

// assign rdata_d =
//        (buf_addr[15:0] == `REG_CTRL_ADDR     ) ? csr_ctrl      :
//        (buf_addr[15:0] == `REG_STATUS_ADDR   ) ? csr_status    :
//        (buf_addr[15:0] == `REG_ERR_CODE_ADDR ) ? csr_err_code  :

//        (buf_addr[15:0] == `REG_VI_BASE_ADDR  ) ? csr_vi_base   :
//        (buf_addr[15:0] == `REG_MI_BASE_ADDR  ) ? csr_mi_base   :
//        (buf_addr[15:0] == `REG_VO_BASE_ADDR  ) ? csr_vo_base   :

//        (buf_addr[15:0] == `REG_ROWS_ADDR     ) ? csr_rows      :
//        (buf_addr[15:0] == `REG_COLS_ADDR     ) ? csr_cols      :

//                                                32'h0;          // default

always@(posedge clk)
    if(~rst_n) begin
        s_rdata  <= 'b0;
        s_rvalid <= 1'b0;
        s_rlast  <= 1'b0;
    end
    else if(Axi_busy & !Axi_write & !r_retire)
    begin
        s_rdata <= rdata_d;
        s_rvalid <= 1'b1;
        s_rlast <= 1'b1; 
    end
    else if(r_retire)
    begin
        s_rvalid <= 1'b0;
    end

always@(posedge clk)   
    if(~rst_n) s_bvalid <= 1'b0;
    else if(w_enter) s_bvalid <= 1'b1;
    else if(b_retire) s_bvalid <= 1'b0;

assign s_rid   = buf_id;
assign s_bid   = buf_id;
assign s_bresp = 2'b0;
assign s_rresp = 2'b0;

//======================================================================
//==              Core Finite State Machine (FSM)                     ==
//======================================================================
parameter   S_IDLE         = 4'd0, 
            S_DMA_VI       = 4'd1, 
            S_WAIT_VI_DONE = 4'd2,
            S_DMA_MI       = 4'd3, 
            S_WAIT_MI_DONE = 4'd4, 
            S_COMPUTE      = 4'd5,
            S_WAIT_COMPUTE = 4'd6, 
            S_DMA_VO       = 4'd7, 
            S_WAIT_VO_DONE = 4'd8,
            S_DONE         = 4'd9, 
            S_ERROR        = 4'd10;

reg [3:0] state, next_state;

wire start_signal = csr_ctrl[`CSR_CTRL_START_BIT];
// wire error = dma_error | mac_error;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) state <= S_IDLE;
    else state <= next_state;
end

always @(*) begin
    next_state = state;
    dma_start = 1'b0;
    dma_addr = 32'h0;
    dma_len = 32'h0;
    dma_dir = 1'b0;
    mac_start = 1'b0;

    case (state)
        S_IDLE: if (start_signal) next_state = S_DMA_VI;
        S_DMA_VI: begin
            dma_start = 1'b1; dma_addr = csr_vi_base; dma_len = csr_cols; dma_dir = 1'b0;
            next_state = S_WAIT_VI_DONE;
        end
        S_WAIT_VI_DONE: if (dma_error) next_state = S_ERROR; else if (dma_done) next_state = S_DMA_MI;
        S_DMA_MI: begin
            dma_start = 1'b1; dma_addr = csr_mi_base; dma_len = csr_rows * csr_cols; dma_dir = 1'b0;
            next_state = S_WAIT_MI_DONE;
        end
        S_WAIT_MI_DONE: if (dma_error) next_state = S_ERROR; else if (dma_done) next_state = S_COMPUTE;
        S_COMPUTE: begin
            mac_start = 1'b1; next_state = S_WAIT_COMPUTE;
        end
        S_WAIT_COMPUTE: if (mac_error) next_state = S_ERROR; else if (mac_done) next_state = S_DMA_VO;
        S_DMA_VO: begin
            dma_start = 1'b1; dma_addr = csr_vo_base; dma_len = csr_rows; dma_dir = 1'b1;
            next_state = S_WAIT_VO_DONE;
        end
        S_WAIT_VO_DONE: if (dma_error) next_state = S_ERROR; else if (dma_done) next_state = S_DONE;
        S_DONE: if (!start_signal) next_state = S_IDLE;
        S_ERROR: if (!start_signal) next_state = S_IDLE;
        default: next_state = S_IDLE;
    endcase
end

//======================================================================
//==                       CSR Read/Write Logic                       ==
//======================================================================

// --- CSR Status Updates ---
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        csr_status <= 32'h0;
    end else begin
        // Update BUSY bit
        csr_status[`CSR_STATUS_BUSY_BIT] <= (state != S_IDLE);

        // Set DONE bit
        if (state == S_DONE) csr_status[`CSR_STATUS_DONE_BIT] <= 1'b1;
        
        // Set ERROR bits
        if (dma_error) csr_status[`CSR_STATUS_DMA_ERR_BIT] <= 1'b1;
        if (mac_error) csr_status[`CSR_STATUS_MAC_ERR_BIT] <= 1'b1;

        // Clear sticky bits (DONE, ERROR) when CPU writes to CTRL register
        if (w_enter && buf_addr[15:0] == `REG_CTRL_ADDR) begin
            csr_status[`CSR_STATUS_DONE_BIT]     <= 1'b0;
            csr_status[`CSR_STATUS_DMA_ERR_BIT]  <= 1'b0;
            csr_status[`CSR_STATUS_MAC_ERR_BIT]  <= 1'b0;
        end
    end
end

// --- CSR Read Mux ---
always @(*) begin
    case(buf_addr[15:0])
        `REG_CTRL_ADDR     : rdata_d = csr_ctrl;
        `REG_STATUS_ADDR   : rdata_d = csr_status;
        `REG_ERR_CODE_ADDR : rdata_d = csr_err_code;
        `REG_VI_BASE_ADDR  : rdata_d = csr_vi_base;
        `REG_MI_BASE_ADDR  : rdata_d = csr_mi_base;
        `REG_VO_BASE_ADDR  : rdata_d = csr_vo_base;
        `REG_ROWS_ADDR     : rdata_d = csr_rows;
        `REG_COLS_ADDR     : rdata_d = csr_cols;
        default: rdata_d = 32'h0;
    endcase
end

// --- CSR Write Logic ---
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        csr_ctrl    <= 32'h0;
        csr_vi_base <= 32'h0;   //status与err设为read-only
        csr_mi_base <= 32'h0;
        csr_vo_base <= 32'h0;
        csr_rows    <= 32'h0;
        csr_cols    <= 32'h0;
        csr_err_code<= 32'h0;
    end else if (w_enter) begin
        case(buf_addr[15:0])
            `REG_CTRL_ADDR     : csr_ctrl    <= s_wdata;
            `REG_VI_BASE_ADDR  : csr_vi_base <= s_wdata;
            `REG_MI_BASE_ADDR  : csr_mi_base <= s_wdata;
            `REG_VO_BASE_ADDR  : csr_vo_base <= s_wdata;
            `REG_ROWS_ADDR     : csr_rows    <= s_wdata;
            `REG_COLS_ADDR     : csr_cols    <= s_wdata;
            default : ;
        endcase
    end
end

endmodule
