/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Copyright (c) 2016, Loongson Technology Corporation Limited.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this 
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3. Neither the name of Loongson Technology Corporation Limited nor the names of 
its contributors may be used to endorse or promote products derived from this 
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL LOONGSON TECHNOLOGY CORPORATION LIMITED BE LIABLE
TO ANY PARTY FOR DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/

module axi_wrap_ram_sp_ext (
    input         aclk,
    input         aresetn,
    //ar
    input  [4 :0] axi_arid   ,
    input  [31:0] axi_araddr ,
    input  [7 :0] axi_arlen  ,
    input  [2 :0] axi_arsize ,
    input  [1 :0] axi_arburst,
    input  [1 :0] axi_arlock ,
    input  [3 :0] axi_arcache,
    input  [2 :0] axi_arprot ,
    input         axi_arvalid,
    output        axi_arready,
    //r
    output [4 :0] axi_rid    ,
    output [31:0] axi_rdata  ,
    output [1 :0] axi_rresp  ,
    output        axi_rlast  ,
    output        axi_rvalid ,
    input         axi_rready ,
    //aw
    input  [4 :0] axi_awid   ,
    input  [31:0] axi_awaddr ,
    input  [7 :0] axi_awlen  ,
    input  [2 :0] axi_awsize ,
    input  [1 :0] axi_awburst,
    input  [1 :0] axi_awlock ,
    input  [3 :0] axi_awcache,
    input  [2 :0] axi_awprot ,
    input         axi_awvalid,
    output        axi_awready,
    //w
    input  [31:0] axi_wdata  ,
    input  [3 :0] axi_wstrb  ,
    input         axi_wlast  ,
    input         axi_wvalid ,
    output        axi_wready ,
    //b
    output [4 :0] axi_bid    ,
    output [1 :0] axi_bresp  ,
    output        axi_bvalid ,
    input         axi_bready ,

    //BaseRAM信号
    inout  [31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共享
    output [19:0] base_ram_addr, //BaseRAM地址
    output [ 3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output  base_ram_ce_n,       //BaseRAM片选，低有效
    output  base_ram_oe_n,       //BaseRAM读使能，低有效
    output  base_ram_we_n,       //BaseRAM写使能，低有效

    //ExtRAM信号
    inout  [31:0] ext_ram_data,  //ExtRAM数据
    output [19:0] ext_ram_addr, //ExtRAM地址
    output [ 3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持为0
    output  ext_ram_ce_n,       //ExtRAM片选，低有效
    output  ext_ram_oe_n,       //ExtRAM读使能，低有效
    output  ext_ram_we_n       //ExtRAM写使能，低有效
);


//ram axi
//ar
wire [4 :0] ram_arid   ;
wire [31:0] ram_araddr ;
wire [7 :0] ram_arlen  ;
wire [2 :0] ram_arsize ;
wire [1 :0] ram_arburst;
wire [1 :0] ram_arlock ;
wire [3 :0] ram_arcache;
wire [2 :0] ram_arprot ;
wire        ram_arvalid;
wire        ram_arready;
//r
wire [4 :0] ram_rid    ;
wire [31:0] ram_rdata  ;
wire [1 :0] ram_rresp  ;
wire        ram_rlast  ;
wire        ram_rvalid ;
wire        ram_rready ;
//aw
wire [4 :0] ram_awid   ;
wire [31:0] ram_awaddr ;
wire [7 :0] ram_awlen  ;
wire [2 :0] ram_awsize ;
wire [1 :0] ram_awburst;
wire [1 :0] ram_awlock ;
wire [3 :0] ram_awcache;
wire [2 :0] ram_awprot ;
wire        ram_awvalid;
wire        ram_awready;
//w
wire [31:0] ram_wdata  ;
wire [3 :0] ram_wstrb  ;
wire        ram_wlast  ;
wire        ram_wvalid ;
wire        ram_wready ;
//b
wire [4 :0] ram_bid    ;
wire [1 :0] ram_bresp  ;
wire        ram_bvalid ;
wire        ram_bready ;

//sram signal
wire  [31:0]    soc_sram_addr;
wire            soc_sram_cs;
wire            soc_sram_we;
wire  [3:0]     soc_sram_be;
wire  [31:0]    soc_sram_wdata;
wire  [31:0]    soc_sram_rdata;

//ar
assign ram_arid    = axi_arid   ;
assign ram_araddr  = axi_araddr ;
assign ram_arlen   = axi_arlen  ;
assign ram_arsize  = axi_arsize ;
assign ram_arburst = axi_arburst;
assign ram_arlock  = axi_arlock ;
assign ram_arcache = axi_arcache;
assign ram_arprot  = axi_arprot ;
assign ram_arvalid = axi_arvalid;
assign axi_arready = ram_arready;
//r
assign axi_rid    = axi_rvalid ? ram_rid   :  5'd0 ;
assign axi_rdata  = axi_rvalid ? ram_rdata : 32'd0 ;
assign axi_rresp  = axi_rvalid ? ram_rresp :  2'd0 ;
assign axi_rlast  = axi_rvalid ? ram_rlast :  1'd0 ;
assign axi_rvalid = ram_rvalid;
assign ram_rready = axi_rready;
//aw
assign ram_awid    = axi_awid   ;
assign ram_awaddr  = axi_awaddr ;
assign ram_awlen   = axi_awlen  ;
assign ram_awsize  = axi_awsize ;
assign ram_awburst = axi_awburst;
assign ram_awlock  = axi_awlock ;
assign ram_awcache = axi_awcache;
assign ram_awprot  = axi_awprot ;
assign ram_awvalid = axi_awvalid;
assign axi_awready = ram_awready;
//w
assign ram_wdata  = axi_wdata  ;
assign ram_wstrb  = axi_wstrb  ;
assign ram_wlast  = axi_wlast  ;
assign ram_wvalid = axi_wvalid ;
assign axi_wready = ram_wready ;
//b
assign axi_bid    = axi_bvalid ? ram_bid   : 5'd0 ;
assign axi_bresp  = axi_bvalid ? ram_bresp : 2'd0 ;
assign axi_bvalid = ram_bvalid ;
assign ram_bready = axi_bready ;


axi2sram_sp_ext #(
    .AXI_ID_WIDTH   ( 5  ),
    .AXI_ADDR_WIDTH ( 32 ),
    .AXI_DATA_WIDTH ( 32 ))
 u_axi_sram_sp (
    .clk                     ( aclk         ),
    .resetn                  ( aresetn      ),

    .s_araddr                ( ram_araddr    ),
    .s_arburst               ( ram_arburst   ),
    .s_arcache               ( ram_arcache   ),
    .s_arid                  ( ram_arid      ),
    .s_arlen                 ( ram_arlen     ),
    .s_arlock                ( ram_arlock    ),
    .s_arprot                ( ram_arprot    ),
    .s_arsize                ( ram_arsize    ),
    .s_arvalid               ( ram_arvalid   ),
    .s_awaddr                ( ram_awaddr    ),
    .s_awburst               ( ram_awburst   ),
    .s_awcache               ( ram_awcache   ),
    .s_awid                  ( ram_awid      ),
    .s_awlen                 ( ram_awlen     ),
    .s_awlock                ( ram_awlock    ),
    .s_awprot                ( ram_awprot    ),
    .s_awsize                ( ram_awsize    ),
    .s_awvalid               ( ram_awvalid   ),
    .s_bready                ( ram_bready    ),
    .s_rready                ( ram_rready    ),
    .s_wdata                 ( ram_wdata     ),
    .s_wlast                 ( ram_wlast     ),
    .s_wstrb                 ( ram_wstrb     ),
    .s_wvalid                ( ram_wvalid    ),
    .s_arready               ( ram_arready   ),
    .s_awready               ( ram_awready   ),
    .s_bid                   ( ram_bid       ),
    .s_bresp                 ( ram_bresp     ),
    .s_bvalid                ( ram_bvalid    ),
    .s_rdata                 ( ram_rdata     ),
    .s_rid                   ( ram_rid       ),
    .s_rlast                 ( ram_rlast     ),
    .s_rresp                 ( ram_rresp     ),
    .s_rvalid                ( ram_rvalid    ),
    .s_wready                ( ram_wready    ),

    .req_o                   ( soc_sram_cs       ),
    .we_o                    ( soc_sram_we       ),
    .addr_o                  ( soc_sram_addr     ),
    .be_o                    ( soc_sram_be       ),
    .data_o                  ( soc_sram_wdata    ),
    .data_i                  ( soc_sram_rdata    )
);

wire choose_sram = soc_sram_addr[22];//1:ExtRAM 0:BaseRAM
wire [3:0] be_out = soc_sram_we ? soc_sram_be : 4'b1111;

assign base_ram_addr = soc_sram_addr[21:2];
assign base_ram_be_n = choose_sram ? 4'b1111 : ~be_out;
assign base_ram_ce_n = ~(soc_sram_cs & (~choose_sram));
assign base_ram_oe_n = soc_sram_we | choose_sram;
assign base_ram_we_n = ~(soc_sram_we & (~choose_sram));
assign base_ram_data = ((~choose_sram) & soc_sram_cs & soc_sram_we) ? soc_sram_wdata : 32'hzzzzzzzz;

assign ext_ram_addr = soc_sram_addr[21:2];
assign ext_ram_be_n = choose_sram ? ~be_out : 4'b1111;
assign ext_ram_ce_n = choose_sram ? ~soc_sram_cs : 1'b1;
assign ext_ram_oe_n = choose_sram ? soc_sram_we : 1'b1;
assign ext_ram_we_n = choose_sram ? ~soc_sram_we : 1'b1;
assign ext_ram_data = ((choose_sram) & soc_sram_cs & soc_sram_we) ? soc_sram_wdata : 32'hzzzzzzzz;

assign soc_sram_rdata = choose_sram ? ext_ram_data : base_ram_data;

endmodule
