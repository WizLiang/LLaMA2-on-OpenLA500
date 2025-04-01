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
`timescale 1ns / 1ps
`include "config.h"

`define UART_PSEL               u_soc_top.u_axi_uart_controller.uart0.PSEL
`define UART_PENBLE             u_soc_top.u_axi_uart_controller.uart0.PENABLE
`define UART_PWRITE             u_soc_top.u_axi_uart_controller.uart0.PWRITE
`define UART_WADDR              u_soc_top.u_axi_uart_controller.uart0.PADDR[7:0]
`define UART_WDATA              u_soc_top.u_axi_uart_controller.uart0.PWDATA[7:0]

module tb_top( );
reg reset;
reg clk;
reg   [3:0]  touch_btn;
reg   [31:0]  dip_sw;

wire         UART_RX;
wire         UART_TX;
wire  [2:0]  video_red;
wire  [2:0]  video_green;
wire  [1:0]  video_blue;
wire  video_hsync;
wire  video_vsync;
wire  video_clk;
wire  video_de;
wire  [15:0]  leds;
wire  [7:0]  dpy0;
wire  [7:0]  dpy1;
wire  [19:0]  base_ram_addr;
wire  [ 3:0]  base_ram_be_n;
wire  base_ram_ce_n;
wire  base_ram_oe_n;
wire  base_ram_we_n;
wire  [19:0]  ext_ram_addr;
wire  [ 3:0]  ext_ram_be_n;
wire  ext_ram_ce_n;
wire  ext_ram_oe_n;
wire  ext_ram_we_n;
wire  [31:0]  base_ram_data;
wire  [31:0]  ext_ram_data;


initial
begin
    clk = 1'b0;
    reset = 1'b1;
    dip_sw = 32'h0;
    #2000;
    reset = 1'b0;
end
always #10 clk=~clk;

initial
begin
    touch_btn = 4'h0;
    dip_sw    = 32'h0000_abcd;

    #3000000;

    #100000
    touch_btn = 4'b0001;
    #50
    touch_btn = 4'b0000;

    #100000
    touch_btn = 4'b0010;
    #50
    touch_btn = 4'b0000;

    #100000
    touch_btn = 4'b0100;
    #50
    touch_btn = 4'b0000;

    #100000
    touch_btn = 4'b1000;
    #50
    touch_btn = 4'b0000;

end

soc_top  #(.SIMULATION(1'b1)) u_soc_top (
    .clk                     ( clk           ),
    .reset                   ( reset         ),
    .touch_btn               ( touch_btn     ),
    .dip_sw                  ( dip_sw        ),

    .video_red               ( video_red     ),
    .video_green             ( video_green   ),
    .video_blue              ( video_blue    ),
    .video_hsync             ( video_hsync   ),
    .video_vsync             ( video_vsync   ),
    .video_clk               ( video_clk     ),
    .video_de                ( video_de      ),
    .leds                    ( leds          ),
    .dpy0                    ( dpy0          ),
    .dpy1                    ( dpy1          ),

    .base_ram_addr           ( base_ram_addr   ),
    .base_ram_be_n           ( base_ram_be_n   ),
    .base_ram_ce_n           ( base_ram_ce_n   ),
    .base_ram_oe_n           ( base_ram_oe_n   ),
    .base_ram_we_n           ( base_ram_we_n   ),
    .ext_ram_addr            ( ext_ram_addr    ),
    .ext_ram_be_n            ( ext_ram_be_n    ),
    .ext_ram_ce_n            ( ext_ram_ce_n    ),
    .ext_ram_oe_n            ( ext_ram_oe_n    ),
    .ext_ram_we_n            ( ext_ram_we_n    ),

    .base_ram_data           ( base_ram_data   ),
    .ext_ram_data            ( ext_ram_data    ),

    .UART_RX                 ( UART_RX       ),
    .UART_TX                 ( UART_TX       )
);


//模拟串口打印
wire uart_display;
wire [7:0] uart_data;
wire uart_wen;
assign uart_wen = (`UART_PSEL == 1'b1) &&  (`UART_PENBLE == 1'b1) && (`UART_PWRITE == 1'b1);
assign uart_display = (uart_wen == 1'b1) && (`UART_WADDR == 8'h0);
assign uart_data    = `UART_WDATA;

always @(posedge clk)
begin
    if(uart_display)
    begin
        if(uart_data==8'hff)
        begin
            ;//$finish;
        end
        else
        begin
            $write("%c",uart_data);
        end
    end
end

sram_sp #(
    .AW        ( 18     ),
    .Init_File(`SRAM_Init_File))
base_sram_sp (
    .ram_addr                ( base_ram_addr   ),
    .ram_be_n                ( base_ram_be_n   ),
    .ram_ce_n                ( base_ram_ce_n   ),
    .ram_oe_n                ( base_ram_oe_n   ),
    .ram_we_n                ( base_ram_we_n   ),

    .ram_data                ( base_ram_data   )
);

sram_sp #(
    .AW        ( 18     ),
    .Init_File(`SRAM_Init_File))
ext_sram_sp (
    .ram_addr                ( ext_ram_addr   ),
    .ram_be_n                ( ext_ram_be_n   ),
    .ram_ce_n                ( ext_ram_ce_n   ),
    .ram_oe_n                ( ext_ram_oe_n   ),
    .ram_we_n                ( ext_ram_we_n   ),

    .ram_data                ( ext_ram_data   )
);


endmodule
