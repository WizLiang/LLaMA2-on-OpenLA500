// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : Axi_CDC

`timescale 1ns/1ps

module Axi_CDC (
  input  wire          axiInClk,
  input  wire          axiInRst,
  input  wire          axiOutClk,
  input  wire          axiOutRst,
  input  wire          axiIn_awvalid,
  output wire          axiIn_awready,
  input  wire [31:0]   axiIn_awaddr,
  input  wire [3:0]    axiIn_awid,
  input  wire [7:0]    axiIn_awlen,
  input  wire [2:0]    axiIn_awsize,
  input  wire [1:0]    axiIn_awburst,
  input  wire [0:0]    axiIn_awlock,
  input  wire [3:0]    axiIn_awcache,
  input  wire [2:0]    axiIn_awprot,
  input  wire          axiIn_wvalid,
  output wire          axiIn_wready,
  input  wire [31:0]   axiIn_wdata,
  input  wire [3:0]    axiIn_wstrb,
  input  wire          axiIn_wlast,
  output wire          axiIn_bvalid,
  input  wire          axiIn_bready,
  output wire [3:0]    axiIn_bid,
  output wire [1:0]    axiIn_bresp,
  input  wire          axiIn_arvalid,
  output wire          axiIn_arready,
  input  wire [31:0]   axiIn_araddr,
  input  wire [3:0]    axiIn_arid,
  input  wire [7:0]    axiIn_arlen,
  input  wire [2:0]    axiIn_arsize,
  input  wire [1:0]    axiIn_arburst,
  input  wire [0:0]    axiIn_arlock,
  input  wire [3:0]    axiIn_arcache,
  input  wire [2:0]    axiIn_arprot,
  output wire          axiIn_rvalid,
  input  wire          axiIn_rready,
  output wire [31:0]   axiIn_rdata,
  output wire [3:0]    axiIn_rid,
  output wire [1:0]    axiIn_rresp,
  output wire          axiIn_rlast,
  output wire          axiOut_awvalid,
  input  wire          axiOut_awready,
  output wire [31:0]   axiOut_awaddr,
  output wire [3:0]    axiOut_awid,
  output wire [7:0]    axiOut_awlen,
  output wire [2:0]    axiOut_awsize,
  output wire [1:0]    axiOut_awburst,
  output wire [0:0]    axiOut_awlock,
  output wire [3:0]    axiOut_awcache,
  output wire [2:0]    axiOut_awprot,
  output wire          axiOut_wvalid,
  input  wire          axiOut_wready,
  output wire [31:0]   axiOut_wdata,
  output wire [3:0]    axiOut_wstrb,
  output wire          axiOut_wlast,
  input  wire          axiOut_bvalid,
  output wire          axiOut_bready,
  input  wire [3:0]    axiOut_bid,
  input  wire [1:0]    axiOut_bresp,
  output wire          axiOut_arvalid,
  input  wire          axiOut_arready,
  output wire [31:0]   axiOut_araddr,
  output wire [3:0]    axiOut_arid,
  output wire [7:0]    axiOut_arlen,
  output wire [2:0]    axiOut_arsize,
  output wire [1:0]    axiOut_arburst,
  output wire [0:0]    axiOut_arlock,
  output wire [3:0]    axiOut_arcache,
  output wire [2:0]    axiOut_arprot,
  input  wire          axiOut_rvalid,
  output wire          axiOut_rready,
  input  wire [31:0]   axiOut_rdata,
  input  wire [3:0]    axiOut_rid,
  input  wire [1:0]    axiOut_rresp,
  input  wire          axiOut_rlast
);

  wire                awFifo_io_push_ready;
  wire                awFifo_io_pop_valid;
  wire       [31:0]   awFifo_io_pop_payload_addr;
  wire       [3:0]    awFifo_io_pop_payload_id;
  wire       [7:0]    awFifo_io_pop_payload_len;
  wire       [2:0]    awFifo_io_pop_payload_size;
  wire       [1:0]    awFifo_io_pop_payload_burst;
  wire       [0:0]    awFifo_io_pop_payload_lock;
  wire       [3:0]    awFifo_io_pop_payload_cache;
  wire       [2:0]    awFifo_io_pop_payload_prot;
  wire       [2:0]    awFifo_io_pushOccupancy;
  wire       [2:0]    awFifo_io_popOccupancy;
  wire                awFifo_awFifo_toplevel_axiInRst_syncronized_1;
  wire                wFifo_io_push_ready;
  wire                wFifo_io_pop_valid;
  wire       [31:0]   wFifo_io_pop_payload_data;
  wire       [3:0]    wFifo_io_pop_payload_strb;
  wire                wFifo_io_pop_payload_last;
  wire       [3:0]    wFifo_io_pushOccupancy;
  wire       [3:0]    wFifo_io_popOccupancy;
  wire                bFifo_io_push_ready;
  wire                bFifo_io_pop_valid;
  wire       [3:0]    bFifo_io_pop_payload_id;
  wire       [1:0]    bFifo_io_pop_payload_resp;
  wire       [2:0]    bFifo_io_pushOccupancy;
  wire       [2:0]    bFifo_io_popOccupancy;
  wire                bFifo_bFifo_toplevel_axiOutRst_syncronized_1;
  wire                arFifo_io_push_ready;
  wire                arFifo_io_pop_valid;
  wire       [31:0]   arFifo_io_pop_payload_addr;
  wire       [3:0]    arFifo_io_pop_payload_id;
  wire       [7:0]    arFifo_io_pop_payload_len;
  wire       [2:0]    arFifo_io_pop_payload_size;
  wire       [1:0]    arFifo_io_pop_payload_burst;
  wire       [0:0]    arFifo_io_pop_payload_lock;
  wire       [3:0]    arFifo_io_pop_payload_cache;
  wire       [2:0]    arFifo_io_pop_payload_prot;
  wire       [2:0]    arFifo_io_pushOccupancy;
  wire       [2:0]    arFifo_io_popOccupancy;
  wire                rFifo_io_push_ready;
  wire                rFifo_io_pop_valid;
  wire       [31:0]   rFifo_io_pop_payload_data;
  wire       [3:0]    rFifo_io_pop_payload_id;
  wire       [1:0]    rFifo_io_pop_payload_resp;
  wire                rFifo_io_pop_payload_last;
  wire       [3:0]    rFifo_io_pushOccupancy;
  wire       [3:0]    rFifo_io_popOccupancy;

  StreamFifoCC awFifo (
    .io_push_valid                          (axiIn_awvalid                                ), //i
    .io_push_ready                          (awFifo_io_push_ready                         ), //o
    .io_push_payload_addr                   (axiIn_awaddr[31:0]                           ), //i
    .io_push_payload_id                     (axiIn_awid[3:0]                              ), //i
    .io_push_payload_len                    (axiIn_awlen[7:0]                             ), //i
    .io_push_payload_size                   (axiIn_awsize[2:0]                            ), //i
    .io_push_payload_burst                  (axiIn_awburst[1:0]                           ), //i
    .io_push_payload_lock                   (axiIn_awlock                                 ), //i
    .io_push_payload_cache                  (axiIn_awcache[3:0]                           ), //i
    .io_push_payload_prot                   (axiIn_awprot[2:0]                            ), //i
    .io_pop_valid                           (awFifo_io_pop_valid                          ), //o
    .io_pop_ready                           (axiOut_awready                               ), //i
    .io_pop_payload_addr                    (awFifo_io_pop_payload_addr[31:0]             ), //o
    .io_pop_payload_id                      (awFifo_io_pop_payload_id[3:0]                ), //o
    .io_pop_payload_len                     (awFifo_io_pop_payload_len[7:0]               ), //o
    .io_pop_payload_size                    (awFifo_io_pop_payload_size[2:0]              ), //o
    .io_pop_payload_burst                   (awFifo_io_pop_payload_burst[1:0]             ), //o
    .io_pop_payload_lock                    (awFifo_io_pop_payload_lock                   ), //o
    .io_pop_payload_cache                   (awFifo_io_pop_payload_cache[3:0]             ), //o
    .io_pop_payload_prot                    (awFifo_io_pop_payload_prot[2:0]              ), //o
    .io_pushOccupancy                       (awFifo_io_pushOccupancy[2:0]                 ), //o
    .io_popOccupancy                        (awFifo_io_popOccupancy[2:0]                  ), //o
    .axiInClk                               (axiInClk                                     ), //i
    .axiInRst                               (axiInRst                                     ), //i
    .axiOutClk                              (axiOutClk                                    ), //i
    .awFifo_toplevel_axiInRst_syncronized_1 (awFifo_awFifo_toplevel_axiInRst_syncronized_1)  //o
  );
  StreamFifoCC_1 wFifo (
    .io_push_valid                        (axiIn_wvalid                                 ), //i
    .io_push_ready                        (wFifo_io_push_ready                          ), //o
    .io_push_payload_data                 (axiIn_wdata[31:0]                            ), //i
    .io_push_payload_strb                 (axiIn_wstrb[3:0]                             ), //i
    .io_push_payload_last                 (axiIn_wlast                                  ), //i
    .io_pop_valid                         (wFifo_io_pop_valid                           ), //o
    .io_pop_ready                         (axiOut_wready                                ), //i
    .io_pop_payload_data                  (wFifo_io_pop_payload_data[31:0]              ), //o
    .io_pop_payload_strb                  (wFifo_io_pop_payload_strb[3:0]               ), //o
    .io_pop_payload_last                  (wFifo_io_pop_payload_last                    ), //o
    .io_pushOccupancy                     (wFifo_io_pushOccupancy[3:0]                  ), //o
    .io_popOccupancy                      (wFifo_io_popOccupancy[3:0]                   ), //o
    .axiInClk                             (axiInClk                                     ), //i
    .axiInRst                             (axiInRst                                     ), //i
    .axiOutClk                            (axiOutClk                                    ), //i
    .awFifo_toplevel_axiInRst_syncronized (awFifo_awFifo_toplevel_axiInRst_syncronized_1)  //i
  );
  StreamFifoCC_2 bFifo (
    .io_push_valid                          (axiOut_bvalid                               ), //i
    .io_push_ready                          (bFifo_io_push_ready                         ), //o
    .io_push_payload_id                     (axiOut_bid[3:0]                             ), //i
    .io_push_payload_resp                   (axiOut_bresp[1:0]                           ), //i
    .io_pop_valid                           (bFifo_io_pop_valid                          ), //o
    .io_pop_ready                           (axiIn_bready                                ), //i
    .io_pop_payload_id                      (bFifo_io_pop_payload_id[3:0]                ), //o
    .io_pop_payload_resp                    (bFifo_io_pop_payload_resp[1:0]              ), //o
    .io_pushOccupancy                       (bFifo_io_pushOccupancy[2:0]                 ), //o
    .io_popOccupancy                        (bFifo_io_popOccupancy[2:0]                  ), //o
    .axiOutClk                              (axiOutClk                                   ), //i
    .axiOutRst                              (axiOutRst                                   ), //i
    .axiInClk                               (axiInClk                                    ), //i
    .bFifo_toplevel_axiOutRst_syncronized_1 (bFifo_bFifo_toplevel_axiOutRst_syncronized_1)  //o
  );
  StreamFifoCC_3 arFifo (
    .io_push_valid                        (axiIn_arvalid                                ), //i
    .io_push_ready                        (arFifo_io_push_ready                         ), //o
    .io_push_payload_addr                 (axiIn_araddr[31:0]                           ), //i
    .io_push_payload_id                   (axiIn_arid[3:0]                              ), //i
    .io_push_payload_len                  (axiIn_arlen[7:0]                             ), //i
    .io_push_payload_size                 (axiIn_arsize[2:0]                            ), //i
    .io_push_payload_burst                (axiIn_arburst[1:0]                           ), //i
    .io_push_payload_lock                 (axiIn_arlock                                 ), //i
    .io_push_payload_cache                (axiIn_arcache[3:0]                           ), //i
    .io_push_payload_prot                 (axiIn_arprot[2:0]                            ), //i
    .io_pop_valid                         (arFifo_io_pop_valid                          ), //o
    .io_pop_ready                         (axiOut_arready                               ), //i
    .io_pop_payload_addr                  (arFifo_io_pop_payload_addr[31:0]             ), //o
    .io_pop_payload_id                    (arFifo_io_pop_payload_id[3:0]                ), //o
    .io_pop_payload_len                   (arFifo_io_pop_payload_len[7:0]               ), //o
    .io_pop_payload_size                  (arFifo_io_pop_payload_size[2:0]              ), //o
    .io_pop_payload_burst                 (arFifo_io_pop_payload_burst[1:0]             ), //o
    .io_pop_payload_lock                  (arFifo_io_pop_payload_lock                   ), //o
    .io_pop_payload_cache                 (arFifo_io_pop_payload_cache[3:0]             ), //o
    .io_pop_payload_prot                  (arFifo_io_pop_payload_prot[2:0]              ), //o
    .io_pushOccupancy                     (arFifo_io_pushOccupancy[2:0]                 ), //o
    .io_popOccupancy                      (arFifo_io_popOccupancy[2:0]                  ), //o
    .axiInClk                             (axiInClk                                     ), //i
    .axiInRst                             (axiInRst                                     ), //i
    .axiOutClk                            (axiOutClk                                    ), //i
    .awFifo_toplevel_axiInRst_syncronized (awFifo_awFifo_toplevel_axiInRst_syncronized_1)  //i
  );
  StreamFifoCC_4 rFifo (
    .io_push_valid                        (axiOut_rvalid                               ), //i
    .io_push_ready                        (rFifo_io_push_ready                         ), //o
    .io_push_payload_data                 (axiOut_rdata[31:0]                          ), //i
    .io_push_payload_id                   (axiOut_rid[3:0]                             ), //i
    .io_push_payload_resp                 (axiOut_rresp[1:0]                           ), //i
    .io_push_payload_last                 (axiOut_rlast                                ), //i
    .io_pop_valid                         (rFifo_io_pop_valid                          ), //o
    .io_pop_ready                         (axiIn_rready                                ), //i
    .io_pop_payload_data                  (rFifo_io_pop_payload_data[31:0]             ), //o
    .io_pop_payload_id                    (rFifo_io_pop_payload_id[3:0]                ), //o
    .io_pop_payload_resp                  (rFifo_io_pop_payload_resp[1:0]              ), //o
    .io_pop_payload_last                  (rFifo_io_pop_payload_last                   ), //o
    .io_pushOccupancy                     (rFifo_io_pushOccupancy[3:0]                 ), //o
    .io_popOccupancy                      (rFifo_io_popOccupancy[3:0]                  ), //o
    .axiOutClk                            (axiOutClk                                   ), //i
    .axiOutRst                            (axiOutRst                                   ), //i
    .axiInClk                             (axiInClk                                    ), //i
    .bFifo_toplevel_axiOutRst_syncronized (bFifo_bFifo_toplevel_axiOutRst_syncronized_1)  //i
  );
  assign axiIn_awready = awFifo_io_push_ready;
  assign axiOut_awvalid = awFifo_io_pop_valid;
  assign axiOut_awaddr = awFifo_io_pop_payload_addr;
  assign axiOut_awid = awFifo_io_pop_payload_id;
  assign axiOut_awlen = awFifo_io_pop_payload_len;
  assign axiOut_awsize = awFifo_io_pop_payload_size;
  assign axiOut_awburst = awFifo_io_pop_payload_burst;
  assign axiOut_awlock = awFifo_io_pop_payload_lock;
  assign axiOut_awcache = awFifo_io_pop_payload_cache;
  assign axiOut_awprot = awFifo_io_pop_payload_prot;
  assign axiIn_wready = wFifo_io_push_ready;
  assign axiOut_wvalid = wFifo_io_pop_valid;
  assign axiOut_wdata = wFifo_io_pop_payload_data;
  assign axiOut_wstrb = wFifo_io_pop_payload_strb;
  assign axiOut_wlast = wFifo_io_pop_payload_last;
  assign axiOut_bready = bFifo_io_push_ready;
  assign axiIn_bvalid = bFifo_io_pop_valid;
  assign axiIn_bid = bFifo_io_pop_payload_id;
  assign axiIn_bresp = bFifo_io_pop_payload_resp;
  assign axiIn_arready = arFifo_io_push_ready;
  assign axiOut_arvalid = arFifo_io_pop_valid;
  assign axiOut_araddr = arFifo_io_pop_payload_addr;
  assign axiOut_arid = arFifo_io_pop_payload_id;
  assign axiOut_arlen = arFifo_io_pop_payload_len;
  assign axiOut_arsize = arFifo_io_pop_payload_size;
  assign axiOut_arburst = arFifo_io_pop_payload_burst;
  assign axiOut_arlock = arFifo_io_pop_payload_lock;
  assign axiOut_arcache = arFifo_io_pop_payload_cache;
  assign axiOut_arprot = arFifo_io_pop_payload_prot;
  assign axiOut_rready = rFifo_io_push_ready;
  assign axiIn_rvalid = rFifo_io_pop_valid;
  assign axiIn_rdata = rFifo_io_pop_payload_data;
  assign axiIn_rid = rFifo_io_pop_payload_id;
  assign axiIn_rresp = rFifo_io_pop_payload_resp;
  assign axiIn_rlast = rFifo_io_pop_payload_last;

endmodule

module StreamFifoCC_4 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_data,
  input  wire [3:0]    io_push_payload_id,
  input  wire [1:0]    io_push_payload_resp,
  input  wire          io_push_payload_last,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_data,
  output wire [3:0]    io_pop_payload_id,
  output wire [1:0]    io_pop_payload_resp,
  output wire          io_pop_payload_last,
  output wire [3:0]    io_pushOccupancy,
  output wire [3:0]    io_popOccupancy,
  input  wire          axiOutClk,
  input  wire          axiOutRst,
  input  wire          axiInClk,
  input  wire          bFifo_toplevel_axiOutRst_syncronized
);

  reg        [38:0]   _zz_ram_port1;
  wire       [3:0]    popToPushGray_buffercc_io_dataOut;
  wire       [3:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [3:0]    _zz_pushCC_pushPtrGray;
  wire       [2:0]    _zz_ram_port;
  wire       [38:0]   _zz_ram_port_1;
  wire       [3:0]    _zz_popCC_popPtrGray;
  reg                 _zz_1;
  wire       [3:0]    popToPushGray;
  wire       [3:0]    pushToPopGray;
  reg        [3:0]    pushCC_pushPtr;
  wire       [3:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [3:0]    pushCC_pushPtrGray;
  wire       [3:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  reg        [3:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [3:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [3:0]    popCC_popPtrGray;
  wire       [3:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [2:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [2:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [2:0]    popCC_addressGen_rData;
  wire                when_Stream_l369;
  wire                popCC_readPort_cmd_valid;
  wire       [2:0]    popCC_readPort_cmd_payload;
  wire       [31:0]   popCC_readPort_rsp_data;
  wire       [3:0]    popCC_readPort_rsp_id;
  wire       [1:0]    popCC_readPort_rsp_resp;
  wire                popCC_readPort_rsp_last;
  wire       [38:0]   _zz_popCC_readPort_rsp_data;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire       [31:0]   popCC_readArbitation_translated_payload_data;
  wire       [3:0]    popCC_readArbitation_translated_payload_id;
  wire       [1:0]    popCC_readArbitation_translated_payload_resp;
  wire                popCC_readArbitation_translated_payload_last;
  wire                popCC_readArbitation_fire;
  reg        [3:0]    popCC_ptrToPush;
  reg        [3:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  reg [38:0] ram [0:7];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[2:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_ram_port_1 = {io_push_payload_last,{io_push_payload_resp,{io_push_payload_id,io_push_payload_data}}};
  always @(posedge axiOutClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge axiInClk) begin
    if(popCC_readPort_cmd_valid) begin
      _zz_ram_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[3:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[3:0]), //o
    .axiOutClk  (axiOutClk                             ), //i
    .axiOutRst  (axiOutRst                             )  //i
  );
  BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn                            (pushToPopGray[3:0]                    ), //i
    .io_dataOut                           (pushToPopGray_buffercc_io_dataOut[3:0]), //o
    .axiInClk                             (axiInClk                              ), //i
    .bFifo_toplevel_axiOutRst_syncronized (bFifo_toplevel_axiOutRst_syncronized  )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 4'b0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[3 : 2] == (~ pushCC_popPtrGray[3 : 2])) && (pushCC_pushPtrGray[1 : 0] == pushCC_popPtrGray[1 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = pushCC_popPtrGray[3];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 4'b0001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[2:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l369) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign _zz_popCC_readPort_rsp_data = _zz_ram_port1;
  assign popCC_readPort_rsp_data = _zz_popCC_readPort_rsp_data[31 : 0];
  assign popCC_readPort_rsp_id = _zz_popCC_readPort_rsp_data[35 : 32];
  assign popCC_readPort_rsp_resp = _zz_popCC_readPort_rsp_data[37 : 36];
  assign popCC_readPort_rsp_last = _zz_popCC_readPort_rsp_data[38];
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload_data = popCC_readPort_rsp_data;
  assign popCC_readArbitation_translated_payload_id = popCC_readPort_rsp_id;
  assign popCC_readArbitation_translated_payload_resp = popCC_readPort_rsp_resp;
  assign popCC_readArbitation_translated_payload_last = popCC_readPort_rsp_last;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_data = popCC_readArbitation_translated_payload_data;
  assign io_pop_payload_id = popCC_readArbitation_translated_payload_id;
  assign io_pop_payload_resp = popCC_readArbitation_translated_payload_resp;
  assign io_pop_payload_last = popCC_readArbitation_translated_payload_last;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = popCC_pushPtrGray[3];
  assign io_popOccupancy = ({_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  always @(posedge axiOutClk or negedge axiOutRst) begin
    if(!axiOutRst) begin
      pushCC_pushPtr <= 4'b0000;
      pushCC_pushPtrGray <= 4'b0000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge axiInClk or negedge bFifo_toplevel_axiOutRst_syncronized) begin
    if(!bFifo_toplevel_axiOutRst_syncronized) begin
      popCC_popPtr <= 4'b0000;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 4'b0000;
      popCC_ptrToOccupancy <= 4'b0000;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge axiInClk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module StreamFifoCC_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_addr,
  input  wire [3:0]    io_push_payload_id,
  input  wire [7:0]    io_push_payload_len,
  input  wire [2:0]    io_push_payload_size,
  input  wire [1:0]    io_push_payload_burst,
  input  wire [0:0]    io_push_payload_lock,
  input  wire [3:0]    io_push_payload_cache,
  input  wire [2:0]    io_push_payload_prot,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_addr,
  output wire [3:0]    io_pop_payload_id,
  output wire [7:0]    io_pop_payload_len,
  output wire [2:0]    io_pop_payload_size,
  output wire [1:0]    io_pop_payload_burst,
  output wire [0:0]    io_pop_payload_lock,
  output wire [3:0]    io_pop_payload_cache,
  output wire [2:0]    io_pop_payload_prot,
  output wire [2:0]    io_pushOccupancy,
  output wire [2:0]    io_popOccupancy,
  input  wire          axiInClk,
  input  wire          axiInRst,
  input  wire          axiOutClk,
  input  wire          awFifo_toplevel_axiInRst_syncronized
);

  reg        [56:0]   _zz_ram_port1;
  wire       [2:0]    popToPushGray_buffercc_io_dataOut;
  wire       [2:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [2:0]    _zz_pushCC_pushPtrGray;
  wire       [1:0]    _zz_ram_port;
  wire       [56:0]   _zz_ram_port_1;
  wire       [2:0]    _zz_popCC_popPtrGray;
  reg                 _zz_1;
  wire       [2:0]    popToPushGray;
  wire       [2:0]    pushToPopGray;
  reg        [2:0]    pushCC_pushPtr;
  wire       [2:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [2:0]    pushCC_pushPtrGray;
  wire       [2:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  reg        [2:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [2:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [2:0]    popCC_popPtrGray;
  wire       [2:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [1:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [1:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [1:0]    popCC_addressGen_rData;
  wire                when_Stream_l369;
  wire                popCC_readPort_cmd_valid;
  wire       [1:0]    popCC_readPort_cmd_payload;
  wire       [31:0]   popCC_readPort_rsp_addr;
  wire       [3:0]    popCC_readPort_rsp_id;
  wire       [7:0]    popCC_readPort_rsp_len;
  wire       [2:0]    popCC_readPort_rsp_size;
  wire       [1:0]    popCC_readPort_rsp_burst;
  wire       [0:0]    popCC_readPort_rsp_lock;
  wire       [3:0]    popCC_readPort_rsp_cache;
  wire       [2:0]    popCC_readPort_rsp_prot;
  wire       [56:0]   _zz_popCC_readPort_rsp_addr;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire       [31:0]   popCC_readArbitation_translated_payload_addr;
  wire       [3:0]    popCC_readArbitation_translated_payload_id;
  wire       [7:0]    popCC_readArbitation_translated_payload_len;
  wire       [2:0]    popCC_readArbitation_translated_payload_size;
  wire       [1:0]    popCC_readArbitation_translated_payload_burst;
  wire       [0:0]    popCC_readArbitation_translated_payload_lock;
  wire       [3:0]    popCC_readArbitation_translated_payload_cache;
  wire       [2:0]    popCC_readArbitation_translated_payload_prot;
  wire                popCC_readArbitation_fire;
  reg        [2:0]    popCC_ptrToPush;
  reg        [2:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  reg [56:0] ram [0:3];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[1:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_ram_port_1 = {io_push_payload_prot,{io_push_payload_cache,{io_push_payload_lock,{io_push_payload_burst,{io_push_payload_size,{io_push_payload_len,{io_push_payload_id,io_push_payload_addr}}}}}}};
  always @(posedge axiInClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge axiOutClk) begin
    if(popCC_readPort_cmd_valid) begin
      _zz_ram_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  BufferCC_9 popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[2:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[2:0]), //o
    .axiInClk   (axiInClk                              ), //i
    .axiInRst   (axiInRst                              )  //i
  );
  BufferCC_11 pushToPopGray_buffercc (
    .io_dataIn                            (pushToPopGray[2:0]                    ), //i
    .io_dataOut                           (pushToPopGray_buffercc_io_dataOut[2:0]), //o
    .axiOutClk                            (axiOutClk                             ), //i
    .awFifo_toplevel_axiInRst_syncronized (awFifo_toplevel_axiInRst_syncronized  )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 3'b001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[2 : 1] == (~ pushCC_popPtrGray[2 : 1])) && (pushCC_pushPtrGray[0 : 0] == pushCC_popPtrGray[0 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = pushCC_popPtrGray[2];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}});
  assign popCC_popPtrPlus = (popCC_popPtr + 3'b001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[1:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l369) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign _zz_popCC_readPort_rsp_addr = _zz_ram_port1;
  assign popCC_readPort_rsp_addr = _zz_popCC_readPort_rsp_addr[31 : 0];
  assign popCC_readPort_rsp_id = _zz_popCC_readPort_rsp_addr[35 : 32];
  assign popCC_readPort_rsp_len = _zz_popCC_readPort_rsp_addr[43 : 36];
  assign popCC_readPort_rsp_size = _zz_popCC_readPort_rsp_addr[46 : 44];
  assign popCC_readPort_rsp_burst = _zz_popCC_readPort_rsp_addr[48 : 47];
  assign popCC_readPort_rsp_lock = _zz_popCC_readPort_rsp_addr[49 : 49];
  assign popCC_readPort_rsp_cache = _zz_popCC_readPort_rsp_addr[53 : 50];
  assign popCC_readPort_rsp_prot = _zz_popCC_readPort_rsp_addr[56 : 54];
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload_addr = popCC_readPort_rsp_addr;
  assign popCC_readArbitation_translated_payload_id = popCC_readPort_rsp_id;
  assign popCC_readArbitation_translated_payload_len = popCC_readPort_rsp_len;
  assign popCC_readArbitation_translated_payload_size = popCC_readPort_rsp_size;
  assign popCC_readArbitation_translated_payload_burst = popCC_readPort_rsp_burst;
  assign popCC_readArbitation_translated_payload_lock = popCC_readPort_rsp_lock;
  assign popCC_readArbitation_translated_payload_cache = popCC_readPort_rsp_cache;
  assign popCC_readArbitation_translated_payload_prot = popCC_readPort_rsp_prot;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_addr = popCC_readArbitation_translated_payload_addr;
  assign io_pop_payload_id = popCC_readArbitation_translated_payload_id;
  assign io_pop_payload_len = popCC_readArbitation_translated_payload_len;
  assign io_pop_payload_size = popCC_readArbitation_translated_payload_size;
  assign io_pop_payload_burst = popCC_readArbitation_translated_payload_burst;
  assign io_pop_payload_lock = popCC_readArbitation_translated_payload_lock;
  assign io_pop_payload_cache = popCC_readArbitation_translated_payload_cache;
  assign io_pop_payload_prot = popCC_readArbitation_translated_payload_prot;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = popCC_pushPtrGray[2];
  assign io_popOccupancy = ({_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  always @(posedge axiInClk or negedge axiInRst) begin
    if(!axiInRst) begin
      pushCC_pushPtr <= 3'b000;
      pushCC_pushPtrGray <= 3'b000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge axiOutClk or negedge awFifo_toplevel_axiInRst_syncronized) begin
    if(!awFifo_toplevel_axiInRst_syncronized) begin
      popCC_popPtr <= 3'b000;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 3'b000;
      popCC_ptrToOccupancy <= 3'b000;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge axiOutClk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module StreamFifoCC_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [3:0]    io_push_payload_id,
  input  wire [1:0]    io_push_payload_resp,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [3:0]    io_pop_payload_id,
  output wire [1:0]    io_pop_payload_resp,
  output wire [2:0]    io_pushOccupancy,
  output wire [2:0]    io_popOccupancy,
  input  wire          axiOutClk,
  input  wire          axiOutRst,
  input  wire          axiInClk,
  output wire          bFifo_toplevel_axiOutRst_syncronized_1
);

  wire                bufferCC_12_io_dataIn;
  reg        [5:0]    _zz_ram_port1;
  wire       [2:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_12_io_dataOut;
  wire       [2:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [2:0]    _zz_pushCC_pushPtrGray;
  wire       [1:0]    _zz_ram_port;
  wire       [5:0]    _zz_ram_port_1;
  wire       [2:0]    _zz_popCC_popPtrGray;
  reg                 _zz_1;
  wire       [2:0]    popToPushGray;
  wire       [2:0]    pushToPopGray;
  reg        [2:0]    pushCC_pushPtr;
  wire       [2:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [2:0]    pushCC_pushPtrGray;
  wire       [2:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                bFifo_toplevel_axiOutRst_syncronized;
  reg        [2:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [2:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [2:0]    popCC_popPtrGray;
  wire       [2:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [1:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [1:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [1:0]    popCC_addressGen_rData;
  wire                when_Stream_l369;
  wire                popCC_readPort_cmd_valid;
  wire       [1:0]    popCC_readPort_cmd_payload;
  wire       [3:0]    popCC_readPort_rsp_id;
  wire       [1:0]    popCC_readPort_rsp_resp;
  wire       [5:0]    _zz_popCC_readPort_rsp_id;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire       [3:0]    popCC_readArbitation_translated_payload_id;
  wire       [1:0]    popCC_readArbitation_translated_payload_resp;
  wire                popCC_readArbitation_fire;
  reg        [2:0]    popCC_ptrToPush;
  reg        [2:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  reg [5:0] ram [0:3];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[1:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_ram_port_1 = {io_push_payload_resp,io_push_payload_id};
  always @(posedge axiOutClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge axiInClk) begin
    if(popCC_readPort_cmd_valid) begin
      _zz_ram_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  BufferCC_4 popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[2:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[2:0]), //o
    .axiOutClk  (axiOutClk                             ), //i
    .axiOutRst  (axiOutRst                             )  //i
  );
  BufferCC_5 bufferCC_12 (
    .io_dataIn  (bufferCC_12_io_dataIn ), //i
    .io_dataOut (bufferCC_12_io_dataOut), //o
    .axiInClk   (axiInClk              ), //i
    .axiOutRst  (axiOutRst             )  //i
  );
  BufferCC_6 pushToPopGray_buffercc (
    .io_dataIn                            (pushToPopGray[2:0]                    ), //i
    .io_dataOut                           (pushToPopGray_buffercc_io_dataOut[2:0]), //o
    .axiInClk                             (axiInClk                              ), //i
    .bFifo_toplevel_axiOutRst_syncronized (bFifo_toplevel_axiOutRst_syncronized  )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 3'b001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[2 : 1] == (~ pushCC_popPtrGray[2 : 1])) && (pushCC_pushPtrGray[0 : 0] == pushCC_popPtrGray[0 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = pushCC_popPtrGray[2];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}});
  assign bufferCC_12_io_dataIn = (1'b1 ^ 1'b0);
  assign bFifo_toplevel_axiOutRst_syncronized = bufferCC_12_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 3'b001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[1:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l369) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign _zz_popCC_readPort_rsp_id = _zz_ram_port1;
  assign popCC_readPort_rsp_id = _zz_popCC_readPort_rsp_id[3 : 0];
  assign popCC_readPort_rsp_resp = _zz_popCC_readPort_rsp_id[5 : 4];
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload_id = popCC_readPort_rsp_id;
  assign popCC_readArbitation_translated_payload_resp = popCC_readPort_rsp_resp;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_id = popCC_readArbitation_translated_payload_id;
  assign io_pop_payload_resp = popCC_readArbitation_translated_payload_resp;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = popCC_pushPtrGray[2];
  assign io_popOccupancy = ({_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  assign bFifo_toplevel_axiOutRst_syncronized_1 = bFifo_toplevel_axiOutRst_syncronized;
  always @(posedge axiOutClk or negedge axiOutRst) begin
    if(!axiOutRst) begin
      pushCC_pushPtr <= 3'b000;
      pushCC_pushPtrGray <= 3'b000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge axiInClk or negedge bFifo_toplevel_axiOutRst_syncronized) begin
    if(!bFifo_toplevel_axiOutRst_syncronized) begin
      popCC_popPtr <= 3'b000;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 3'b000;
      popCC_ptrToOccupancy <= 3'b000;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge axiInClk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module StreamFifoCC_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_data,
  input  wire [3:0]    io_push_payload_strb,
  input  wire          io_push_payload_last,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_data,
  output wire [3:0]    io_pop_payload_strb,
  output wire          io_pop_payload_last,
  output wire [3:0]    io_pushOccupancy,
  output wire [3:0]    io_popOccupancy,
  input  wire          axiInClk,
  input  wire          axiInRst,
  input  wire          axiOutClk,
  input  wire          awFifo_toplevel_axiInRst_syncronized
);

  reg        [36:0]   _zz_ram_port1;
  wire       [3:0]    popToPushGray_buffercc_io_dataOut;
  wire       [3:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [3:0]    _zz_pushCC_pushPtrGray;
  wire       [2:0]    _zz_ram_port;
  wire       [36:0]   _zz_ram_port_1;
  wire       [3:0]    _zz_popCC_popPtrGray;
  reg                 _zz_1;
  wire       [3:0]    popToPushGray;
  wire       [3:0]    pushToPopGray;
  reg        [3:0]    pushCC_pushPtr;
  wire       [3:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [3:0]    pushCC_pushPtrGray;
  wire       [3:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                _zz_io_pushOccupancy_2;
  reg        [3:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [3:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [3:0]    popCC_popPtrGray;
  wire       [3:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [2:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [2:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [2:0]    popCC_addressGen_rData;
  wire                when_Stream_l369;
  wire                popCC_readPort_cmd_valid;
  wire       [2:0]    popCC_readPort_cmd_payload;
  wire       [31:0]   popCC_readPort_rsp_data;
  wire       [3:0]    popCC_readPort_rsp_strb;
  wire                popCC_readPort_rsp_last;
  wire       [36:0]   _zz_popCC_readPort_rsp_data;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire       [31:0]   popCC_readArbitation_translated_payload_data;
  wire       [3:0]    popCC_readArbitation_translated_payload_strb;
  wire                popCC_readArbitation_translated_payload_last;
  wire                popCC_readArbitation_fire;
  reg        [3:0]    popCC_ptrToPush;
  reg        [3:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  wire                _zz_io_popOccupancy_2;
  reg [36:0] ram [0:7];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[2:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_ram_port_1 = {io_push_payload_last,{io_push_payload_strb,io_push_payload_data}};
  always @(posedge axiInClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge axiOutClk) begin
    if(popCC_readPort_cmd_valid) begin
      _zz_ram_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  BufferCC_7 popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[3:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[3:0]), //o
    .axiInClk   (axiInClk                              ), //i
    .axiInRst   (axiInRst                              )  //i
  );
  BufferCC_8 pushToPopGray_buffercc (
    .io_dataIn                            (pushToPopGray[3:0]                    ), //i
    .io_dataOut                           (pushToPopGray_buffercc_io_dataOut[3:0]), //o
    .axiOutClk                            (axiOutClk                             ), //i
    .awFifo_toplevel_axiInRst_syncronized (awFifo_toplevel_axiInRst_syncronized  )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 4'b0001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[3 : 2] == (~ pushCC_popPtrGray[3 : 2])) && (pushCC_pushPtrGray[1 : 0] == pushCC_popPtrGray[1 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = (pushCC_popPtrGray[2] ^ _zz_io_pushOccupancy_2);
  assign _zz_io_pushOccupancy_2 = pushCC_popPtrGray[3];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_2,{_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}}});
  assign popCC_popPtrPlus = (popCC_popPtr + 4'b0001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[2:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l369) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign _zz_popCC_readPort_rsp_data = _zz_ram_port1;
  assign popCC_readPort_rsp_data = _zz_popCC_readPort_rsp_data[31 : 0];
  assign popCC_readPort_rsp_strb = _zz_popCC_readPort_rsp_data[35 : 32];
  assign popCC_readPort_rsp_last = _zz_popCC_readPort_rsp_data[36];
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload_data = popCC_readPort_rsp_data;
  assign popCC_readArbitation_translated_payload_strb = popCC_readPort_rsp_strb;
  assign popCC_readArbitation_translated_payload_last = popCC_readPort_rsp_last;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_data = popCC_readArbitation_translated_payload_data;
  assign io_pop_payload_strb = popCC_readArbitation_translated_payload_strb;
  assign io_pop_payload_last = popCC_readArbitation_translated_payload_last;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = (popCC_pushPtrGray[2] ^ _zz_io_popOccupancy_2);
  assign _zz_io_popOccupancy_2 = popCC_pushPtrGray[3];
  assign io_popOccupancy = ({_zz_io_popOccupancy_2,{_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  always @(posedge axiInClk or negedge axiInRst) begin
    if(!axiInRst) begin
      pushCC_pushPtr <= 4'b0000;
      pushCC_pushPtrGray <= 4'b0000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge axiOutClk or negedge awFifo_toplevel_axiInRst_syncronized) begin
    if(!awFifo_toplevel_axiInRst_syncronized) begin
      popCC_popPtr <= 4'b0000;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 4'b0000;
      popCC_ptrToOccupancy <= 4'b0000;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge axiOutClk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module StreamFifoCC (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [31:0]   io_push_payload_addr,
  input  wire [3:0]    io_push_payload_id,
  input  wire [7:0]    io_push_payload_len,
  input  wire [2:0]    io_push_payload_size,
  input  wire [1:0]    io_push_payload_burst,
  input  wire [0:0]    io_push_payload_lock,
  input  wire [3:0]    io_push_payload_cache,
  input  wire [2:0]    io_push_payload_prot,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [31:0]   io_pop_payload_addr,
  output wire [3:0]    io_pop_payload_id,
  output wire [7:0]    io_pop_payload_len,
  output wire [2:0]    io_pop_payload_size,
  output wire [1:0]    io_pop_payload_burst,
  output wire [0:0]    io_pop_payload_lock,
  output wire [3:0]    io_pop_payload_cache,
  output wire [2:0]    io_pop_payload_prot,
  output wire [2:0]    io_pushOccupancy,
  output wire [2:0]    io_popOccupancy,
  input  wire          axiInClk,
  input  wire          axiInRst,
  input  wire          axiOutClk,
  output wire          awFifo_toplevel_axiInRst_syncronized_1
);

  wire                bufferCC_12_io_dataIn;
  reg        [56:0]   _zz_ram_port1;
  wire       [2:0]    popToPushGray_buffercc_io_dataOut;
  wire                bufferCC_12_io_dataOut;
  wire       [2:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [2:0]    _zz_pushCC_pushPtrGray;
  wire       [1:0]    _zz_ram_port;
  wire       [56:0]   _zz_ram_port_1;
  wire       [2:0]    _zz_popCC_popPtrGray;
  reg                 _zz_1;
  wire       [2:0]    popToPushGray;
  wire       [2:0]    pushToPopGray;
  reg        [2:0]    pushCC_pushPtr;
  wire       [2:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [2:0]    pushCC_pushPtrGray;
  wire       [2:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  wire                awFifo_toplevel_axiInRst_syncronized;
  reg        [2:0]    popCC_popPtr;
  (* keep , syn_keep *) wire       [2:0]    popCC_popPtrPlus /* synthesis syn_keep = 1 */ ;
  wire       [2:0]    popCC_popPtrGray;
  wire       [2:0]    popCC_pushPtrGray;
  wire                popCC_addressGen_valid;
  reg                 popCC_addressGen_ready;
  wire       [1:0]    popCC_addressGen_payload;
  wire                popCC_empty;
  wire                popCC_addressGen_fire;
  wire                popCC_readArbitation_valid;
  wire                popCC_readArbitation_ready;
  wire       [1:0]    popCC_readArbitation_payload;
  reg                 popCC_addressGen_rValid;
  reg        [1:0]    popCC_addressGen_rData;
  wire                when_Stream_l369;
  wire                popCC_readPort_cmd_valid;
  wire       [1:0]    popCC_readPort_cmd_payload;
  wire       [31:0]   popCC_readPort_rsp_addr;
  wire       [3:0]    popCC_readPort_rsp_id;
  wire       [7:0]    popCC_readPort_rsp_len;
  wire       [2:0]    popCC_readPort_rsp_size;
  wire       [1:0]    popCC_readPort_rsp_burst;
  wire       [0:0]    popCC_readPort_rsp_lock;
  wire       [3:0]    popCC_readPort_rsp_cache;
  wire       [2:0]    popCC_readPort_rsp_prot;
  wire       [56:0]   _zz_popCC_readPort_rsp_addr;
  wire                popCC_readArbitation_translated_valid;
  wire                popCC_readArbitation_translated_ready;
  wire       [31:0]   popCC_readArbitation_translated_payload_addr;
  wire       [3:0]    popCC_readArbitation_translated_payload_id;
  wire       [7:0]    popCC_readArbitation_translated_payload_len;
  wire       [2:0]    popCC_readArbitation_translated_payload_size;
  wire       [1:0]    popCC_readArbitation_translated_payload_burst;
  wire       [0:0]    popCC_readArbitation_translated_payload_lock;
  wire       [3:0]    popCC_readArbitation_translated_payload_cache;
  wire       [2:0]    popCC_readArbitation_translated_payload_prot;
  wire                popCC_readArbitation_fire;
  reg        [2:0]    popCC_ptrToPush;
  reg        [2:0]    popCC_ptrToOccupancy;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  reg [56:0] ram [0:3];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[1:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtr >>> 1'b1);
  assign _zz_ram_port_1 = {io_push_payload_prot,{io_push_payload_cache,{io_push_payload_lock,{io_push_payload_burst,{io_push_payload_size,{io_push_payload_len,{io_push_payload_id,io_push_payload_addr}}}}}}};
  always @(posedge axiInClk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge axiOutClk) begin
    if(popCC_readPort_cmd_valid) begin
      _zz_ram_port1 <= ram[popCC_readPort_cmd_payload];
    end
  end

  BufferCC_9 popToPushGray_buffercc (
    .io_dataIn  (popToPushGray[2:0]                    ), //i
    .io_dataOut (popToPushGray_buffercc_io_dataOut[2:0]), //o
    .axiInClk   (axiInClk                              ), //i
    .axiInRst   (axiInRst                              )  //i
  );
  BufferCC_10 bufferCC_12 (
    .io_dataIn  (bufferCC_12_io_dataIn ), //i
    .io_dataOut (bufferCC_12_io_dataOut), //o
    .axiOutClk  (axiOutClk             ), //i
    .axiInRst   (axiInRst              )  //i
  );
  BufferCC_11 pushToPopGray_buffercc (
    .io_dataIn                            (pushToPopGray[2:0]                    ), //i
    .io_dataOut                           (pushToPopGray_buffercc_io_dataOut[2:0]), //o
    .axiOutClk                            (axiOutClk                             ), //i
    .awFifo_toplevel_axiInRst_syncronized (awFifo_toplevel_axiInRst_syncronized  )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 3'b001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[2 : 1] == (~ pushCC_popPtrGray[2 : 1])) && (pushCC_pushPtrGray[0 : 0] == pushCC_popPtrGray[0 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = pushCC_popPtrGray[2];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}});
  assign bufferCC_12_io_dataIn = (1'b1 ^ 1'b0);
  assign awFifo_toplevel_axiInRst_syncronized = bufferCC_12_io_dataOut;
  assign popCC_popPtrPlus = (popCC_popPtr + 3'b001);
  assign popCC_popPtrGray = (_zz_popCC_popPtrGray ^ popCC_popPtr);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign popCC_addressGen_valid = (! popCC_empty);
  assign popCC_addressGen_payload = popCC_popPtr[1:0];
  assign popCC_addressGen_fire = (popCC_addressGen_valid && popCC_addressGen_ready);
  always @(*) begin
    popCC_addressGen_ready = popCC_readArbitation_ready;
    if(when_Stream_l369) begin
      popCC_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! popCC_readArbitation_valid);
  assign popCC_readArbitation_valid = popCC_addressGen_rValid;
  assign popCC_readArbitation_payload = popCC_addressGen_rData;
  assign _zz_popCC_readPort_rsp_addr = _zz_ram_port1;
  assign popCC_readPort_rsp_addr = _zz_popCC_readPort_rsp_addr[31 : 0];
  assign popCC_readPort_rsp_id = _zz_popCC_readPort_rsp_addr[35 : 32];
  assign popCC_readPort_rsp_len = _zz_popCC_readPort_rsp_addr[43 : 36];
  assign popCC_readPort_rsp_size = _zz_popCC_readPort_rsp_addr[46 : 44];
  assign popCC_readPort_rsp_burst = _zz_popCC_readPort_rsp_addr[48 : 47];
  assign popCC_readPort_rsp_lock = _zz_popCC_readPort_rsp_addr[49 : 49];
  assign popCC_readPort_rsp_cache = _zz_popCC_readPort_rsp_addr[53 : 50];
  assign popCC_readPort_rsp_prot = _zz_popCC_readPort_rsp_addr[56 : 54];
  assign popCC_readPort_cmd_valid = popCC_addressGen_fire;
  assign popCC_readPort_cmd_payload = popCC_addressGen_payload;
  assign popCC_readArbitation_translated_valid = popCC_readArbitation_valid;
  assign popCC_readArbitation_ready = popCC_readArbitation_translated_ready;
  assign popCC_readArbitation_translated_payload_addr = popCC_readPort_rsp_addr;
  assign popCC_readArbitation_translated_payload_id = popCC_readPort_rsp_id;
  assign popCC_readArbitation_translated_payload_len = popCC_readPort_rsp_len;
  assign popCC_readArbitation_translated_payload_size = popCC_readPort_rsp_size;
  assign popCC_readArbitation_translated_payload_burst = popCC_readPort_rsp_burst;
  assign popCC_readArbitation_translated_payload_lock = popCC_readPort_rsp_lock;
  assign popCC_readArbitation_translated_payload_cache = popCC_readPort_rsp_cache;
  assign popCC_readArbitation_translated_payload_prot = popCC_readPort_rsp_prot;
  assign io_pop_valid = popCC_readArbitation_translated_valid;
  assign popCC_readArbitation_translated_ready = io_pop_ready;
  assign io_pop_payload_addr = popCC_readArbitation_translated_payload_addr;
  assign io_pop_payload_id = popCC_readArbitation_translated_payload_id;
  assign io_pop_payload_len = popCC_readArbitation_translated_payload_len;
  assign io_pop_payload_size = popCC_readArbitation_translated_payload_size;
  assign io_pop_payload_burst = popCC_readArbitation_translated_payload_burst;
  assign io_pop_payload_lock = popCC_readArbitation_translated_payload_lock;
  assign io_pop_payload_cache = popCC_readArbitation_translated_payload_cache;
  assign io_pop_payload_prot = popCC_readArbitation_translated_payload_prot;
  assign popCC_readArbitation_fire = (popCC_readArbitation_valid && popCC_readArbitation_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = popCC_pushPtrGray[2];
  assign io_popOccupancy = ({_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}} - popCC_ptrToOccupancy);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_ptrToPush;
  assign awFifo_toplevel_axiInRst_syncronized_1 = awFifo_toplevel_axiInRst_syncronized;
  always @(posedge axiInClk or negedge axiInRst) begin
    if(!axiInRst) begin
      pushCC_pushPtr <= 3'b000;
      pushCC_pushPtrGray <= 3'b000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge axiOutClk or negedge awFifo_toplevel_axiInRst_syncronized) begin
    if(!awFifo_toplevel_axiInRst_syncronized) begin
      popCC_popPtr <= 3'b000;
      popCC_addressGen_rValid <= 1'b0;
      popCC_ptrToPush <= 3'b000;
      popCC_ptrToOccupancy <= 3'b000;
    end else begin
      if(popCC_addressGen_fire) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
      if(popCC_addressGen_ready) begin
        popCC_addressGen_rValid <= popCC_addressGen_valid;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToPush <= popCC_popPtrGray;
      end
      if(popCC_readArbitation_fire) begin
        popCC_ptrToOccupancy <= popCC_popPtr;
      end
    end
  end

  always @(posedge axiOutClk) begin
    if(popCC_addressGen_ready) begin
      popCC_addressGen_rData <= popCC_addressGen_payload;
    end
  end


endmodule

module BufferCC_1 (
  input  wire [3:0]    io_dataIn,
  output wire [3:0]    io_dataOut,
  input  wire          axiInClk,
  input  wire          bFifo_toplevel_axiOutRst_syncronized
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiInClk or negedge bFifo_toplevel_axiOutRst_syncronized) begin
    if(!bFifo_toplevel_axiOutRst_syncronized) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input  wire [3:0]    io_dataIn,
  output wire [3:0]    io_dataOut,
  input  wire          axiOutClk,
  input  wire          axiOutRst
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiOutClk or negedge axiOutRst) begin
    if(!axiOutRst) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//BufferCC_3 replaced by BufferCC_11

//BufferCC_2 replaced by BufferCC_9

module BufferCC_6 (
  input  wire [2:0]    io_dataIn,
  output wire [2:0]    io_dataOut,
  input  wire          axiInClk,
  input  wire          bFifo_toplevel_axiOutRst_syncronized
);

  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiInClk or negedge bFifo_toplevel_axiOutRst_syncronized) begin
    if(!bFifo_toplevel_axiOutRst_syncronized) begin
      buffers_0 <= 3'b000;
      buffers_1 <= 3'b000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_5 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          axiInClk,
  input  wire          axiOutRst
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiInClk or negedge axiOutRst) begin
    if(!axiOutRst) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_4 (
  input  wire [2:0]    io_dataIn,
  output wire [2:0]    io_dataOut,
  input  wire          axiOutClk,
  input  wire          axiOutRst
);

  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiOutClk or negedge axiOutRst) begin
    if(!axiOutRst) begin
      buffers_0 <= 3'b000;
      buffers_1 <= 3'b000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_8 (
  input  wire [3:0]    io_dataIn,
  output wire [3:0]    io_dataOut,
  input  wire          axiOutClk,
  input  wire          awFifo_toplevel_axiInRst_syncronized
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiOutClk or negedge awFifo_toplevel_axiInRst_syncronized) begin
    if(!awFifo_toplevel_axiInRst_syncronized) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_7 (
  input  wire [3:0]    io_dataIn,
  output wire [3:0]    io_dataOut,
  input  wire          axiInClk,
  input  wire          axiInRst
);

  (* async_reg = "true" *) reg        [3:0]    buffers_0;
  (* async_reg = "true" *) reg        [3:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiInClk or negedge axiInRst) begin
    if(!axiInRst) begin
      buffers_0 <= 4'b0000;
      buffers_1 <= 4'b0000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_11 (
  input  wire [2:0]    io_dataIn,
  output wire [2:0]    io_dataOut,
  input  wire          axiOutClk,
  input  wire          awFifo_toplevel_axiInRst_syncronized
);

  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiOutClk or negedge awFifo_toplevel_axiInRst_syncronized) begin
    if(!awFifo_toplevel_axiInRst_syncronized) begin
      buffers_0 <= 3'b000;
      buffers_1 <= 3'b000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_10 (
  input  wire          io_dataIn,
  output wire          io_dataOut,
  input  wire          axiOutClk,
  input  wire          axiInRst
);

  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiOutClk or negedge axiInRst) begin
    if(!axiInRst) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_9 (
  input  wire [2:0]    io_dataIn,
  output wire [2:0]    io_dataOut,
  input  wire          axiInClk,
  input  wire          axiInRst
);

  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge axiInClk or negedge axiInRst) begin
    if(!axiInRst) begin
      buffers_0 <= 3'b000;
      buffers_1 <= 3'b000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
