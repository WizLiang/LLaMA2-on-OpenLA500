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

module axi_wrap_ram_dp #(
    parameter Init_File = "none"
)
(
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
  input         axi_bready 
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
wire  [31:0]    fpga_sram_raddr;
wire  [31:0]    fpga_sram_rdata;
wire            fpga_sram_ren;
wire  [31:0]    fpga_sram_waddr;
wire  [31:0]    fpga_sram_wdata;
wire  [3:0]     fpga_sram_wen;


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

axi2sram_dp #(
    .BUS_WIDTH  ( 32 ),
    .DATA_WIDTH ( 32 ),
    .CPU_WIDTH  ( 32 ))
 u_axi2sram_dp (
    .aclk                    ( aclk         ),
    .aresetn                 ( aresetn      ),

    .m_araddr                ( ram_araddr   ),
    .m_arburst               ( ram_arburst  ),
    .m_arcache               ( 4'h0         ),
    .m_arid                  ( ram_arid     ),
    .m_arlen                 ( ram_arlen    ),
    .m_arlock                ( 2'h0         ),
    .m_arprot                ( 3'h0         ),
    .m_arsize                ( ram_arsize   ),
    .m_arvalid               ( ram_arvalid  ),
    .m_arready               ( ram_arready  ),

    .m_rready                ( ram_rready   ),
    .m_rdata                 ( ram_rdata    ),
    .m_rid                   ( ram_rid      ),
    .m_rlast                 ( ram_rlast    ),
    .m_rresp                 ( ram_rresp    ),
    .m_rvalid                ( ram_rvalid   ),

    .m_awaddr                ( ram_awaddr   ),
    .m_awburst               ( ram_awburst  ),
    .m_awcache               ( 4'h0         ),
    .m_awid                  ( ram_awid     ),
    .m_awlen                 ( ram_awlen    ),
    .m_awlock                ( 2'h0         ),
    .m_awprot                ( 3'h0         ),
    .m_awsize                ( ram_awsize   ),
    .m_awvalid               ( ram_awvalid  ),
    .m_awready               ( ram_awready  ),

    .m_wdata                 ( ram_wdata    ),
    .m_wlast                 ( ram_wlast    ),
    .m_wstrb                 ( ram_wstrb    ),
    .m_wvalid                ( ram_wvalid   ),
    .m_wready                ( ram_wready   ),

    .m_bready                ( ram_bready   ),
    .m_bid                   ( ram_bid      ),
    .m_bresp                 ( ram_bresp    ),
    .m_bvalid                ( ram_bvalid   ),

    .ram_raddr               ( fpga_sram_raddr  ),
    .ram_ren                 ( fpga_sram_ren    ),
    .ram_waddr               ( fpga_sram_waddr  ),
    .ram_wdata               ( fpga_sram_wdata  ),
    .ram_wen                 ( fpga_sram_wen    ),
    .ram_rdata               ( fpga_sram_rdata  )
);

//1MByte SRAM
fpga_sram_dp #(
.AW ( 18 ),
.Init_File (Init_File)
)u_fpga_sram (
    .CLK                     ( aclk              ),
    .ram_raddr               ( fpga_sram_raddr[19:2]   ),
    .ram_ren                 ( fpga_sram_ren     ),
    .ram_rdata               ( fpga_sram_rdata   ),
    .ram_waddr               ( fpga_sram_waddr[19:2]   ),
    .ram_wdata               ( fpga_sram_wdata   ),
    .ram_wen                 ( fpga_sram_wen     )
    
);


endmodule
