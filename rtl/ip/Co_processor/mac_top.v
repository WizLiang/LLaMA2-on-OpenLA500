`timescale 1ns / 1ps
//****************************************************************************
// Description:
// Top-level module with corrected logic for writing results to an SRAM.
//****************************************************************************
module mac_top #(
    parameter ARRAY_SIZE      = 32,
    parameter SRAM_DATA_WIDTH = 1024,         // 32*32=1024
    parameter DATA_WIDTH      = 32,           // 32-bit floating point
    parameter K_ACCUM_DEPTH   = 64,           // Accumulation depth for MAC operations
    parameter OUTCOME_WIDTH   = 32,           // Output 32-bit floating point
    parameter SRAM_W_DEPTH    = K_ACCUM_DEPTH,// Depth of the weight SRAM
    parameter SRAM_V_DEPTH    = K_ACCUM_DEPTH, // Depth of the vector SRAM
    // Added a parameter for the depth of the outcome SRAM for clarity
    parameter SRAM_O_DEPTH    = 2,
    parameter MAC_LATENCY = 4
)
(
    input  clk,
    input  srstn,
    input  start_processing, // Top-level start signal
    input  dma_access_mode, // DMA access 0=计算 1=加载
    // -- DMA 写接口 (用于加载 Weight 和 Vector) --
    // Weight SRAM
    input  dma_w_sram_we,
    input  [$clog2(SRAM_W_DEPTH)-1:0] dma_w_sram_waddr,
    input  [SRAM_DATA_WIDTH-1:0]    dma_w_sram_wdata,
    // Vector SRAM
    input  dma_v_sram_we,
    input  [$clog2(SRAM_V_DEPTH)-1:0] dma_v_sram_waddr,
    input  [DATA_WIDTH-1:0]         dma_v_sram_wdata,
    // -- DMA 读接口 --
    input  [$clog2(SRAM_O_DEPTH)-1:0] dma_o_sram_raddr, // DMA提供的读地址
    output [SRAM_DATA_WIDTH-1:0]    dma_o_sram_rdata,   // 从Outcome SRAM读出的数据
    output processing_done,  //TODO 适配控制器模块，缺失error模块
    output [15:0] debug_data
);

    // Internal signals for controlling the PE core
    reg         alu_start_reg;
    reg  [8:0]  cycle_num_reg;

    // Wires to connect SRAMs to the PE core
    wire [SRAM_DATA_WIDTH-1:0] sram_rdata_w_wire;
    wire [DATA_WIDTH-1:0]      sram_rdata_v_wire;
    wire [(ARRAY_SIZE * OUTCOME_WIDTH) - 1:0] final_result_wire;

    assign debug_data = final_result_wire [15:0];

    // Address registers for input SRAMs
    reg [$clog2(SRAM_W_DEPTH)-1:0] sram_w_addr;
    reg [$clog2(SRAM_V_DEPTH)-1:0] sram_v_addr;

    // --- Wires for Serializer Connections (now narrow) ---
    wire sram_we_from_serializer;
    wire [SRAM_DATA_WIDTH-1:0] sram_wdata_from_serializer;
    wire [$clog2(ARRAY_SIZE)-1:0] sram_waddr_from_serializer;

    // --- Wires for SRAM read/write operations ---
    wire final_wsb_w, final_wsb_v, final_wsb_o;
    wire [$clog2(SRAM_W_DEPTH)-1:0] final_raddr_w;
    wire [$clog2(SRAM_V_DEPTH)-1:0] final_raddr_v;
    wire [$clog2(SRAM_O_DEPTH)-1:0] final_raddr_o;

    // SRAM 读地址切换
    assign final_raddr_w = (dma_access_mode) ? 'd0 : sram_w_addr; // 0模式（计算）下读，1模式下加载数据
    assign final_raddr_v = (dma_access_mode) ? 'd0 : sram_v_addr; // 0模式（计算）下读，1模式下加载数据
    assign final_raddr_o = (dma_access_mode) ? dma_o_sram_raddr : 0; // 计算模式下不读，1模式下读取


    //========================================================================
    // INSTANTIATION OF SUB-MODULES
    //========================================================================
    // NOTE: Assuming the use of the 'sram' module created earlier.

    // Instantiate the weight SRAM (for Matrix A)
    sram #(
        .DATA_WIDTH(SRAM_DATA_WIDTH),
        .ADDR_WIDTH($clog2(SRAM_W_DEPTH)),
        .INIT_FILE("D://IC//Matrix_coaccelerator//vsrc//weights.mem")
    ) sram_w_inst (
        .clk(clk),
        .csb(1'b0), // Chip select is always active for simplicity
        .wsb(~(dma_access_mode & dma_w_sram_we)), // 只有在DMA模式且DMA写使能时才写
        .wdata(dma_w_sram_wdata),
        .waddr(dma_w_sram_waddr),
        .raddr(final_raddr_w),
        .rdata(sram_rdata_w_wire)
    );

    // Instantiate the vector SRAM (for Vector B)
    sram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH($clog2(SRAM_V_DEPTH)),
        .INIT_FILE("D://IC//Matrix_coaccelerator//vsrc//vector.mem")
    ) sram_v_inst (
        .clk(clk),
        .csb(1'b0),
        .wsb(~(dma_access_mode & dma_v_sram_we)), // Write disabled (read-only)
        .wdata(dma_v_sram_wdata),
        .waddr(dma_v_sram_waddr),
        .raddr(final_raddr_v),
        .rdata(sram_rdata_v_wire)
    );

    // --- Final Outcome SRAM (with standard 32-bit width) ---
    sram #(
        .DATA_WIDTH(SRAM_DATA_WIDTH),   //改为高位宽输出
        .ADDR_WIDTH(1)
    ) sram_outcome_inst (
        .clk(clk), 
        .csb(1'b0), 
        .wsb(~(~dma_access_mode & sram_we_from_serializer)), 
        .wdata(sram_wdata_from_serializer), 
        .waddr(sram_waddr_from_serializer), 
        .raddr(final_raddr_o), 
        .rdata(dma_o_sram_rdata)
    );

    // Instantiate the PE core
    (* DONT_TOUCH = "true" *)
    PE_core #(
        .ARRAY_SIZE(ARRAY_SIZE),
        .SRAM_DATA_WIDTH(SRAM_DATA_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .K_ACCUM_DEPTH(K_ACCUM_DEPTH),
        .OUTCOME_WIDTH(OUTCOME_WIDTH),
        .MAC_LATENCY(MAC_LATENCY)
    ) PE_core_inst (
        .clk(clk),
        .srstn(srstn),
        .alu_start(alu_start_reg),
        .cycle_num(cycle_num_reg),
        .sram_rdata_w(sram_rdata_w_wire),
        .sram_rdata_v(sram_rdata_v_wire),
        .mul_outcome(final_result_wire)
    );

    // Instantiate the new serializer write_out module
    write_out #( 
        .ARRAY_SIZE(ARRAY_SIZE), 
        .DATA_WIDTH(DATA_WIDTH), 
        .K_ACCUM_DEPTH(K_ACCUM_DEPTH),
        .MAC_LATENCY(MAC_LATENCY)
    ) write_out_inst (
        .clk(clk),
        .srstn(srstn),
        .sram_write_enable(alu_start_reg),
        .cycle_num(cycle_num_reg),
        .parallel_data_in(final_result_wire),
        .sram_we(sram_we_from_serializer),
        .sram_wdata(sram_wdata_from_serializer),
        .sram_waddr(sram_waddr_from_serializer)
    );

    //========================================================================
    // CONTROL LOGIC
    //========================================================================
    localparam ACCUM_DONE_CYCLE = K_ACCUM_DEPTH;
    localparam WRITE_DONE_CYCLE = K_ACCUM_DEPTH + MAC_LATENCY + 3;   //TODO 需要修改，当前写入逻辑较慢

    assign processing_done = (cycle_num_reg == WRITE_DONE_CYCLE);

    always @(posedge clk or negedge srstn) begin
        if (!srstn) begin
            cycle_num_reg <= 0;
            alu_start_reg <= 0;
            sram_w_addr   <= 0;
            sram_v_addr   <= 0;
        end else begin
            if (start_processing && cycle_num_reg == 0) begin
                // Start a new operation
                alu_start_reg <= 1'b1;
                cycle_num_reg <= cycle_num_reg + 1;
                sram_w_addr   <= sram_w_addr + 1;
                sram_v_addr   <= sram_v_addr + 1;
            end else if (alu_start_reg) begin
                if (cycle_num_reg == WRITE_DONE_CYCLE) begin
                    // Entire operation finished
                    alu_start_reg <= 1'b0;
                    cycle_num_reg <= 0;
                end else if (cycle_num_reg < ACCUM_DONE_CYCLE) begin
                    // Accumulation Phase
                    cycle_num_reg <= cycle_num_reg + 1;
                    sram_w_addr   <= sram_w_addr + 1;
                    sram_v_addr   <= sram_v_addr + 1;
                end else begin
                    // Write-out Phase (just increment cycle counter)
                    cycle_num_reg <= cycle_num_reg + 1;
                end
            end
        end
    end

endmodule
