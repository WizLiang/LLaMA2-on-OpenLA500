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
    
    //Debug Interface
    output  [3:0]       debug_state,
    output wire [31:0]  current_cols,

    //add
    // input mat_write_finished, // MAC模块写完成信号

    // --- Interfaces to Internal Engines ---
    // DMA Controller Interface
    output  reg             cmd_valid,  // DMA 命令有效
    input   wire            cmd_ready,  // dma控制器就绪
    output  reg     [31: 0] cmd_src_addr,
    output  reg     [31: 0] cmd_dst_addr,
    output  reg     [1:0]   cmd_burst,  //00 INCR
    output  reg             cmd_rw, // 0 = r
    output  reg     [10:0]  cmd_len,    //TODO 可能需要扩大
    input   wire            dma_done,
    output  wire            ctrl_done, 
    output reg [8:0] cmd_block_size,
    output reg [6:0] cmd_block_count,
    output reg [10:0] cmd_stride,
    output reg cmd_padding_en,
    output reg [7:0] cmd_padding_words,

    // MAC Engine Interface
    output reg          mac_start,
    input               mac_done,
    input               mac_error,
    output reg          mac_access_mode, // 连接到 mac_top 的 dma_access_mode
    output reg  [1:0]   dma_target_sram, // 00=Vec, 01=Weight, 10=Out
    output reg          acc_en,
    output reg          w_mem_rst,    // 内存复位信号 
    output reg          v_mem_rst,    // 内存复位信号

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

// --- 硬件能力参数 (Hardware Capability) ---
localparam HW_ROWS = 32; // 硬件引擎一次能处理的行数
localparam HW_COLS = 64; // 硬件引擎一次能处理的列数

reg [HW_ROWS * 32 - 1:0] partial_sum_buffer;
// --- 动态计算和控制寄存器 ---
reg [15:0] num_tiles_reg;        // 锁存当前任务需要的块数
reg [15:0] tile_cnt;             // 当前处理的是第几个块 (外循环计数器)
// wire [HW_ROWS * 32 - 1:0] adder_result = mac_result + partial_sum_buffer;


//======================================================================
//==                         硬件分块寄存器                            ==
//======================================================================

//TODO 当前情况建立在cpu停顿不会继续写入任务参数，因此可以直接使用csr参数
// 如果cpu非停顿，则需要锁存参数

reg [31:0] row_offset_counter; // 已处理的行数偏移量

// 当前块的动态参数
wire [31:0] remaining_rows = csr_rows - row_offset_counter;
wire [31:0] remaining_cols = csr_cols - (tile_cnt * HW_COLS); // 当前块剩余列数
wire [31:0] current_rows;
// wire [31:0] current_cols;

// 计算当前块的行数，处理最后不足32行的边界情况
assign current_rows = (remaining_rows >= HW_ROWS) ? HW_ROWS : remaining_rows;
assign current_cols = (remaining_cols >= HW_COLS) ? HW_COLS : remaining_cols;

// 计算当前块的地址
wire [31:0] current_mi_addr = csr_mi_base + (row_offset_counter * csr_cols * 4) + (tile_cnt * HW_COLS * 4);   //单位为字节数
wire [31:0] current_vi_addr = csr_vi_base + (tile_cnt * HW_COLS * 4); //单位为字节数
wire [31:0] current_vo_addr = csr_vo_base + (row_offset_counter * 4); //单位为字节数

//DMA分块所需寄存器
reg [31:0] dma_bytes_total;       // 当前DMA任务需要传输的总字节数
reg [31:0] dma_bytes_transferred; // 在当前DMA任务中已传输的字节数
reg [31:0] dma_current_src_addr;  // 当前DMA传输块的源地址
reg [31:0] dma_current_dst_addr;  // 当前DMA传输块的目的地址

wire [31:0] dma_bytes_remaining = dma_bytes_total - dma_bytes_transferred;
wire [10:0]  dma_chunk_len;         // 本次DMA传输的长度 (Chunk)

localparam MAX_DMA_LEN = 1024;  //单次最多传输128个浮点数，即512字节
// 动态计算本次小块传输的长度
assign dma_chunk_len = (dma_bytes_remaining >= MAX_DMA_LEN) ? MAX_DMA_LEN : dma_bytes_remaining[10:0];
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


assign ctrl_done = (state == S_DONE) ? 1 : 0;

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
        s_rlast  <= 1'b0;
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
parameter   S_IDLE         = 5'd0, 
            S_DMA_VI       = 5'd1, 
            S_WAIT_VI_DONE = 5'd2,
            S_LOOP_START   = 5'd3,
            S_DMA_MI_INIT  = 5'd4, // 初始化循环状态
            S_DMA_MI_ISSUE = 5'd5,
            S_DMA_MI_WAIT  = 5'd6, 
            S_COMPUTE      = 5'd7,
            S_WAIT_COMPUTE = 5'd8, 
            S_DMA_VO       = 5'd9, 
            S_WAIT_VO_DONE = 5'd10,
            S_UPDATE_OFFSET = 5'd11,
            S_DONE         = 5'd12, 
            S_ERROR        = 5'd13,
            S_DMA_VO_INIT = 5'd14, // 新增状态，用于初始化输出向量
            S_ACCUMULATE   = 5'd15,  // 新增状态，用于累加结果
            S_CHECK_LOOP   = 5'd16;  // 新增状态，用于检查是否需要继续循环

reg [4:0] state, next_state;

wire start_signal = csr_ctrl[`CSR_CTRL_START_BIT];
// wire error = dma_error | mac_error;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) state <= S_IDLE;
    else state <= next_state;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        row_offset_counter <= 32'h0;
        dma_bytes_transferred <= 32'h0;
        dma_current_src_addr <= 32'h0;
        dma_current_dst_addr <= 32'h0;
        tile_cnt <= 0;
        acc_en <= 1'b0;
        num_tiles_reg <= 1'b0;
        // mem_rst <= 1'b0; // 内存复位信号
        
    end else begin

        if (state == S_DMA_MI_INIT) begin
            num_tiles_reg      <= (csr_cols + HW_COLS - 1) / HW_COLS;
            dma_bytes_transferred <= 32'h0; // 初始化DMA传输计数器
            dma_current_src_addr <= current_mi_addr; // 初始化源地址
        end 
        else if ((state == S_DMA_MI_WAIT) && (next_state == S_DMA_MI_ISSUE)) begin  //第一个信号传输完毕
            dma_bytes_transferred <= dma_bytes_transferred + dma_chunk_len;
            // dma_current_src_addr <= dma_current_src_addr + dma_chunk_len;   //TODO 开始地址
        end

        // if (state == S_WAIT_COMPUTE) begin
        //     // 等待计算完成
        //     if (mac_done) begin
        //         mem_rst <= 1'b1;    // 计算完成后复位内存
        //     end
        // end

        if (state == S_ACCUMULATE) begin
            acc_en <= 1'b1; // 开始累加
        end

        if (state == S_CHECK_LOOP) begin
            if (tile_cnt < num_tiles_reg - 1) begin
                tile_cnt <= tile_cnt + 1; // 增加块计数器
            end else begin
                tile_cnt <= 0; // 重置块计数器
            end
        end

        if (state == S_DMA_VO_INIT) begin   //1次即可输出完毕
            dma_current_dst_addr <= current_vo_addr; // 输出向量的地址
        end

        if (state == S_IDLE && next_state != S_IDLE) begin
            // 当从IDLE启动新任务时，清零计数器
            row_offset_counter <= 32'h0;
        end else if (state == S_UPDATE_OFFSET) begin
            // 仅在 S_UPDATE_OFFSET 状态的下一个时钟沿更新
            row_offset_counter <= row_offset_counter + current_rows;
            acc_en <= 1'b0; // 停止累加
        end

    end
end

always @(*) begin
    // Default assignments
    next_state   = state;
    cmd_valid    = 1'b0;
    cmd_src_addr = dma_current_src_addr;
    cmd_dst_addr = dma_current_dst_addr;
    cmd_rw       = 1'b0; // Default to read
    cmd_burst    = 2'b00; // INCR
    cmd_len      = dma_chunk_len;   //TODO: 目前传输32字节,8个浮点
    mac_start    = 1'b0;
    mac_access_mode = 1'b0; // mac_access_mode 0的时候进行计算操作并将结果写到ram中，以及从主存写到ram中，1的时候从outram中读数据，将数据写入2个buffer
    dma_target_sram = 2'b00; // 00=Vec
    dma_bytes_total = 32'h0; // 初始化DMA总字节数
    w_mem_rst = 1'b0; // 内存复位信号
    v_mem_rst = 1'b0; // 内存复位信号
    cmd_block_size = 0;
    cmd_block_count = 0;
    cmd_stride = 0;
    cmd_padding_en = 1'b0; // 不需要填充
    cmd_padding_words = 0; // 不需要填充

    case (state)
        S_IDLE: begin
             // 内存复位信号
            if (start_signal) begin 
                w_mem_rst = 1'b1;
                v_mem_rst = 1'b1;
                next_state = S_DMA_VI;
            end
        end
        // 向量加载仅在开始的时候加载一次即可
        S_DMA_VI: begin
            mac_access_mode = 1'b1; // 取数据
            dma_target_sram = 2'b00; // 00=Vec
            cmd_valid = 1'b1;
            cmd_src_addr = current_vi_addr; //ddr中的地址
            cmd_rw = 1'b0;  //read
            cmd_len = current_cols * 4; // cols个32位浮点数
            cmd_block_size = current_cols * 4; // cols个32位浮点数
            cmd_block_count = 0; // 计算需要多少个块
            cmd_stride = 0; // 目前不需要步长
            cmd_padding_en = 1'b0; // 不需要填充
            cmd_padding_words = 0; // 不需要填充
            if (cmd_ready) begin //dma控制器准备
                next_state = S_WAIT_VI_DONE;
            end
        end
        S_WAIT_VI_DONE: begin
            mac_access_mode = 1'b1; // 取数据
            dma_target_sram = 2'b00; // 00=Vec
            if (dma_done) begin //remove error
                next_state = S_LOOP_START; // 进入循环处理状态
            end
        end

        S_LOOP_START: begin // 每次循环的起点
            if (row_offset_counter >= csr_rows) begin
                next_state = S_DONE; // 所有行都已处理完毕，任务完成
            end else begin
                next_state = S_DMA_MI_INIT; // 还有行需要处理，开始加载下一个权重块
            end
        end

        S_DMA_MI_INIT: begin
            mac_access_mode = 1'b1; // 取数据
            dma_target_sram = 2'b01; // 01=Weight
            dma_bytes_total = current_rows * current_cols * 4; // 当前块的总字节数
            // dma_current_src_addr = current_mi_addr;
            next_state = S_DMA_MI_ISSUE; // 进入DMA传输状态
        end
        S_DMA_MI_ISSUE: begin
            mac_access_mode = 1'b1; // 取数据
            dma_target_sram = 2'b01; // 01=Weight
            dma_bytes_total = current_rows * current_cols * 4;
            
            cmd_valid = 1'b1;
            cmd_rw = 1'b0; // Read from DDR
                
            if (csr_cols > 64) begin
                cmd_block_size = current_cols * 4; // 当前块的总字节数
                cmd_block_count = HW_ROWS-1; // 计算需要多少个块
                cmd_stride = csr_cols * 4; // 目前不需要步长
                if (current_cols < HW_COLS) begin
                    cmd_padding_en = 1'b1; // 需要填充
                    cmd_padding_words = num_tiles_reg * HW_COLS - csr_cols; // 需要填充的字数
                end
                else begin
                    cmd_padding_en = 1'b0; // 不需要填充
                    cmd_padding_words = 0; // 不需要填充
                end
            end else begin
                cmd_block_size = HW_COLS * 4; // 当前块的总字节数
                cmd_block_count = current_rows - 1; // 当前块的总字节数
                cmd_stride = 'd256; // 目前不需要步长
                cmd_padding_en = 1'b0; // 不需要填充
                cmd_padding_words = 0; // 不需要填充
            end

            if (cmd_ready) next_state = S_DMA_MI_WAIT; // 等待DMA传输完成
        end
        S_DMA_MI_WAIT: begin
            mac_access_mode = 1'b1; // 取数据
            dma_target_sram = 2'b01;
            dma_bytes_total = current_rows * csr_cols * 4;
            // cmd_len = current_rows * csr_cols * 4; // 128字节，32个浮点数
            if (dma_done) begin //remove error
                next_state = S_COMPUTE;
            end
        end
        S_COMPUTE: begin
            dma_target_sram = 2'b01; // TODO 待修改
            mac_access_mode = 1'b0; // 计算模式
            mac_start = 1'b1; 
            next_state = S_WAIT_COMPUTE;
        end
        S_WAIT_COMPUTE: begin
            if (mac_error) begin 
                next_state = S_ERROR; 
            end
            else if (mac_done && csr_cols > 64) begin 
                w_mem_rst = 1'b1; // 计算完成后复位内存
                v_mem_rst = 1'b1; // 计算完成后复位内存
                next_state = S_ACCUMULATE;
            end
            else if (mac_done) begin
                // mem_rst = 1'b1; // 计算完成后复位内存
                w_mem_rst = 1'b1; // 计算完成后复位内存
                //由于需要复用，不清除vmem
                next_state = S_DMA_VO_INIT; // 计算完成，进入输出状态
            end
        end
        S_ACCUMULATE: begin
            next_state = S_CHECK_LOOP; // 累加完成后进入输出状态
        end
        S_CHECK_LOOP: begin
            // 检查是否需要继续循环处理
            if (tile_cnt >= num_tiles_reg - 1) next_state = S_DMA_VO_INIT;
            else next_state = S_DMA_VI;
        end
        S_DMA_VO_INIT: begin    //从out sram写到主存
            mac_access_mode = 1'b1; // 取数据
            dma_target_sram = 2'b10; // 10=Output
            // cmd_dst_addr = current_vo_addr;
            cmd_len      = current_rows * 4; // 当前块的总字节数
            next_state = S_DMA_VO; // 进入DMA传输状态
        end
        S_DMA_VO: begin
            mac_access_mode = 1'b1; // 输出模式
            dma_target_sram = 2'b10; // 10=Output
            cmd_valid    = 1'b1;
            // cmd_dst_addr = current_vo_addr;
            cmd_len      = current_rows * 4; // 输出行数 * 4字节
            cmd_rw       = 1'b1; // Write to DDR
            if (cmd_ready) begin
                next_state = S_WAIT_VO_DONE;
            end
        end
        S_WAIT_VO_DONE: begin
            dma_target_sram = 2'b10; // 10=Output
            cmd_rw       = 1'b1; // Write to DDR
            if (dma_done) begin //TODO 增加循环判断
                next_state = S_UPDATE_OFFSET;
            end
        end

        S_UPDATE_OFFSET: begin
            if (csr_cols > 64) begin
                next_state = S_DMA_VI; // 重新加载向量
            end else begin
                next_state = S_LOOP_START; // 返回循环起点
            end
        end

        S_DONE: begin
            if (!start_signal) begin
                next_state = S_IDLE;
            end
        end
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
        if ((state == S_DONE) && (start_signal == 1)) csr_status[`CSR_STATUS_DONE_BIT] <= 1'b1;
        
        // Set ERROR bits
        // if (dma_error) csr_status[`CSR_STATUS_DMA_ERR_BIT] <= 1'b1;
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

//Debug signal 
assign debug_state = state;


endmodule
