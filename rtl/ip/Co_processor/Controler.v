
`define REG_CTRL_ADDR 16'h0000
`define REG_STATUS_ADDR 16'h0004
`define REG_ERR_CODE_ADDR 16'h0008
`define REG_VI_BASE_ADDR 16'h0010
`define REG_MI_BASE_ADDR 16'h0014
`define REG_VO_BASE_ADDR 16'h0018

`define REG_ROWS_ADDR 16'h0020
`define REG_COLS_ADDR 16'h0024





module CB_Controler (

    //clk & rst
    input clk,
    input rst_n,

    //TODO: DMA_Ctrl

    //TODO: MAC_Engine


    //TODO: Debug
    
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
    input           s_rready


);
//CSRs
reg [31:0] csr_ctrl, csr_status, csr_err_code;
reg [31:0] csr_vi_base, csr_mi_base, csr_vo_base;
reg [31:0] csr_rows, csr_cols;



/*     Axi interface   */

//Axi interface state
//Axi_R_or_W read true
reg Axi_busy,Axi_write,Axi_R_or_W;


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


//r
always @(*)begin
    case(buf_addr[15:0])
        `REG_CTRL_ADDR     : rdata_d = csr_ctrl;        // CTRL   (RW)
        `REG_STATUS_ADDR   : rdata_d = csr_status;      // STATUS (RO)
        `REG_ERR_CODE_ADDR : rdata_d = csr_err_code;    // ERR_CODE (RO)

        `REG_VI_BASE_ADDR  : rdata_d = csr_vi_base;     // VEC_BASE (W)
        `REG_MI_BASE_ADDR  : rdata_d = csr_mi_base;     // MAT_BASE (W)
        `REG_VO_BASE_ADDR  : rdata_d = csr_vo_base;     // OUT_BASE (W)

        `REG_ROWS_ADDR     : rdata_d = csr_rows;        // ROWS (W)
        `REG_COLS_ADDR     : rdata_d = csr_cols;        // COLS (W)
    default :rdata_d = 16'h0;
    endcase
end


always @(posedge clk)begin
    if(!rst_n)begin
        csr_ctrl      <= 32'h0;
        csr_status    <= 32'h0; // 多数 STATUS 为 RO，可不复位
        csr_err_code  <= 32'h0;
        csr_vi_base   <= 32'h0;
        csr_mi_base   <= 32'h0;
        csr_vo_base   <= 32'h0;
        csr_rows      <= 32'h0;
        csr_cols      <= 32'h0;
    end else if(w_enter)begin
        case(buf_addr[15:0])
            `REG_CTRL_ADDR     : csr_ctrl <= s_wdata;        // CTRL   (RW)
            //`REG_STATUS_ADDR   : ;      // STATUS (RO)
            //`REG_ERR_CODE_ADDR : ;    // ERR_CODE (RO)

            `REG_VI_BASE_ADDR  : csr_vi_base <= s_wdata;     // VEC_BASE (W)
            `REG_MI_BASE_ADDR  : csr_mi_base <= s_wdata;     // MAT_BASE (W)
            `REG_VO_BASE_ADDR  : csr_vo_base <= s_wdata;     // OUT_BASE (W)

            `REG_ROWS_ADDR     : csr_rows   <= s_wdata;        // ROWS (W)
            `REG_COLS_ADDR     : csr_cols   <= s_wdata;        // COLS (W)
        default :;
    endcase
    end
end





endmodule