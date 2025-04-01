// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiCrossbar_1x4


module AxiCrossbar_1x4 (
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
  output wire          axiOut_0_awvalid,
  input  wire          axiOut_0_awready,
  output wire [31:0]   axiOut_0_awaddr,
  output wire [4:0]    axiOut_0_awid,
  output wire [7:0]    axiOut_0_awlen,
  output wire [2:0]    axiOut_0_awsize,
  output wire [1:0]    axiOut_0_awburst,
  output wire [0:0]    axiOut_0_awlock,
  output wire [3:0]    axiOut_0_awcache,
  output wire [2:0]    axiOut_0_awprot,
  output wire          axiOut_0_wvalid,
  input  wire          axiOut_0_wready,
  output wire [31:0]   axiOut_0_wdata,
  output wire [3:0]    axiOut_0_wstrb,
  output wire          axiOut_0_wlast,
  input  wire          axiOut_0_bvalid,
  output wire          axiOut_0_bready,
  input  wire [4:0]    axiOut_0_bid,
  input  wire [1:0]    axiOut_0_bresp,
  output wire          axiOut_0_arvalid,
  input  wire          axiOut_0_arready,
  output wire [31:0]   axiOut_0_araddr,
  output wire [4:0]    axiOut_0_arid,
  output wire [7:0]    axiOut_0_arlen,
  output wire [2:0]    axiOut_0_arsize,
  output wire [1:0]    axiOut_0_arburst,
  output wire [0:0]    axiOut_0_arlock,
  output wire [3:0]    axiOut_0_arcache,
  output wire [2:0]    axiOut_0_arprot,
  input  wire          axiOut_0_rvalid,
  output wire          axiOut_0_rready,
  input  wire [31:0]   axiOut_0_rdata,
  input  wire [4:0]    axiOut_0_rid,
  input  wire [1:0]    axiOut_0_rresp,
  input  wire          axiOut_0_rlast,
  output wire          axiOut_1_awvalid,
  input  wire          axiOut_1_awready,
  output wire [31:0]   axiOut_1_awaddr,
  output wire [4:0]    axiOut_1_awid,
  output wire [7:0]    axiOut_1_awlen,
  output wire [2:0]    axiOut_1_awsize,
  output wire [1:0]    axiOut_1_awburst,
  output wire [0:0]    axiOut_1_awlock,
  output wire [3:0]    axiOut_1_awcache,
  output wire [2:0]    axiOut_1_awprot,
  output wire          axiOut_1_wvalid,
  input  wire          axiOut_1_wready,
  output wire [31:0]   axiOut_1_wdata,
  output wire [3:0]    axiOut_1_wstrb,
  output wire          axiOut_1_wlast,
  input  wire          axiOut_1_bvalid,
  output wire          axiOut_1_bready,
  input  wire [4:0]    axiOut_1_bid,
  input  wire [1:0]    axiOut_1_bresp,
  output wire          axiOut_1_arvalid,
  input  wire          axiOut_1_arready,
  output wire [31:0]   axiOut_1_araddr,
  output wire [4:0]    axiOut_1_arid,
  output wire [7:0]    axiOut_1_arlen,
  output wire [2:0]    axiOut_1_arsize,
  output wire [1:0]    axiOut_1_arburst,
  output wire [0:0]    axiOut_1_arlock,
  output wire [3:0]    axiOut_1_arcache,
  output wire [2:0]    axiOut_1_arprot,
  input  wire          axiOut_1_rvalid,
  output wire          axiOut_1_rready,
  input  wire [31:0]   axiOut_1_rdata,
  input  wire [4:0]    axiOut_1_rid,
  input  wire [1:0]    axiOut_1_rresp,
  input  wire          axiOut_1_rlast,
  output wire          axiOut_2_awvalid,
  input  wire          axiOut_2_awready,
  output wire [31:0]   axiOut_2_awaddr,
  output wire [4:0]    axiOut_2_awid,
  output wire [7:0]    axiOut_2_awlen,
  output wire [2:0]    axiOut_2_awsize,
  output wire [1:0]    axiOut_2_awburst,
  output wire [0:0]    axiOut_2_awlock,
  output wire [3:0]    axiOut_2_awcache,
  output wire [2:0]    axiOut_2_awprot,
  output wire          axiOut_2_wvalid,
  input  wire          axiOut_2_wready,
  output wire [31:0]   axiOut_2_wdata,
  output wire [3:0]    axiOut_2_wstrb,
  output wire          axiOut_2_wlast,
  input  wire          axiOut_2_bvalid,
  output wire          axiOut_2_bready,
  input  wire [4:0]    axiOut_2_bid,
  input  wire [1:0]    axiOut_2_bresp,
  output wire          axiOut_2_arvalid,
  input  wire          axiOut_2_arready,
  output wire [31:0]   axiOut_2_araddr,
  output wire [4:0]    axiOut_2_arid,
  output wire [7:0]    axiOut_2_arlen,
  output wire [2:0]    axiOut_2_arsize,
  output wire [1:0]    axiOut_2_arburst,
  output wire [0:0]    axiOut_2_arlock,
  output wire [3:0]    axiOut_2_arcache,
  output wire [2:0]    axiOut_2_arprot,
  input  wire          axiOut_2_rvalid,
  output wire          axiOut_2_rready,
  input  wire [31:0]   axiOut_2_rdata,
  input  wire [4:0]    axiOut_2_rid,
  input  wire [1:0]    axiOut_2_rresp,
  input  wire          axiOut_2_rlast,
  output wire          axiOut_3_awvalid,
  input  wire          axiOut_3_awready,
  output wire [31:0]   axiOut_3_awaddr,
  output wire [4:0]    axiOut_3_awid,
  output wire [7:0]    axiOut_3_awlen,
  output wire [2:0]    axiOut_3_awsize,
  output wire [1:0]    axiOut_3_awburst,
  output wire [0:0]    axiOut_3_awlock,
  output wire [3:0]    axiOut_3_awcache,
  output wire [2:0]    axiOut_3_awprot,
  output wire          axiOut_3_wvalid,
  input  wire          axiOut_3_wready,
  output wire [31:0]   axiOut_3_wdata,
  output wire [3:0]    axiOut_3_wstrb,
  output wire          axiOut_3_wlast,
  input  wire          axiOut_3_bvalid,
  output wire          axiOut_3_bready,
  input  wire [4:0]    axiOut_3_bid,
  input  wire [1:0]    axiOut_3_bresp,
  output wire          axiOut_3_arvalid,
  input  wire          axiOut_3_arready,
  output wire [31:0]   axiOut_3_araddr,
  output wire [4:0]    axiOut_3_arid,
  output wire [7:0]    axiOut_3_arlen,
  output wire [2:0]    axiOut_3_arsize,
  output wire [1:0]    axiOut_3_arburst,
  output wire [0:0]    axiOut_3_arlock,
  output wire [3:0]    axiOut_3_arcache,
  output wire [2:0]    axiOut_3_arprot,
  input  wire          axiOut_3_rvalid,
  output wire          axiOut_3_rready,
  input  wire [31:0]   axiOut_3_rdata,
  input  wire [4:0]    axiOut_3_rid,
  input  wire [1:0]    axiOut_3_rresp,
  input  wire          axiOut_3_rlast,
  input  wire          clk,
  input  wire          resetn
);

  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_0_r_payload_id;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_1_r_payload_id;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_2_r_payload_id;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_3_r_payload_id;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_0_b_payload_id;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_1_b_payload_id;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_2_b_payload_id;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_3_b_payload_id;
  wire                axiIn_readOnly_decoder_io_input_ar_ready;
  wire                axiIn_readOnly_decoder_io_input_r_valid;
  wire       [31:0]   axiIn_readOnly_decoder_io_input_r_payload_data;
  wire       [3:0]    axiIn_readOnly_decoder_io_input_r_payload_id;
  wire       [1:0]    axiIn_readOnly_decoder_io_input_r_payload_resp;
  wire                axiIn_readOnly_decoder_io_input_r_payload_last;
  wire                axiIn_readOnly_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   axiIn_readOnly_decoder_io_outputs_0_ar_payload_addr;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_id;
  wire       [7:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_size;
  wire       [1:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_burst;
  wire       [0:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_lock;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_0_ar_payload_prot;
  wire                axiIn_readOnly_decoder_io_outputs_0_r_ready;
  wire                axiIn_readOnly_decoder_io_outputs_1_ar_valid;
  wire       [31:0]   axiIn_readOnly_decoder_io_outputs_1_ar_payload_addr;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_id;
  wire       [7:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_len;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_size;
  wire       [1:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_burst;
  wire       [0:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_lock;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_cache;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_1_ar_payload_prot;
  wire                axiIn_readOnly_decoder_io_outputs_1_r_ready;
  wire                axiIn_readOnly_decoder_io_outputs_2_ar_valid;
  wire       [31:0]   axiIn_readOnly_decoder_io_outputs_2_ar_payload_addr;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_id;
  wire       [7:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_len;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_size;
  wire       [1:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_burst;
  wire       [0:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_lock;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_cache;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_2_ar_payload_prot;
  wire                axiIn_readOnly_decoder_io_outputs_2_r_ready;
  wire                axiIn_readOnly_decoder_io_outputs_3_ar_valid;
  wire       [31:0]   axiIn_readOnly_decoder_io_outputs_3_ar_payload_addr;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_id;
  wire       [7:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_len;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_size;
  wire       [1:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_burst;
  wire       [0:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_lock;
  wire       [3:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_cache;
  wire       [2:0]    axiIn_readOnly_decoder_io_outputs_3_ar_payload_prot;
  wire                axiIn_readOnly_decoder_io_outputs_3_r_ready;
  wire                axiIn_writeOnly_decoder_io_input_aw_ready;
  wire                axiIn_writeOnly_decoder_io_input_w_ready;
  wire                axiIn_writeOnly_decoder_io_input_b_valid;
  wire       [3:0]    axiIn_writeOnly_decoder_io_input_b_payload_id;
  wire       [1:0]    axiIn_writeOnly_decoder_io_input_b_payload_resp;
  wire                axiIn_writeOnly_decoder_io_outputs_0_aw_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_id;
  wire       [7:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_len;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_size;
  wire       [1:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  wire       [0:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  wire                axiIn_writeOnly_decoder_io_outputs_0_w_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_0_w_payload_data;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_0_w_payload_strb;
  wire                axiIn_writeOnly_decoder_io_outputs_0_w_payload_last;
  wire                axiIn_writeOnly_decoder_io_outputs_0_b_ready;
  wire                axiIn_writeOnly_decoder_io_outputs_1_aw_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_1_aw_payload_addr;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_id;
  wire       [7:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_len;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_size;
  wire       [1:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_burst;
  wire       [0:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_lock;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_cache;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_1_aw_payload_prot;
  wire                axiIn_writeOnly_decoder_io_outputs_1_w_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_1_w_payload_data;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_1_w_payload_strb;
  wire                axiIn_writeOnly_decoder_io_outputs_1_w_payload_last;
  wire                axiIn_writeOnly_decoder_io_outputs_1_b_ready;
  wire                axiIn_writeOnly_decoder_io_outputs_2_aw_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_2_aw_payload_addr;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_id;
  wire       [7:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_len;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_size;
  wire       [1:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_burst;
  wire       [0:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_lock;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_cache;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_2_aw_payload_prot;
  wire                axiIn_writeOnly_decoder_io_outputs_2_w_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_2_w_payload_data;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_2_w_payload_strb;
  wire                axiIn_writeOnly_decoder_io_outputs_2_w_payload_last;
  wire                axiIn_writeOnly_decoder_io_outputs_2_b_ready;
  wire                axiIn_writeOnly_decoder_io_outputs_3_aw_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_3_aw_payload_addr;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_id;
  wire       [7:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_len;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_size;
  wire       [1:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_burst;
  wire       [0:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_lock;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_cache;
  wire       [2:0]    axiIn_writeOnly_decoder_io_outputs_3_aw_payload_prot;
  wire                axiIn_writeOnly_decoder_io_outputs_3_w_valid;
  wire       [31:0]   axiIn_writeOnly_decoder_io_outputs_3_w_payload_data;
  wire       [3:0]    axiIn_writeOnly_decoder_io_outputs_3_w_payload_strb;
  wire                axiIn_writeOnly_decoder_io_outputs_3_w_payload_last;
  wire                axiIn_writeOnly_decoder_io_outputs_3_b_ready;
  wire                axiIn_readOnly_ar_valid;
  wire                axiIn_readOnly_ar_ready;
  wire       [31:0]   axiIn_readOnly_ar_payload_addr;
  wire       [3:0]    axiIn_readOnly_ar_payload_id;
  wire       [7:0]    axiIn_readOnly_ar_payload_len;
  wire       [2:0]    axiIn_readOnly_ar_payload_size;
  wire       [1:0]    axiIn_readOnly_ar_payload_burst;
  wire       [0:0]    axiIn_readOnly_ar_payload_lock;
  wire       [3:0]    axiIn_readOnly_ar_payload_cache;
  wire       [2:0]    axiIn_readOnly_ar_payload_prot;
  wire                axiIn_readOnly_r_valid;
  wire                axiIn_readOnly_r_ready;
  wire       [31:0]   axiIn_readOnly_r_payload_data;
  wire       [3:0]    axiIn_readOnly_r_payload_id;
  wire       [1:0]    axiIn_readOnly_r_payload_resp;
  wire                axiIn_readOnly_r_payload_last;
  wire                axiIn_writeOnly_aw_valid;
  wire                axiIn_writeOnly_aw_ready;
  wire       [31:0]   axiIn_writeOnly_aw_payload_addr;
  wire       [3:0]    axiIn_writeOnly_aw_payload_id;
  wire       [7:0]    axiIn_writeOnly_aw_payload_len;
  wire       [2:0]    axiIn_writeOnly_aw_payload_size;
  wire       [1:0]    axiIn_writeOnly_aw_payload_burst;
  wire       [0:0]    axiIn_writeOnly_aw_payload_lock;
  wire       [3:0]    axiIn_writeOnly_aw_payload_cache;
  wire       [2:0]    axiIn_writeOnly_aw_payload_prot;
  wire                axiIn_writeOnly_w_valid;
  wire                axiIn_writeOnly_w_ready;
  wire       [31:0]   axiIn_writeOnly_w_payload_data;
  wire       [3:0]    axiIn_writeOnly_w_payload_strb;
  wire                axiIn_writeOnly_w_payload_last;
  wire                axiIn_writeOnly_b_valid;
  wire                axiIn_writeOnly_b_ready;
  wire       [3:0]    axiIn_writeOnly_b_payload_id;
  wire       [1:0]    axiIn_writeOnly_b_payload_resp;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_valid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_rValid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_fire;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_valid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_rValid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_fire;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_valid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_rValid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_fire;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_valid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_rValid;
  wire                toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_fire;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_valid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_rValid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_fire;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_valid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_rValid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_fire;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_valid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_rValid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_fire;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_valid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_rValid;
  wire                toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_fire;

  Axi4ReadOnlyDecoder axiIn_readOnly_decoder (
    .io_input_ar_valid             (axiIn_readOnly_ar_valid                                       ), //i
    .io_input_ar_ready             (axiIn_readOnly_decoder_io_input_ar_ready                      ), //o
    .io_input_ar_payload_addr      (axiIn_readOnly_ar_payload_addr[31:0]                          ), //i
    .io_input_ar_payload_id        (axiIn_readOnly_ar_payload_id[3:0]                             ), //i
    .io_input_ar_payload_len       (axiIn_readOnly_ar_payload_len[7:0]                            ), //i
    .io_input_ar_payload_size      (axiIn_readOnly_ar_payload_size[2:0]                           ), //i
    .io_input_ar_payload_burst     (axiIn_readOnly_ar_payload_burst[1:0]                          ), //i
    .io_input_ar_payload_lock      (axiIn_readOnly_ar_payload_lock                                ), //i
    .io_input_ar_payload_cache     (axiIn_readOnly_ar_payload_cache[3:0]                          ), //i
    .io_input_ar_payload_prot      (axiIn_readOnly_ar_payload_prot[2:0]                           ), //i
    .io_input_r_valid              (axiIn_readOnly_decoder_io_input_r_valid                       ), //o
    .io_input_r_ready              (axiIn_readOnly_r_ready                                        ), //i
    .io_input_r_payload_data       (axiIn_readOnly_decoder_io_input_r_payload_data[31:0]          ), //o
    .io_input_r_payload_id         (axiIn_readOnly_decoder_io_input_r_payload_id[3:0]             ), //o
    .io_input_r_payload_resp       (axiIn_readOnly_decoder_io_input_r_payload_resp[1:0]           ), //o
    .io_input_r_payload_last       (axiIn_readOnly_decoder_io_input_r_payload_last                ), //o
    .io_outputs_0_ar_valid         (axiIn_readOnly_decoder_io_outputs_0_ar_valid                  ), //o
    .io_outputs_0_ar_ready         (toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_fire), //i
    .io_outputs_0_ar_payload_addr  (axiIn_readOnly_decoder_io_outputs_0_ar_payload_addr[31:0]     ), //o
    .io_outputs_0_ar_payload_id    (axiIn_readOnly_decoder_io_outputs_0_ar_payload_id[3:0]        ), //o
    .io_outputs_0_ar_payload_len   (axiIn_readOnly_decoder_io_outputs_0_ar_payload_len[7:0]       ), //o
    .io_outputs_0_ar_payload_size  (axiIn_readOnly_decoder_io_outputs_0_ar_payload_size[2:0]      ), //o
    .io_outputs_0_ar_payload_burst (axiIn_readOnly_decoder_io_outputs_0_ar_payload_burst[1:0]     ), //o
    .io_outputs_0_ar_payload_lock  (axiIn_readOnly_decoder_io_outputs_0_ar_payload_lock           ), //o
    .io_outputs_0_ar_payload_cache (axiIn_readOnly_decoder_io_outputs_0_ar_payload_cache[3:0]     ), //o
    .io_outputs_0_ar_payload_prot  (axiIn_readOnly_decoder_io_outputs_0_ar_payload_prot[2:0]      ), //o
    .io_outputs_0_r_valid          (axiOut_0_rvalid                                               ), //i
    .io_outputs_0_r_ready          (axiIn_readOnly_decoder_io_outputs_0_r_ready                   ), //o
    .io_outputs_0_r_payload_data   (axiOut_0_rdata[31:0]                                          ), //i
    .io_outputs_0_r_payload_id     (axiIn_readOnly_decoder_io_outputs_0_r_payload_id[3:0]         ), //i
    .io_outputs_0_r_payload_resp   (axiOut_0_rresp[1:0]                                           ), //i
    .io_outputs_0_r_payload_last   (axiOut_0_rlast                                                ), //i
    .io_outputs_1_ar_valid         (axiIn_readOnly_decoder_io_outputs_1_ar_valid                  ), //o
    .io_outputs_1_ar_ready         (toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_fire), //i
    .io_outputs_1_ar_payload_addr  (axiIn_readOnly_decoder_io_outputs_1_ar_payload_addr[31:0]     ), //o
    .io_outputs_1_ar_payload_id    (axiIn_readOnly_decoder_io_outputs_1_ar_payload_id[3:0]        ), //o
    .io_outputs_1_ar_payload_len   (axiIn_readOnly_decoder_io_outputs_1_ar_payload_len[7:0]       ), //o
    .io_outputs_1_ar_payload_size  (axiIn_readOnly_decoder_io_outputs_1_ar_payload_size[2:0]      ), //o
    .io_outputs_1_ar_payload_burst (axiIn_readOnly_decoder_io_outputs_1_ar_payload_burst[1:0]     ), //o
    .io_outputs_1_ar_payload_lock  (axiIn_readOnly_decoder_io_outputs_1_ar_payload_lock           ), //o
    .io_outputs_1_ar_payload_cache (axiIn_readOnly_decoder_io_outputs_1_ar_payload_cache[3:0]     ), //o
    .io_outputs_1_ar_payload_prot  (axiIn_readOnly_decoder_io_outputs_1_ar_payload_prot[2:0]      ), //o
    .io_outputs_1_r_valid          (axiOut_1_rvalid                                               ), //i
    .io_outputs_1_r_ready          (axiIn_readOnly_decoder_io_outputs_1_r_ready                   ), //o
    .io_outputs_1_r_payload_data   (axiOut_1_rdata[31:0]                                          ), //i
    .io_outputs_1_r_payload_id     (axiIn_readOnly_decoder_io_outputs_1_r_payload_id[3:0]         ), //i
    .io_outputs_1_r_payload_resp   (axiOut_1_rresp[1:0]                                           ), //i
    .io_outputs_1_r_payload_last   (axiOut_1_rlast                                                ), //i
    .io_outputs_2_ar_valid         (axiIn_readOnly_decoder_io_outputs_2_ar_valid                  ), //o
    .io_outputs_2_ar_ready         (toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_fire), //i
    .io_outputs_2_ar_payload_addr  (axiIn_readOnly_decoder_io_outputs_2_ar_payload_addr[31:0]     ), //o
    .io_outputs_2_ar_payload_id    (axiIn_readOnly_decoder_io_outputs_2_ar_payload_id[3:0]        ), //o
    .io_outputs_2_ar_payload_len   (axiIn_readOnly_decoder_io_outputs_2_ar_payload_len[7:0]       ), //o
    .io_outputs_2_ar_payload_size  (axiIn_readOnly_decoder_io_outputs_2_ar_payload_size[2:0]      ), //o
    .io_outputs_2_ar_payload_burst (axiIn_readOnly_decoder_io_outputs_2_ar_payload_burst[1:0]     ), //o
    .io_outputs_2_ar_payload_lock  (axiIn_readOnly_decoder_io_outputs_2_ar_payload_lock           ), //o
    .io_outputs_2_ar_payload_cache (axiIn_readOnly_decoder_io_outputs_2_ar_payload_cache[3:0]     ), //o
    .io_outputs_2_ar_payload_prot  (axiIn_readOnly_decoder_io_outputs_2_ar_payload_prot[2:0]      ), //o
    .io_outputs_2_r_valid          (axiOut_2_rvalid                                               ), //i
    .io_outputs_2_r_ready          (axiIn_readOnly_decoder_io_outputs_2_r_ready                   ), //o
    .io_outputs_2_r_payload_data   (axiOut_2_rdata[31:0]                                          ), //i
    .io_outputs_2_r_payload_id     (axiIn_readOnly_decoder_io_outputs_2_r_payload_id[3:0]         ), //i
    .io_outputs_2_r_payload_resp   (axiOut_2_rresp[1:0]                                           ), //i
    .io_outputs_2_r_payload_last   (axiOut_2_rlast                                                ), //i
    .io_outputs_3_ar_valid         (axiIn_readOnly_decoder_io_outputs_3_ar_valid                  ), //o
    .io_outputs_3_ar_ready         (toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_fire), //i
    .io_outputs_3_ar_payload_addr  (axiIn_readOnly_decoder_io_outputs_3_ar_payload_addr[31:0]     ), //o
    .io_outputs_3_ar_payload_id    (axiIn_readOnly_decoder_io_outputs_3_ar_payload_id[3:0]        ), //o
    .io_outputs_3_ar_payload_len   (axiIn_readOnly_decoder_io_outputs_3_ar_payload_len[7:0]       ), //o
    .io_outputs_3_ar_payload_size  (axiIn_readOnly_decoder_io_outputs_3_ar_payload_size[2:0]      ), //o
    .io_outputs_3_ar_payload_burst (axiIn_readOnly_decoder_io_outputs_3_ar_payload_burst[1:0]     ), //o
    .io_outputs_3_ar_payload_lock  (axiIn_readOnly_decoder_io_outputs_3_ar_payload_lock           ), //o
    .io_outputs_3_ar_payload_cache (axiIn_readOnly_decoder_io_outputs_3_ar_payload_cache[3:0]     ), //o
    .io_outputs_3_ar_payload_prot  (axiIn_readOnly_decoder_io_outputs_3_ar_payload_prot[2:0]      ), //o
    .io_outputs_3_r_valid          (axiOut_3_rvalid                                               ), //i
    .io_outputs_3_r_ready          (axiIn_readOnly_decoder_io_outputs_3_r_ready                   ), //o
    .io_outputs_3_r_payload_data   (axiOut_3_rdata[31:0]                                          ), //i
    .io_outputs_3_r_payload_id     (axiIn_readOnly_decoder_io_outputs_3_r_payload_id[3:0]         ), //i
    .io_outputs_3_r_payload_resp   (axiOut_3_rresp[1:0]                                           ), //i
    .io_outputs_3_r_payload_last   (axiOut_3_rlast                                                ), //i
    .clk                           (clk                                                           ), //i
    .resetn                        (resetn                                                        )  //i
  );
  Axi4WriteOnlyDecoder axiIn_writeOnly_decoder (
    .io_input_aw_valid             (axiIn_writeOnly_aw_valid                                       ), //i
    .io_input_aw_ready             (axiIn_writeOnly_decoder_io_input_aw_ready                      ), //o
    .io_input_aw_payload_addr      (axiIn_writeOnly_aw_payload_addr[31:0]                          ), //i
    .io_input_aw_payload_id        (axiIn_writeOnly_aw_payload_id[3:0]                             ), //i
    .io_input_aw_payload_len       (axiIn_writeOnly_aw_payload_len[7:0]                            ), //i
    .io_input_aw_payload_size      (axiIn_writeOnly_aw_payload_size[2:0]                           ), //i
    .io_input_aw_payload_burst     (axiIn_writeOnly_aw_payload_burst[1:0]                          ), //i
    .io_input_aw_payload_lock      (axiIn_writeOnly_aw_payload_lock                                ), //i
    .io_input_aw_payload_cache     (axiIn_writeOnly_aw_payload_cache[3:0]                          ), //i
    .io_input_aw_payload_prot      (axiIn_writeOnly_aw_payload_prot[2:0]                           ), //i
    .io_input_w_valid              (axiIn_writeOnly_w_valid                                        ), //i
    .io_input_w_ready              (axiIn_writeOnly_decoder_io_input_w_ready                       ), //o
    .io_input_w_payload_data       (axiIn_writeOnly_w_payload_data[31:0]                           ), //i
    .io_input_w_payload_strb       (axiIn_writeOnly_w_payload_strb[3:0]                            ), //i
    .io_input_w_payload_last       (axiIn_writeOnly_w_payload_last                                 ), //i
    .io_input_b_valid              (axiIn_writeOnly_decoder_io_input_b_valid                       ), //o
    .io_input_b_ready              (axiIn_writeOnly_b_ready                                        ), //i
    .io_input_b_payload_id         (axiIn_writeOnly_decoder_io_input_b_payload_id[3:0]             ), //o
    .io_input_b_payload_resp       (axiIn_writeOnly_decoder_io_input_b_payload_resp[1:0]           ), //o
    .io_outputs_0_aw_valid         (axiIn_writeOnly_decoder_io_outputs_0_aw_valid                  ), //o
    .io_outputs_0_aw_ready         (toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_fire), //i
    .io_outputs_0_aw_payload_addr  (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_addr[31:0]     ), //o
    .io_outputs_0_aw_payload_id    (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_id[3:0]        ), //o
    .io_outputs_0_aw_payload_len   (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_len[7:0]       ), //o
    .io_outputs_0_aw_payload_size  (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_size[2:0]      ), //o
    .io_outputs_0_aw_payload_burst (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_burst[1:0]     ), //o
    .io_outputs_0_aw_payload_lock  (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_lock           ), //o
    .io_outputs_0_aw_payload_cache (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_cache[3:0]     ), //o
    .io_outputs_0_aw_payload_prot  (axiIn_writeOnly_decoder_io_outputs_0_aw_payload_prot[2:0]      ), //o
    .io_outputs_0_w_valid          (axiIn_writeOnly_decoder_io_outputs_0_w_valid                   ), //o
    .io_outputs_0_w_ready          (axiOut_0_wready                                                ), //i
    .io_outputs_0_w_payload_data   (axiIn_writeOnly_decoder_io_outputs_0_w_payload_data[31:0]      ), //o
    .io_outputs_0_w_payload_strb   (axiIn_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]       ), //o
    .io_outputs_0_w_payload_last   (axiIn_writeOnly_decoder_io_outputs_0_w_payload_last            ), //o
    .io_outputs_0_b_valid          (axiOut_0_bvalid                                                ), //i
    .io_outputs_0_b_ready          (axiIn_writeOnly_decoder_io_outputs_0_b_ready                   ), //o
    .io_outputs_0_b_payload_id     (axiIn_writeOnly_decoder_io_outputs_0_b_payload_id[3:0]         ), //i
    .io_outputs_0_b_payload_resp   (axiOut_0_bresp[1:0]                                            ), //i
    .io_outputs_1_aw_valid         (axiIn_writeOnly_decoder_io_outputs_1_aw_valid                  ), //o
    .io_outputs_1_aw_ready         (toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_fire), //i
    .io_outputs_1_aw_payload_addr  (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_addr[31:0]     ), //o
    .io_outputs_1_aw_payload_id    (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_id[3:0]        ), //o
    .io_outputs_1_aw_payload_len   (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_len[7:0]       ), //o
    .io_outputs_1_aw_payload_size  (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_size[2:0]      ), //o
    .io_outputs_1_aw_payload_burst (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_burst[1:0]     ), //o
    .io_outputs_1_aw_payload_lock  (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_lock           ), //o
    .io_outputs_1_aw_payload_cache (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_cache[3:0]     ), //o
    .io_outputs_1_aw_payload_prot  (axiIn_writeOnly_decoder_io_outputs_1_aw_payload_prot[2:0]      ), //o
    .io_outputs_1_w_valid          (axiIn_writeOnly_decoder_io_outputs_1_w_valid                   ), //o
    .io_outputs_1_w_ready          (axiOut_1_wready                                                ), //i
    .io_outputs_1_w_payload_data   (axiIn_writeOnly_decoder_io_outputs_1_w_payload_data[31:0]      ), //o
    .io_outputs_1_w_payload_strb   (axiIn_writeOnly_decoder_io_outputs_1_w_payload_strb[3:0]       ), //o
    .io_outputs_1_w_payload_last   (axiIn_writeOnly_decoder_io_outputs_1_w_payload_last            ), //o
    .io_outputs_1_b_valid          (axiOut_1_bvalid                                                ), //i
    .io_outputs_1_b_ready          (axiIn_writeOnly_decoder_io_outputs_1_b_ready                   ), //o
    .io_outputs_1_b_payload_id     (axiIn_writeOnly_decoder_io_outputs_1_b_payload_id[3:0]         ), //i
    .io_outputs_1_b_payload_resp   (axiOut_1_bresp[1:0]                                            ), //i
    .io_outputs_2_aw_valid         (axiIn_writeOnly_decoder_io_outputs_2_aw_valid                  ), //o
    .io_outputs_2_aw_ready         (toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_fire), //i
    .io_outputs_2_aw_payload_addr  (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_addr[31:0]     ), //o
    .io_outputs_2_aw_payload_id    (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_id[3:0]        ), //o
    .io_outputs_2_aw_payload_len   (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_len[7:0]       ), //o
    .io_outputs_2_aw_payload_size  (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_size[2:0]      ), //o
    .io_outputs_2_aw_payload_burst (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_burst[1:0]     ), //o
    .io_outputs_2_aw_payload_lock  (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_lock           ), //o
    .io_outputs_2_aw_payload_cache (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_cache[3:0]     ), //o
    .io_outputs_2_aw_payload_prot  (axiIn_writeOnly_decoder_io_outputs_2_aw_payload_prot[2:0]      ), //o
    .io_outputs_2_w_valid          (axiIn_writeOnly_decoder_io_outputs_2_w_valid                   ), //o
    .io_outputs_2_w_ready          (axiOut_2_wready                                                ), //i
    .io_outputs_2_w_payload_data   (axiIn_writeOnly_decoder_io_outputs_2_w_payload_data[31:0]      ), //o
    .io_outputs_2_w_payload_strb   (axiIn_writeOnly_decoder_io_outputs_2_w_payload_strb[3:0]       ), //o
    .io_outputs_2_w_payload_last   (axiIn_writeOnly_decoder_io_outputs_2_w_payload_last            ), //o
    .io_outputs_2_b_valid          (axiOut_2_bvalid                                                ), //i
    .io_outputs_2_b_ready          (axiIn_writeOnly_decoder_io_outputs_2_b_ready                   ), //o
    .io_outputs_2_b_payload_id     (axiIn_writeOnly_decoder_io_outputs_2_b_payload_id[3:0]         ), //i
    .io_outputs_2_b_payload_resp   (axiOut_2_bresp[1:0]                                            ), //i
    .io_outputs_3_aw_valid         (axiIn_writeOnly_decoder_io_outputs_3_aw_valid                  ), //o
    .io_outputs_3_aw_ready         (toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_fire), //i
    .io_outputs_3_aw_payload_addr  (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_addr[31:0]     ), //o
    .io_outputs_3_aw_payload_id    (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_id[3:0]        ), //o
    .io_outputs_3_aw_payload_len   (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_len[7:0]       ), //o
    .io_outputs_3_aw_payload_size  (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_size[2:0]      ), //o
    .io_outputs_3_aw_payload_burst (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_burst[1:0]     ), //o
    .io_outputs_3_aw_payload_lock  (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_lock           ), //o
    .io_outputs_3_aw_payload_cache (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_cache[3:0]     ), //o
    .io_outputs_3_aw_payload_prot  (axiIn_writeOnly_decoder_io_outputs_3_aw_payload_prot[2:0]      ), //o
    .io_outputs_3_w_valid          (axiIn_writeOnly_decoder_io_outputs_3_w_valid                   ), //o
    .io_outputs_3_w_ready          (axiOut_3_wready                                                ), //i
    .io_outputs_3_w_payload_data   (axiIn_writeOnly_decoder_io_outputs_3_w_payload_data[31:0]      ), //o
    .io_outputs_3_w_payload_strb   (axiIn_writeOnly_decoder_io_outputs_3_w_payload_strb[3:0]       ), //o
    .io_outputs_3_w_payload_last   (axiIn_writeOnly_decoder_io_outputs_3_w_payload_last            ), //o
    .io_outputs_3_b_valid          (axiOut_3_bvalid                                                ), //i
    .io_outputs_3_b_ready          (axiIn_writeOnly_decoder_io_outputs_3_b_ready                   ), //o
    .io_outputs_3_b_payload_id     (axiIn_writeOnly_decoder_io_outputs_3_b_payload_id[3:0]         ), //i
    .io_outputs_3_b_payload_resp   (axiOut_3_bresp[1:0]                                            ), //i
    .clk                           (clk                                                            ), //i
    .resetn                        (resetn                                                         )  //i
  );
  assign axiOut_0_arvalid = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_valid;
  assign axiOut_0_araddr = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr;
  assign axiOut_0_arid = {1'd0, toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id};
  assign axiOut_0_arlen = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len;
  assign axiOut_0_arsize = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size;
  assign axiOut_0_arburst = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst;
  assign axiOut_0_arlock = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock;
  assign axiOut_0_arcache = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache;
  assign axiOut_0_arprot = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot;
  assign axiOut_0_rready = axiIn_readOnly_decoder_io_outputs_0_r_ready;
  assign axiOut_0_awvalid = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_valid;
  assign axiOut_0_awaddr = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr;
  assign axiOut_0_awid = {1'd0, toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id};
  assign axiOut_0_awlen = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len;
  assign axiOut_0_awsize = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size;
  assign axiOut_0_awburst = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst;
  assign axiOut_0_awlock = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock;
  assign axiOut_0_awcache = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache;
  assign axiOut_0_awprot = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot;
  assign axiOut_0_wvalid = axiIn_writeOnly_decoder_io_outputs_0_w_valid;
  assign axiOut_0_wdata = axiIn_writeOnly_decoder_io_outputs_0_w_payload_data;
  assign axiOut_0_wstrb = axiIn_writeOnly_decoder_io_outputs_0_w_payload_strb;
  assign axiOut_0_wlast = axiIn_writeOnly_decoder_io_outputs_0_w_payload_last;
  assign axiOut_0_bready = axiIn_writeOnly_decoder_io_outputs_0_b_ready;
  assign axiOut_1_arvalid = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_valid;
  assign axiOut_1_araddr = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr;
  assign axiOut_1_arid = {1'd0, toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id};
  assign axiOut_1_arlen = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len;
  assign axiOut_1_arsize = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size;
  assign axiOut_1_arburst = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst;
  assign axiOut_1_arlock = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock;
  assign axiOut_1_arcache = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache;
  assign axiOut_1_arprot = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot;
  assign axiOut_1_rready = axiIn_readOnly_decoder_io_outputs_1_r_ready;
  assign axiOut_1_awvalid = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_valid;
  assign axiOut_1_awaddr = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr;
  assign axiOut_1_awid = {1'd0, toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id};
  assign axiOut_1_awlen = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len;
  assign axiOut_1_awsize = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size;
  assign axiOut_1_awburst = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst;
  assign axiOut_1_awlock = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock;
  assign axiOut_1_awcache = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache;
  assign axiOut_1_awprot = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot;
  assign axiOut_1_wvalid = axiIn_writeOnly_decoder_io_outputs_1_w_valid;
  assign axiOut_1_wdata = axiIn_writeOnly_decoder_io_outputs_1_w_payload_data;
  assign axiOut_1_wstrb = axiIn_writeOnly_decoder_io_outputs_1_w_payload_strb;
  assign axiOut_1_wlast = axiIn_writeOnly_decoder_io_outputs_1_w_payload_last;
  assign axiOut_1_bready = axiIn_writeOnly_decoder_io_outputs_1_b_ready;
  assign axiOut_2_arvalid = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_valid;
  assign axiOut_2_araddr = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr;
  assign axiOut_2_arid = {1'd0, toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id};
  assign axiOut_2_arlen = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len;
  assign axiOut_2_arsize = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size;
  assign axiOut_2_arburst = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst;
  assign axiOut_2_arlock = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock;
  assign axiOut_2_arcache = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache;
  assign axiOut_2_arprot = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot;
  assign axiOut_2_rready = axiIn_readOnly_decoder_io_outputs_2_r_ready;
  assign axiOut_2_awvalid = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_valid;
  assign axiOut_2_awaddr = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr;
  assign axiOut_2_awid = {1'd0, toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id};
  assign axiOut_2_awlen = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len;
  assign axiOut_2_awsize = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size;
  assign axiOut_2_awburst = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst;
  assign axiOut_2_awlock = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock;
  assign axiOut_2_awcache = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache;
  assign axiOut_2_awprot = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot;
  assign axiOut_2_wvalid = axiIn_writeOnly_decoder_io_outputs_2_w_valid;
  assign axiOut_2_wdata = axiIn_writeOnly_decoder_io_outputs_2_w_payload_data;
  assign axiOut_2_wstrb = axiIn_writeOnly_decoder_io_outputs_2_w_payload_strb;
  assign axiOut_2_wlast = axiIn_writeOnly_decoder_io_outputs_2_w_payload_last;
  assign axiOut_2_bready = axiIn_writeOnly_decoder_io_outputs_2_b_ready;
  assign axiOut_3_arvalid = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_valid;
  assign axiOut_3_araddr = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr;
  assign axiOut_3_arid = {1'd0, toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id};
  assign axiOut_3_arlen = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len;
  assign axiOut_3_arsize = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size;
  assign axiOut_3_arburst = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst;
  assign axiOut_3_arlock = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock;
  assign axiOut_3_arcache = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache;
  assign axiOut_3_arprot = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot;
  assign axiOut_3_rready = axiIn_readOnly_decoder_io_outputs_3_r_ready;
  assign axiOut_3_awvalid = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_valid;
  assign axiOut_3_awaddr = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr;
  assign axiOut_3_awid = {1'd0, toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id};
  assign axiOut_3_awlen = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len;
  assign axiOut_3_awsize = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size;
  assign axiOut_3_awburst = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst;
  assign axiOut_3_awlock = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock;
  assign axiOut_3_awcache = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache;
  assign axiOut_3_awprot = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot;
  assign axiOut_3_wvalid = axiIn_writeOnly_decoder_io_outputs_3_w_valid;
  assign axiOut_3_wdata = axiIn_writeOnly_decoder_io_outputs_3_w_payload_data;
  assign axiOut_3_wstrb = axiIn_writeOnly_decoder_io_outputs_3_w_payload_strb;
  assign axiOut_3_wlast = axiIn_writeOnly_decoder_io_outputs_3_w_payload_last;
  assign axiOut_3_bready = axiIn_writeOnly_decoder_io_outputs_3_b_ready;
  assign axiIn_readOnly_ar_valid = axiIn_arvalid;
  assign axiIn_arready = axiIn_readOnly_ar_ready;
  assign axiIn_readOnly_ar_payload_addr = axiIn_araddr;
  assign axiIn_readOnly_ar_payload_id = axiIn_arid;
  assign axiIn_readOnly_ar_payload_len = axiIn_arlen;
  assign axiIn_readOnly_ar_payload_size = axiIn_arsize;
  assign axiIn_readOnly_ar_payload_burst = axiIn_arburst;
  assign axiIn_readOnly_ar_payload_lock = axiIn_arlock;
  assign axiIn_readOnly_ar_payload_cache = axiIn_arcache;
  assign axiIn_readOnly_ar_payload_prot = axiIn_arprot;
  assign axiIn_rvalid = axiIn_readOnly_r_valid;
  assign axiIn_readOnly_r_ready = axiIn_rready;
  assign axiIn_rdata = axiIn_readOnly_r_payload_data;
  assign axiIn_rlast = axiIn_readOnly_r_payload_last;
  assign axiIn_rid = axiIn_readOnly_r_payload_id;
  assign axiIn_rresp = axiIn_readOnly_r_payload_resp;
  assign axiIn_writeOnly_aw_valid = axiIn_awvalid;
  assign axiIn_awready = axiIn_writeOnly_aw_ready;
  assign axiIn_writeOnly_aw_payload_addr = axiIn_awaddr;
  assign axiIn_writeOnly_aw_payload_id = axiIn_awid;
  assign axiIn_writeOnly_aw_payload_len = axiIn_awlen;
  assign axiIn_writeOnly_aw_payload_size = axiIn_awsize;
  assign axiIn_writeOnly_aw_payload_burst = axiIn_awburst;
  assign axiIn_writeOnly_aw_payload_lock = axiIn_awlock;
  assign axiIn_writeOnly_aw_payload_cache = axiIn_awcache;
  assign axiIn_writeOnly_aw_payload_prot = axiIn_awprot;
  assign axiIn_writeOnly_w_valid = axiIn_wvalid;
  assign axiIn_wready = axiIn_writeOnly_w_ready;
  assign axiIn_writeOnly_w_payload_data = axiIn_wdata;
  assign axiIn_writeOnly_w_payload_strb = axiIn_wstrb;
  assign axiIn_writeOnly_w_payload_last = axiIn_wlast;
  assign axiIn_bvalid = axiIn_writeOnly_b_valid;
  assign axiIn_writeOnly_b_ready = axiIn_bready;
  assign axiIn_bid = axiIn_writeOnly_b_payload_id;
  assign axiIn_bresp = axiIn_writeOnly_b_payload_resp;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_fire = (toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_valid && toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_valid = toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_rValid;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr = axiIn_readOnly_decoder_io_outputs_0_ar_payload_addr;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id = axiIn_readOnly_decoder_io_outputs_0_ar_payload_id;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len = axiIn_readOnly_decoder_io_outputs_0_ar_payload_len;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size = axiIn_readOnly_decoder_io_outputs_0_ar_payload_size;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst = axiIn_readOnly_decoder_io_outputs_0_ar_payload_burst;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock = axiIn_readOnly_decoder_io_outputs_0_ar_payload_lock;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache = axiIn_readOnly_decoder_io_outputs_0_ar_payload_cache;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot = axiIn_readOnly_decoder_io_outputs_0_ar_payload_prot;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_ready = axiOut_0_arready;
  assign axiIn_readOnly_decoder_io_outputs_0_r_payload_id = axiOut_0_rid[3:0];
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_fire = (toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_valid && toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_ready);
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_valid = toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_rValid;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr = axiIn_readOnly_decoder_io_outputs_1_ar_payload_addr;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id = axiIn_readOnly_decoder_io_outputs_1_ar_payload_id;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len = axiIn_readOnly_decoder_io_outputs_1_ar_payload_len;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size = axiIn_readOnly_decoder_io_outputs_1_ar_payload_size;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst = axiIn_readOnly_decoder_io_outputs_1_ar_payload_burst;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock = axiIn_readOnly_decoder_io_outputs_1_ar_payload_lock;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache = axiIn_readOnly_decoder_io_outputs_1_ar_payload_cache;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot = axiIn_readOnly_decoder_io_outputs_1_ar_payload_prot;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_ready = axiOut_1_arready;
  assign axiIn_readOnly_decoder_io_outputs_1_r_payload_id = axiOut_1_rid[3:0];
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_fire = (toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_valid && toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_ready);
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_valid = toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_rValid;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr = axiIn_readOnly_decoder_io_outputs_2_ar_payload_addr;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id = axiIn_readOnly_decoder_io_outputs_2_ar_payload_id;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len = axiIn_readOnly_decoder_io_outputs_2_ar_payload_len;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size = axiIn_readOnly_decoder_io_outputs_2_ar_payload_size;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst = axiIn_readOnly_decoder_io_outputs_2_ar_payload_burst;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock = axiIn_readOnly_decoder_io_outputs_2_ar_payload_lock;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache = axiIn_readOnly_decoder_io_outputs_2_ar_payload_cache;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot = axiIn_readOnly_decoder_io_outputs_2_ar_payload_prot;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_ready = axiOut_2_arready;
  assign axiIn_readOnly_decoder_io_outputs_2_r_payload_id = axiOut_2_rid[3:0];
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_fire = (toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_valid && toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_ready);
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_valid = toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_rValid;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr = axiIn_readOnly_decoder_io_outputs_3_ar_payload_addr;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id = axiIn_readOnly_decoder_io_outputs_3_ar_payload_id;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len = axiIn_readOnly_decoder_io_outputs_3_ar_payload_len;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size = axiIn_readOnly_decoder_io_outputs_3_ar_payload_size;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst = axiIn_readOnly_decoder_io_outputs_3_ar_payload_burst;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock = axiIn_readOnly_decoder_io_outputs_3_ar_payload_lock;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache = axiIn_readOnly_decoder_io_outputs_3_ar_payload_cache;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot = axiIn_readOnly_decoder_io_outputs_3_ar_payload_prot;
  assign toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_ready = axiOut_3_arready;
  assign axiIn_readOnly_decoder_io_outputs_3_r_payload_id = axiOut_3_rid[3:0];
  assign axiIn_readOnly_ar_ready = axiIn_readOnly_decoder_io_input_ar_ready;
  assign axiIn_readOnly_r_valid = axiIn_readOnly_decoder_io_input_r_valid;
  assign axiIn_readOnly_r_payload_data = axiIn_readOnly_decoder_io_input_r_payload_data;
  assign axiIn_readOnly_r_payload_last = axiIn_readOnly_decoder_io_input_r_payload_last;
  assign axiIn_readOnly_r_payload_id = axiIn_readOnly_decoder_io_input_r_payload_id;
  assign axiIn_readOnly_r_payload_resp = axiIn_readOnly_decoder_io_input_r_payload_resp;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_fire = (toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_valid = toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_rValid;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_id;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_len;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_size;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot = axiIn_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_ready = axiOut_0_awready;
  assign axiIn_writeOnly_decoder_io_outputs_0_b_payload_id = axiOut_0_bid[3:0];
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_fire = (toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_valid && toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_ready);
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_valid = toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_rValid;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_addr;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_id;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_len;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_size;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_burst;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_lock;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_cache;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot = axiIn_writeOnly_decoder_io_outputs_1_aw_payload_prot;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_ready = axiOut_1_awready;
  assign axiIn_writeOnly_decoder_io_outputs_1_b_payload_id = axiOut_1_bid[3:0];
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_fire = (toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_valid && toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_ready);
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_valid = toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_rValid;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_addr;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_id;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_len;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_size;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_burst;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_lock;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_cache;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot = axiIn_writeOnly_decoder_io_outputs_2_aw_payload_prot;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_ready = axiOut_2_awready;
  assign axiIn_writeOnly_decoder_io_outputs_2_b_payload_id = axiOut_2_bid[3:0];
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_fire = (toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_valid && toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_ready);
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_valid = toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_rValid;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_addr;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_id;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_len;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_size;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_burst;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_lock;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_cache;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot = axiIn_writeOnly_decoder_io_outputs_3_aw_payload_prot;
  assign toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_ready = axiOut_3_awready;
  assign axiIn_writeOnly_decoder_io_outputs_3_b_payload_id = axiOut_3_bid[3:0];
  assign axiIn_writeOnly_aw_ready = axiIn_writeOnly_decoder_io_input_aw_ready;
  assign axiIn_writeOnly_w_ready = axiIn_writeOnly_decoder_io_input_w_ready;
  assign axiIn_writeOnly_b_valid = axiIn_writeOnly_decoder_io_input_b_valid;
  assign axiIn_writeOnly_b_payload_id = axiIn_writeOnly_decoder_io_input_b_payload_id;
  assign axiIn_writeOnly_b_payload_resp = axiIn_writeOnly_decoder_io_input_b_payload_resp;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b0;
      toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b0;
      toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b0;
      toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b0;
      toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b0;
      toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b0;
    end else begin
      if(axiIn_readOnly_decoder_io_outputs_0_ar_valid) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_validPipe_fire) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(axiIn_readOnly_decoder_io_outputs_1_ar_valid) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_validPipe_fire) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b0;
      end
      if(axiIn_readOnly_decoder_io_outputs_2_ar_valid) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_validPipe_fire) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b0;
      end
      if(axiIn_readOnly_decoder_io_outputs_3_ar_valid) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_validPipe_fire) begin
        toplevel_axiIn_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b0;
      end
      if(axiIn_writeOnly_decoder_io_outputs_0_aw_valid) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_validPipe_fire) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      end
      if(axiIn_writeOnly_decoder_io_outputs_1_aw_valid) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_validPipe_fire) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b0;
      end
      if(axiIn_writeOnly_decoder_io_outputs_2_aw_valid) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_validPipe_fire) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b0;
      end
      if(axiIn_writeOnly_decoder_io_outputs_3_aw_valid) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_validPipe_fire) begin
        toplevel_axiIn_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b0;
      end
    end
  end


endmodule

module Axi4WriteOnlyDecoder (
  input  wire          io_input_aw_valid,
  output wire          io_input_aw_ready,
  input  wire [31:0]   io_input_aw_payload_addr,
  input  wire [3:0]    io_input_aw_payload_id,
  input  wire [7:0]    io_input_aw_payload_len,
  input  wire [2:0]    io_input_aw_payload_size,
  input  wire [1:0]    io_input_aw_payload_burst,
  input  wire [0:0]    io_input_aw_payload_lock,
  input  wire [3:0]    io_input_aw_payload_cache,
  input  wire [2:0]    io_input_aw_payload_prot,
  input  wire          io_input_w_valid,
  output wire          io_input_w_ready,
  input  wire [31:0]   io_input_w_payload_data,
  input  wire [3:0]    io_input_w_payload_strb,
  input  wire          io_input_w_payload_last,
  output wire          io_input_b_valid,
  input  wire          io_input_b_ready,
  output reg  [3:0]    io_input_b_payload_id,
  output reg  [1:0]    io_input_b_payload_resp,
  output wire          io_outputs_0_aw_valid,
  input  wire          io_outputs_0_aw_ready,
  output wire [31:0]   io_outputs_0_aw_payload_addr,
  output wire [3:0]    io_outputs_0_aw_payload_id,
  output wire [7:0]    io_outputs_0_aw_payload_len,
  output wire [2:0]    io_outputs_0_aw_payload_size,
  output wire [1:0]    io_outputs_0_aw_payload_burst,
  output wire [0:0]    io_outputs_0_aw_payload_lock,
  output wire [3:0]    io_outputs_0_aw_payload_cache,
  output wire [2:0]    io_outputs_0_aw_payload_prot,
  output wire          io_outputs_0_w_valid,
  input  wire          io_outputs_0_w_ready,
  output wire [31:0]   io_outputs_0_w_payload_data,
  output wire [3:0]    io_outputs_0_w_payload_strb,
  output wire          io_outputs_0_w_payload_last,
  input  wire          io_outputs_0_b_valid,
  output wire          io_outputs_0_b_ready,
  input  wire [3:0]    io_outputs_0_b_payload_id,
  input  wire [1:0]    io_outputs_0_b_payload_resp,
  output wire          io_outputs_1_aw_valid,
  input  wire          io_outputs_1_aw_ready,
  output wire [31:0]   io_outputs_1_aw_payload_addr,
  output wire [3:0]    io_outputs_1_aw_payload_id,
  output wire [7:0]    io_outputs_1_aw_payload_len,
  output wire [2:0]    io_outputs_1_aw_payload_size,
  output wire [1:0]    io_outputs_1_aw_payload_burst,
  output wire [0:0]    io_outputs_1_aw_payload_lock,
  output wire [3:0]    io_outputs_1_aw_payload_cache,
  output wire [2:0]    io_outputs_1_aw_payload_prot,
  output wire          io_outputs_1_w_valid,
  input  wire          io_outputs_1_w_ready,
  output wire [31:0]   io_outputs_1_w_payload_data,
  output wire [3:0]    io_outputs_1_w_payload_strb,
  output wire          io_outputs_1_w_payload_last,
  input  wire          io_outputs_1_b_valid,
  output wire          io_outputs_1_b_ready,
  input  wire [3:0]    io_outputs_1_b_payload_id,
  input  wire [1:0]    io_outputs_1_b_payload_resp,
  output wire          io_outputs_2_aw_valid,
  input  wire          io_outputs_2_aw_ready,
  output wire [31:0]   io_outputs_2_aw_payload_addr,
  output wire [3:0]    io_outputs_2_aw_payload_id,
  output wire [7:0]    io_outputs_2_aw_payload_len,
  output wire [2:0]    io_outputs_2_aw_payload_size,
  output wire [1:0]    io_outputs_2_aw_payload_burst,
  output wire [0:0]    io_outputs_2_aw_payload_lock,
  output wire [3:0]    io_outputs_2_aw_payload_cache,
  output wire [2:0]    io_outputs_2_aw_payload_prot,
  output wire          io_outputs_2_w_valid,
  input  wire          io_outputs_2_w_ready,
  output wire [31:0]   io_outputs_2_w_payload_data,
  output wire [3:0]    io_outputs_2_w_payload_strb,
  output wire          io_outputs_2_w_payload_last,
  input  wire          io_outputs_2_b_valid,
  output wire          io_outputs_2_b_ready,
  input  wire [3:0]    io_outputs_2_b_payload_id,
  input  wire [1:0]    io_outputs_2_b_payload_resp,
  output wire          io_outputs_3_aw_valid,
  input  wire          io_outputs_3_aw_ready,
  output wire [31:0]   io_outputs_3_aw_payload_addr,
  output wire [3:0]    io_outputs_3_aw_payload_id,
  output wire [7:0]    io_outputs_3_aw_payload_len,
  output wire [2:0]    io_outputs_3_aw_payload_size,
  output wire [1:0]    io_outputs_3_aw_payload_burst,
  output wire [0:0]    io_outputs_3_aw_payload_lock,
  output wire [3:0]    io_outputs_3_aw_payload_cache,
  output wire [2:0]    io_outputs_3_aw_payload_prot,
  output wire          io_outputs_3_w_valid,
  input  wire          io_outputs_3_w_ready,
  output wire [31:0]   io_outputs_3_w_payload_data,
  output wire [3:0]    io_outputs_3_w_payload_strb,
  output wire          io_outputs_3_w_payload_last,
  input  wire          io_outputs_3_b_valid,
  output wire          io_outputs_3_b_ready,
  input  wire [3:0]    io_outputs_3_b_payload_id,
  input  wire [1:0]    io_outputs_3_b_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  wire                errorSlave_io_axi_aw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_aw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [3:0]    errorSlave_io_axi_b_payload_id;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire       [31:0]   _zz_decodedCmdSels;
  wire       [31:0]   _zz_decodedCmdSels_1;
  wire       [31:0]   _zz_decodedCmdSels_2;
  wire       [31:0]   _zz_decodedCmdSels_3;
  wire       [31:0]   _zz_decodedCmdSels_4;
  wire       [31:0]   _zz_decodedCmdSels_5;
  reg        [3:0]    _zz_io_input_b_payload_id;
  reg        [1:0]    _zz_io_input_b_payload_resp;
  wire                cmdAllowedStart;
  wire                io_input_aw_fire;
  wire                io_input_b_fire;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire                io_input_w_fire;
  wire                when_Utils_l697;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_mayOverflow;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l723_1;
  wire                when_Utils_l725_1;
  wire       [3:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [3:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;
  wire                _zz_io_outputs_1_w_valid;
  wire                _zz_io_outputs_2_w_valid;
  wire                _zz_io_outputs_3_w_valid;
  wire                _zz_writeRspIndex;
  wire                _zz_writeRspIndex_1;
  wire       [1:0]    writeRspIndex;

  assign _zz_decodedCmdSels = 32'h000fffff;
  assign _zz_decodedCmdSels_1 = (~ 32'h000fffff);
  assign _zz_decodedCmdSels_2 = (io_input_aw_payload_addr & (~ 32'h000fffff));
  assign _zz_decodedCmdSels_3 = 32'h1f000000;
  assign _zz_decodedCmdSels_4 = (io_input_aw_payload_addr & (~ 32'h007fffff));
  assign _zz_decodedCmdSels_5 = 32'h1c000000;
  Axi4WriteOnlyErrorSlave errorSlave (
    .io_axi_aw_valid         (errorSlave_io_axi_aw_valid           ), //i
    .io_axi_aw_ready         (errorSlave_io_axi_aw_ready           ), //o
    .io_axi_aw_payload_addr  (io_input_aw_payload_addr[31:0]       ), //i
    .io_axi_aw_payload_id    (io_input_aw_payload_id[3:0]          ), //i
    .io_axi_aw_payload_len   (io_input_aw_payload_len[7:0]         ), //i
    .io_axi_aw_payload_size  (io_input_aw_payload_size[2:0]        ), //i
    .io_axi_aw_payload_burst (io_input_aw_payload_burst[1:0]       ), //i
    .io_axi_aw_payload_lock  (io_input_aw_payload_lock             ), //i
    .io_axi_aw_payload_cache (io_input_aw_payload_cache[3:0]       ), //i
    .io_axi_aw_payload_prot  (io_input_aw_payload_prot[2:0]        ), //i
    .io_axi_w_valid          (errorSlave_io_axi_w_valid            ), //i
    .io_axi_w_ready          (errorSlave_io_axi_w_ready            ), //o
    .io_axi_w_payload_data   (io_input_w_payload_data[31:0]        ), //i
    .io_axi_w_payload_strb   (io_input_w_payload_strb[3:0]         ), //i
    .io_axi_w_payload_last   (io_input_w_payload_last              ), //i
    .io_axi_b_valid          (errorSlave_io_axi_b_valid            ), //o
    .io_axi_b_ready          (io_input_b_ready                     ), //i
    .io_axi_b_payload_id     (errorSlave_io_axi_b_payload_id[3:0]  ), //o
    .io_axi_b_payload_resp   (errorSlave_io_axi_b_payload_resp[1:0]), //o
    .clk                     (clk                                  ), //i
    .resetn                  (resetn                               )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      2'b00 : begin
        _zz_io_input_b_payload_id = io_outputs_0_b_payload_id;
        _zz_io_input_b_payload_resp = io_outputs_0_b_payload_resp;
      end
      2'b01 : begin
        _zz_io_input_b_payload_id = io_outputs_1_b_payload_id;
        _zz_io_input_b_payload_resp = io_outputs_1_b_payload_resp;
      end
      2'b10 : begin
        _zz_io_input_b_payload_id = io_outputs_2_b_payload_id;
        _zz_io_input_b_payload_resp = io_outputs_2_b_payload_resp;
      end
      default : begin
        _zz_io_input_b_payload_id = io_outputs_3_b_payload_id;
        _zz_io_input_b_payload_resp = io_outputs_3_b_payload_resp;
      end
    endcase
  end

  assign io_input_aw_fire = (io_input_aw_valid && io_input_aw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_aw_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(io_input_b_fire) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l723 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l697 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(cmdAllowedStart) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l697) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_mayOverflow = (pendingDataCounter_value == 3'b111);
  assign pendingDataCounter_willOverflowIfInc = (pendingDataCounter_mayOverflow && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign when_Utils_l723_1 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723_1) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725_1) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725_1 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {(((io_input_aw_payload_addr & (~ _zz_decodedCmdSels)) == 32'h1f200000) && io_input_aw_valid),{(((io_input_aw_payload_addr & _zz_decodedCmdSels_1) == 32'h1f100000) && io_input_aw_valid),{((_zz_decodedCmdSels_2 == _zz_decodedCmdSels_3) && io_input_aw_valid),((_zz_decodedCmdSels_4 == _zz_decodedCmdSels_5) && io_input_aw_valid)}}};
  assign decodedCmdError = (decodedCmdSels == 4'b0000);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_aw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_aw_ready = (((|(decodedCmdSels & {io_outputs_3_aw_ready,{io_outputs_2_aw_ready,{io_outputs_1_aw_ready,io_outputs_0_aw_ready}}})) || (decodedCmdError && errorSlave_io_axi_aw_ready)) && allowCmd);
  assign errorSlave_io_axi_aw_valid = ((io_input_aw_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_aw_valid = ((io_input_aw_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_aw_payload_addr = io_input_aw_payload_addr;
  assign io_outputs_0_aw_payload_id = io_input_aw_payload_id;
  assign io_outputs_0_aw_payload_len = io_input_aw_payload_len;
  assign io_outputs_0_aw_payload_size = io_input_aw_payload_size;
  assign io_outputs_0_aw_payload_burst = io_input_aw_payload_burst;
  assign io_outputs_0_aw_payload_lock = io_input_aw_payload_lock;
  assign io_outputs_0_aw_payload_cache = io_input_aw_payload_cache;
  assign io_outputs_0_aw_payload_prot = io_input_aw_payload_prot;
  assign io_outputs_1_aw_valid = ((io_input_aw_valid && decodedCmdSels[1]) && allowCmd);
  assign io_outputs_1_aw_payload_addr = io_input_aw_payload_addr;
  assign io_outputs_1_aw_payload_id = io_input_aw_payload_id;
  assign io_outputs_1_aw_payload_len = io_input_aw_payload_len;
  assign io_outputs_1_aw_payload_size = io_input_aw_payload_size;
  assign io_outputs_1_aw_payload_burst = io_input_aw_payload_burst;
  assign io_outputs_1_aw_payload_lock = io_input_aw_payload_lock;
  assign io_outputs_1_aw_payload_cache = io_input_aw_payload_cache;
  assign io_outputs_1_aw_payload_prot = io_input_aw_payload_prot;
  assign io_outputs_2_aw_valid = ((io_input_aw_valid && decodedCmdSels[2]) && allowCmd);
  assign io_outputs_2_aw_payload_addr = io_input_aw_payload_addr;
  assign io_outputs_2_aw_payload_id = io_input_aw_payload_id;
  assign io_outputs_2_aw_payload_len = io_input_aw_payload_len;
  assign io_outputs_2_aw_payload_size = io_input_aw_payload_size;
  assign io_outputs_2_aw_payload_burst = io_input_aw_payload_burst;
  assign io_outputs_2_aw_payload_lock = io_input_aw_payload_lock;
  assign io_outputs_2_aw_payload_cache = io_input_aw_payload_cache;
  assign io_outputs_2_aw_payload_prot = io_input_aw_payload_prot;
  assign io_outputs_3_aw_valid = ((io_input_aw_valid && decodedCmdSels[3]) && allowCmd);
  assign io_outputs_3_aw_payload_addr = io_input_aw_payload_addr;
  assign io_outputs_3_aw_payload_id = io_input_aw_payload_id;
  assign io_outputs_3_aw_payload_len = io_input_aw_payload_len;
  assign io_outputs_3_aw_payload_size = io_input_aw_payload_size;
  assign io_outputs_3_aw_payload_burst = io_input_aw_payload_burst;
  assign io_outputs_3_aw_payload_lock = io_input_aw_payload_lock;
  assign io_outputs_3_aw_payload_cache = io_input_aw_payload_cache;
  assign io_outputs_3_aw_payload_prot = io_input_aw_payload_prot;
  assign io_input_w_ready = (((|(pendingSels & {io_outputs_3_w_ready,{io_outputs_2_w_ready,{io_outputs_1_w_ready,io_outputs_0_w_ready}}})) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_io_outputs_1_w_valid = pendingSels[1];
  assign _zz_io_outputs_2_w_valid = pendingSels[2];
  assign _zz_io_outputs_3_w_valid = pendingSels[3];
  assign io_outputs_0_w_valid = ((io_input_w_valid && pendingSels[0]) && allowData);
  assign io_outputs_0_w_payload_data = io_input_w_payload_data;
  assign io_outputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_outputs_0_w_payload_last = io_input_w_payload_last;
  assign io_outputs_1_w_valid = ((io_input_w_valid && _zz_io_outputs_1_w_valid) && allowData);
  assign io_outputs_1_w_payload_data = io_input_w_payload_data;
  assign io_outputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_outputs_1_w_payload_last = io_input_w_payload_last;
  assign io_outputs_2_w_valid = ((io_input_w_valid && _zz_io_outputs_2_w_valid) && allowData);
  assign io_outputs_2_w_payload_data = io_input_w_payload_data;
  assign io_outputs_2_w_payload_strb = io_input_w_payload_strb;
  assign io_outputs_2_w_payload_last = io_input_w_payload_last;
  assign io_outputs_3_w_valid = ((io_input_w_valid && _zz_io_outputs_3_w_valid) && allowData);
  assign io_outputs_3_w_payload_data = io_input_w_payload_data;
  assign io_outputs_3_w_payload_strb = io_input_w_payload_strb;
  assign io_outputs_3_w_payload_last = io_input_w_payload_last;
  assign _zz_writeRspIndex = (_zz_io_outputs_1_w_valid || _zz_io_outputs_3_w_valid);
  assign _zz_writeRspIndex_1 = (_zz_io_outputs_2_w_valid || _zz_io_outputs_3_w_valid);
  assign writeRspIndex = {_zz_writeRspIndex_1,_zz_writeRspIndex};
  assign io_input_b_valid = ((|{io_outputs_3_b_valid,{io_outputs_2_b_valid,{io_outputs_1_b_valid,io_outputs_0_b_valid}}}) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_id = _zz_io_input_b_payload_id;
    if(pendingError) begin
      io_input_b_payload_id = errorSlave_io_axi_b_payload_id;
    end
  end

  always @(*) begin
    io_input_b_payload_resp = _zz_io_input_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_outputs_0_b_ready = io_input_b_ready;
  assign io_outputs_1_b_ready = io_input_b_ready;
  assign io_outputs_2_b_ready = io_input_b_ready;
  assign io_outputs_3_b_ready = io_input_b_ready;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pendingCmdCounter_value <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 4'b0000;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_aw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input  wire          io_input_ar_valid,
  output wire          io_input_ar_ready,
  input  wire [31:0]   io_input_ar_payload_addr,
  input  wire [3:0]    io_input_ar_payload_id,
  input  wire [7:0]    io_input_ar_payload_len,
  input  wire [2:0]    io_input_ar_payload_size,
  input  wire [1:0]    io_input_ar_payload_burst,
  input  wire [0:0]    io_input_ar_payload_lock,
  input  wire [3:0]    io_input_ar_payload_cache,
  input  wire [2:0]    io_input_ar_payload_prot,
  output reg           io_input_r_valid,
  input  wire          io_input_r_ready,
  output wire [31:0]   io_input_r_payload_data,
  output reg  [3:0]    io_input_r_payload_id,
  output reg  [1:0]    io_input_r_payload_resp,
  output reg           io_input_r_payload_last,
  output wire          io_outputs_0_ar_valid,
  input  wire          io_outputs_0_ar_ready,
  output wire [31:0]   io_outputs_0_ar_payload_addr,
  output wire [3:0]    io_outputs_0_ar_payload_id,
  output wire [7:0]    io_outputs_0_ar_payload_len,
  output wire [2:0]    io_outputs_0_ar_payload_size,
  output wire [1:0]    io_outputs_0_ar_payload_burst,
  output wire [0:0]    io_outputs_0_ar_payload_lock,
  output wire [3:0]    io_outputs_0_ar_payload_cache,
  output wire [2:0]    io_outputs_0_ar_payload_prot,
  input  wire          io_outputs_0_r_valid,
  output wire          io_outputs_0_r_ready,
  input  wire [31:0]   io_outputs_0_r_payload_data,
  input  wire [3:0]    io_outputs_0_r_payload_id,
  input  wire [1:0]    io_outputs_0_r_payload_resp,
  input  wire          io_outputs_0_r_payload_last,
  output wire          io_outputs_1_ar_valid,
  input  wire          io_outputs_1_ar_ready,
  output wire [31:0]   io_outputs_1_ar_payload_addr,
  output wire [3:0]    io_outputs_1_ar_payload_id,
  output wire [7:0]    io_outputs_1_ar_payload_len,
  output wire [2:0]    io_outputs_1_ar_payload_size,
  output wire [1:0]    io_outputs_1_ar_payload_burst,
  output wire [0:0]    io_outputs_1_ar_payload_lock,
  output wire [3:0]    io_outputs_1_ar_payload_cache,
  output wire [2:0]    io_outputs_1_ar_payload_prot,
  input  wire          io_outputs_1_r_valid,
  output wire          io_outputs_1_r_ready,
  input  wire [31:0]   io_outputs_1_r_payload_data,
  input  wire [3:0]    io_outputs_1_r_payload_id,
  input  wire [1:0]    io_outputs_1_r_payload_resp,
  input  wire          io_outputs_1_r_payload_last,
  output wire          io_outputs_2_ar_valid,
  input  wire          io_outputs_2_ar_ready,
  output wire [31:0]   io_outputs_2_ar_payload_addr,
  output wire [3:0]    io_outputs_2_ar_payload_id,
  output wire [7:0]    io_outputs_2_ar_payload_len,
  output wire [2:0]    io_outputs_2_ar_payload_size,
  output wire [1:0]    io_outputs_2_ar_payload_burst,
  output wire [0:0]    io_outputs_2_ar_payload_lock,
  output wire [3:0]    io_outputs_2_ar_payload_cache,
  output wire [2:0]    io_outputs_2_ar_payload_prot,
  input  wire          io_outputs_2_r_valid,
  output wire          io_outputs_2_r_ready,
  input  wire [31:0]   io_outputs_2_r_payload_data,
  input  wire [3:0]    io_outputs_2_r_payload_id,
  input  wire [1:0]    io_outputs_2_r_payload_resp,
  input  wire          io_outputs_2_r_payload_last,
  output wire          io_outputs_3_ar_valid,
  input  wire          io_outputs_3_ar_ready,
  output wire [31:0]   io_outputs_3_ar_payload_addr,
  output wire [3:0]    io_outputs_3_ar_payload_id,
  output wire [7:0]    io_outputs_3_ar_payload_len,
  output wire [2:0]    io_outputs_3_ar_payload_size,
  output wire [1:0]    io_outputs_3_ar_payload_burst,
  output wire [0:0]    io_outputs_3_ar_payload_lock,
  output wire [3:0]    io_outputs_3_ar_payload_cache,
  output wire [2:0]    io_outputs_3_ar_payload_prot,
  input  wire          io_outputs_3_r_valid,
  output wire          io_outputs_3_r_ready,
  input  wire [31:0]   io_outputs_3_r_payload_data,
  input  wire [3:0]    io_outputs_3_r_payload_id,
  input  wire [1:0]    io_outputs_3_r_payload_resp,
  input  wire          io_outputs_3_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [3:0]    errorSlave_io_axi_r_payload_id;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire       [31:0]   _zz_decodedCmdSels;
  wire       [31:0]   _zz_decodedCmdSels_1;
  wire       [31:0]   _zz_decodedCmdSels_2;
  wire       [31:0]   _zz_decodedCmdSels_3;
  wire       [31:0]   _zz_decodedCmdSels_4;
  wire       [31:0]   _zz_decodedCmdSels_5;
  reg        [31:0]   _zz_io_input_r_payload_data;
  reg        [3:0]    _zz_io_input_r_payload_id;
  reg        [1:0]    _zz_io_input_r_payload_resp;
  reg                 _zz_io_input_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l697;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_mayOverflow;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l723;
  wire                when_Utils_l725;
  wire       [3:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [3:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                _zz_readRspIndex;
  wire                _zz_readRspIndex_1;
  wire                _zz_readRspIndex_2;
  wire       [1:0]    readRspIndex;

  assign _zz_decodedCmdSels = 32'h000fffff;
  assign _zz_decodedCmdSels_1 = (~ 32'h000fffff);
  assign _zz_decodedCmdSels_2 = (io_input_ar_payload_addr & (~ 32'h000fffff));
  assign _zz_decodedCmdSels_3 = 32'h1f000000;
  assign _zz_decodedCmdSels_4 = (io_input_ar_payload_addr & (~ 32'h007fffff));
  assign _zz_decodedCmdSels_5 = 32'h1c000000;
  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid         (errorSlave_io_axi_ar_valid            ), //i
    .io_axi_ar_ready         (errorSlave_io_axi_ar_ready            ), //o
    .io_axi_ar_payload_addr  (io_input_ar_payload_addr[31:0]        ), //i
    .io_axi_ar_payload_id    (io_input_ar_payload_id[3:0]           ), //i
    .io_axi_ar_payload_len   (io_input_ar_payload_len[7:0]          ), //i
    .io_axi_ar_payload_size  (io_input_ar_payload_size[2:0]         ), //i
    .io_axi_ar_payload_burst (io_input_ar_payload_burst[1:0]        ), //i
    .io_axi_ar_payload_lock  (io_input_ar_payload_lock              ), //i
    .io_axi_ar_payload_cache (io_input_ar_payload_cache[3:0]        ), //i
    .io_axi_ar_payload_prot  (io_input_ar_payload_prot[2:0]         ), //i
    .io_axi_r_valid          (errorSlave_io_axi_r_valid             ), //o
    .io_axi_r_ready          (io_input_r_ready                      ), //i
    .io_axi_r_payload_data   (errorSlave_io_axi_r_payload_data[31:0]), //o
    .io_axi_r_payload_id     (errorSlave_io_axi_r_payload_id[3:0]   ), //o
    .io_axi_r_payload_resp   (errorSlave_io_axi_r_payload_resp[1:0] ), //o
    .io_axi_r_payload_last   (errorSlave_io_axi_r_payload_last      ), //o
    .clk                     (clk                                   ), //i
    .resetn                  (resetn                                )  //i
  );
  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_io_input_r_payload_data = io_outputs_0_r_payload_data;
        _zz_io_input_r_payload_id = io_outputs_0_r_payload_id;
        _zz_io_input_r_payload_resp = io_outputs_0_r_payload_resp;
        _zz_io_input_r_payload_last = io_outputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_io_input_r_payload_data = io_outputs_1_r_payload_data;
        _zz_io_input_r_payload_id = io_outputs_1_r_payload_id;
        _zz_io_input_r_payload_resp = io_outputs_1_r_payload_resp;
        _zz_io_input_r_payload_last = io_outputs_1_r_payload_last;
      end
      2'b10 : begin
        _zz_io_input_r_payload_data = io_outputs_2_r_payload_data;
        _zz_io_input_r_payload_id = io_outputs_2_r_payload_id;
        _zz_io_input_r_payload_resp = io_outputs_2_r_payload_resp;
        _zz_io_input_r_payload_last = io_outputs_2_r_payload_last;
      end
      default : begin
        _zz_io_input_r_payload_data = io_outputs_3_r_payload_data;
        _zz_io_input_r_payload_id = io_outputs_3_r_payload_id;
        _zz_io_input_r_payload_resp = io_outputs_3_r_payload_resp;
        _zz_io_input_r_payload_last = io_outputs_3_r_payload_last;
      end
    endcase
  end

  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l697 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l697) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_mayOverflow = (pendingCmdCounter_value == 3'b111);
  assign pendingCmdCounter_willOverflowIfInc = (pendingCmdCounter_mayOverflow && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l723 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l723) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l725) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l725 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = {(((io_input_ar_payload_addr & (~ _zz_decodedCmdSels)) == 32'h1f200000) && io_input_ar_valid),{(((io_input_ar_payload_addr & _zz_decodedCmdSels_1) == 32'h1f100000) && io_input_ar_valid),{((_zz_decodedCmdSels_2 == _zz_decodedCmdSels_3) && io_input_ar_valid),((_zz_decodedCmdSels_4 == _zz_decodedCmdSels_5) && io_input_ar_valid)}}};
  assign decodedCmdError = (decodedCmdSels == 4'b0000);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = (((|(decodedCmdSels & {io_outputs_3_ar_ready,{io_outputs_2_ar_ready,{io_outputs_1_ar_ready,io_outputs_0_ar_ready}}})) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_id = io_input_ar_payload_id;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_0_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_0_ar_payload_lock = io_input_ar_payload_lock;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_1_ar_valid = ((io_input_ar_valid && decodedCmdSels[1]) && allowCmd);
  assign io_outputs_1_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_1_ar_payload_id = io_input_ar_payload_id;
  assign io_outputs_1_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_1_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_1_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_1_ar_payload_lock = io_input_ar_payload_lock;
  assign io_outputs_1_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_1_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_2_ar_valid = ((io_input_ar_valid && decodedCmdSels[2]) && allowCmd);
  assign io_outputs_2_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_2_ar_payload_id = io_input_ar_payload_id;
  assign io_outputs_2_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_2_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_2_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_2_ar_payload_lock = io_input_ar_payload_lock;
  assign io_outputs_2_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_2_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_3_ar_valid = ((io_input_ar_valid && decodedCmdSels[3]) && allowCmd);
  assign io_outputs_3_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_3_ar_payload_id = io_input_ar_payload_id;
  assign io_outputs_3_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_3_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_3_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_3_ar_payload_lock = io_input_ar_payload_lock;
  assign io_outputs_3_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_3_ar_payload_prot = io_input_ar_payload_prot;
  assign _zz_readRspIndex = pendingSels[3];
  assign _zz_readRspIndex_1 = (pendingSels[1] || _zz_readRspIndex);
  assign _zz_readRspIndex_2 = (pendingSels[2] || _zz_readRspIndex);
  assign readRspIndex = {_zz_readRspIndex_2,_zz_readRspIndex_1};
  always @(*) begin
    io_input_r_valid = (|{io_outputs_3_r_valid,{io_outputs_2_r_valid,{io_outputs_1_r_valid,io_outputs_0_r_valid}}});
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = _zz_io_input_r_payload_data;
  always @(*) begin
    io_input_r_payload_id = _zz_io_input_r_payload_id;
    if(pendingError) begin
      io_input_r_payload_id = errorSlave_io_axi_r_payload_id;
    end
  end

  always @(*) begin
    io_input_r_payload_resp = _zz_io_input_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = _zz_io_input_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  assign io_outputs_1_r_ready = io_input_r_ready;
  assign io_outputs_2_r_ready = io_input_r_ready;
  assign io_outputs_3_r_ready = io_input_r_ready;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 4'b0000;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Axi4WriteOnlyErrorSlave (
  input  wire          io_axi_aw_valid,
  output wire          io_axi_aw_ready,
  input  wire [31:0]   io_axi_aw_payload_addr,
  input  wire [3:0]    io_axi_aw_payload_id,
  input  wire [7:0]    io_axi_aw_payload_len,
  input  wire [2:0]    io_axi_aw_payload_size,
  input  wire [1:0]    io_axi_aw_payload_burst,
  input  wire [0:0]    io_axi_aw_payload_lock,
  input  wire [3:0]    io_axi_aw_payload_cache,
  input  wire [2:0]    io_axi_aw_payload_prot,
  input  wire          io_axi_w_valid,
  output wire          io_axi_w_ready,
  input  wire [31:0]   io_axi_w_payload_data,
  input  wire [3:0]    io_axi_w_payload_strb,
  input  wire          io_axi_w_payload_last,
  output wire          io_axi_b_valid,
  input  wire          io_axi_b_ready,
  output wire [3:0]    io_axi_b_payload_id,
  output wire [1:0]    io_axi_b_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  reg                 consumeData;
  reg                 sendRsp;
  reg        [3:0]    id;
  wire                io_axi_aw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l24;
  wire                io_axi_b_fire;

  assign io_axi_aw_ready = (! (consumeData || sendRsp));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l24 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_payload_id = id;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      consumeData <= 1'b0;
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_aw_fire) begin
        consumeData <= 1'b1;
      end
      if(when_Axi4ErrorSlave_l24) begin
        consumeData <= 1'b0;
        sendRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendRsp <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_aw_fire) begin
      id <= io_axi_aw_payload_id;
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input  wire          io_axi_ar_valid,
  output wire          io_axi_ar_ready,
  input  wire [31:0]   io_axi_ar_payload_addr,
  input  wire [3:0]    io_axi_ar_payload_id,
  input  wire [7:0]    io_axi_ar_payload_len,
  input  wire [2:0]    io_axi_ar_payload_size,
  input  wire [1:0]    io_axi_ar_payload_burst,
  input  wire [0:0]    io_axi_ar_payload_lock,
  input  wire [3:0]    io_axi_ar_payload_cache,
  input  wire [2:0]    io_axi_ar_payload_prot,
  output wire          io_axi_r_valid,
  input  wire          io_axi_r_ready,
  output wire [31:0]   io_axi_r_payload_data,
  output wire [3:0]    io_axi_r_payload_id,
  output wire [1:0]    io_axi_r_payload_resp,
  output wire          io_axi_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  reg                 sendRsp;
  reg        [3:0]    id;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h00);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_id = id;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_ar_fire) begin
      remaining <= io_axi_ar_payload_len;
      id <= io_axi_ar_payload_id;
    end
    if(sendRsp) begin
      if(io_axi_r_ready) begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule
