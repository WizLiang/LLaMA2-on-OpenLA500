// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : AxiCrossbar_2x4
// Git hash  : 42c9c36672d40a4e5e9260687ca659a8ed82a712

`timescale 1ns/1ps

module AxiCrossbar_2x4 (
  input  wire          axiIn0_aw_valid,
  output wire          axiIn0_aw_ready,
  input  wire [31:0]   axiIn0_aw_payload_addr,
  input  wire [3:0]    axiIn0_aw_payload_id,
  input  wire [7:0]    axiIn0_aw_payload_len,
  input  wire [2:0]    axiIn0_aw_payload_size,
  input  wire [1:0]    axiIn0_aw_payload_burst,
  input  wire [0:0]    axiIn0_aw_payload_lock,
  input  wire [3:0]    axiIn0_aw_payload_cache,
  input  wire [2:0]    axiIn0_aw_payload_prot,

  input  wire          axiIn0_w_valid,
  output wire          axiIn0_w_ready,
  input  wire [31:0]   axiIn0_w_payload_data,
  input  wire [3:0]    axiIn0_w_payload_strb,
  input  wire          axiIn0_w_payload_last,

  output wire          axiIn0_b_valid,
  input  wire          axiIn0_b_ready,
  output wire [3:0]    axiIn0_b_payload_id,
  output wire [1:0]    axiIn0_b_payload_resp,

  input  wire          axiIn0_ar_valid,
  output wire          axiIn0_ar_ready,
  input  wire [31:0]   axiIn0_ar_payload_addr,
  input  wire [3:0]    axiIn0_ar_payload_id,
  input  wire [7:0]    axiIn0_ar_payload_len,
  input  wire [2:0]    axiIn0_ar_payload_size,
  input  wire [1:0]    axiIn0_ar_payload_burst,
  input  wire [0:0]    axiIn0_ar_payload_lock,
  input  wire [3:0]    axiIn0_ar_payload_cache,
  input  wire [2:0]    axiIn0_ar_payload_prot,

  output wire          axiIn0_r_valid,
  input  wire          axiIn0_r_ready,
  output wire [31:0]   axiIn0_r_payload_data,
  output wire [3:0]    axiIn0_r_payload_id,
  output wire [1:0]    axiIn0_r_payload_resp,
  output wire          axiIn0_r_payload_last,

  input  wire          axiIn1_aw_valid,
  output wire          axiIn1_aw_ready,
  input  wire [31:0]   axiIn1_aw_payload_addr,
  input  wire [3:0]    axiIn1_aw_payload_id,
  input  wire [7:0]    axiIn1_aw_payload_len,
  input  wire [2:0]    axiIn1_aw_payload_size,
  input  wire [1:0]    axiIn1_aw_payload_burst,
  input  wire [0:0]    axiIn1_aw_payload_lock,
  input  wire [3:0]    axiIn1_aw_payload_cache,
  input  wire [2:0]    axiIn1_aw_payload_prot,
  input  wire          axiIn1_w_valid,
  output wire          axiIn1_w_ready,
  input  wire [31:0]   axiIn1_w_payload_data,
  input  wire [3:0]    axiIn1_w_payload_strb,
  input  wire          axiIn1_w_payload_last,
  output wire          axiIn1_b_valid,
  input  wire          axiIn1_b_ready,
  output wire [3:0]    axiIn1_b_payload_id,
  output wire [1:0]    axiIn1_b_payload_resp,
  input  wire          axiIn1_ar_valid,
  output wire          axiIn1_ar_ready,
  input  wire [31:0]   axiIn1_ar_payload_addr,
  input  wire [3:0]    axiIn1_ar_payload_id,
  input  wire [7:0]    axiIn1_ar_payload_len,
  input  wire [2:0]    axiIn1_ar_payload_size,
  input  wire [1:0]    axiIn1_ar_payload_burst,
  input  wire [0:0]    axiIn1_ar_payload_lock,
  input  wire [3:0]    axiIn1_ar_payload_cache,
  input  wire [2:0]    axiIn1_ar_payload_prot,
  
  output wire          axiIn1_r_valid,
  input  wire          axiIn1_r_ready,
  output wire [31:0]   axiIn1_r_payload_data,
  output wire [3:0]    axiIn1_r_payload_id,
  output wire [1:0]    axiIn1_r_payload_resp,
  output wire          axiIn1_r_payload_last,

  output wire          axiOut_0_aw_valid,
  input  wire          axiOut_0_aw_ready,
  output wire [31:0]   axiOut_0_aw_payload_addr,
  output wire [4:0]    axiOut_0_aw_payload_id,
  output wire [7:0]    axiOut_0_aw_payload_len,
  output wire [2:0]    axiOut_0_aw_payload_size,
  output wire [1:0]    axiOut_0_aw_payload_burst,
  output wire [0:0]    axiOut_0_aw_payload_lock,
  output wire [3:0]    axiOut_0_aw_payload_cache,
  output wire [2:0]    axiOut_0_aw_payload_prot,
  output wire          axiOut_0_w_valid,
  input  wire          axiOut_0_w_ready,
  output wire [31:0]   axiOut_0_w_payload_data,
  output wire [3:0]    axiOut_0_w_payload_strb,
  output wire          axiOut_0_w_payload_last,
  input  wire          axiOut_0_b_valid,
  output wire          axiOut_0_b_ready,
  input  wire [4:0]    axiOut_0_b_payload_id,
  input  wire [1:0]    axiOut_0_b_payload_resp,
  output wire          axiOut_0_ar_valid,
  input  wire          axiOut_0_ar_ready,
  output wire [31:0]   axiOut_0_ar_payload_addr,
  output wire [4:0]    axiOut_0_ar_payload_id,
  output wire [7:0]    axiOut_0_ar_payload_len,
  output wire [2:0]    axiOut_0_ar_payload_size,
  output wire [1:0]    axiOut_0_ar_payload_burst,
  output wire [0:0]    axiOut_0_ar_payload_lock,
  output wire [3:0]    axiOut_0_ar_payload_cache,
  output wire [2:0]    axiOut_0_ar_payload_prot,
  input  wire          axiOut_0_r_valid,
  output wire          axiOut_0_r_ready,
  input  wire [31:0]   axiOut_0_r_payload_data,
  input  wire [4:0]    axiOut_0_r_payload_id,
  input  wire [1:0]    axiOut_0_r_payload_resp,
  input  wire          axiOut_0_r_payload_last,
  output wire          axiOut_1_aw_valid,
  input  wire          axiOut_1_aw_ready,
  output wire [31:0]   axiOut_1_aw_payload_addr,
  output wire [4:0]    axiOut_1_aw_payload_id,
  output wire [7:0]    axiOut_1_aw_payload_len,
  output wire [2:0]    axiOut_1_aw_payload_size,
  output wire [1:0]    axiOut_1_aw_payload_burst,
  output wire [0:0]    axiOut_1_aw_payload_lock,
  output wire [3:0]    axiOut_1_aw_payload_cache,
  output wire [2:0]    axiOut_1_aw_payload_prot,
  output wire          axiOut_1_w_valid,
  input  wire          axiOut_1_w_ready,
  output wire [31:0]   axiOut_1_w_payload_data,
  output wire [3:0]    axiOut_1_w_payload_strb,
  output wire          axiOut_1_w_payload_last,
  input  wire          axiOut_1_b_valid,
  output wire          axiOut_1_b_ready,
  input  wire [4:0]    axiOut_1_b_payload_id,
  input  wire [1:0]    axiOut_1_b_payload_resp,
  output wire          axiOut_1_ar_valid,
  input  wire          axiOut_1_ar_ready,
  output wire [31:0]   axiOut_1_ar_payload_addr,
  output wire [4:0]    axiOut_1_ar_payload_id,
  output wire [7:0]    axiOut_1_ar_payload_len,
  output wire [2:0]    axiOut_1_ar_payload_size,
  output wire [1:0]    axiOut_1_ar_payload_burst,
  output wire [0:0]    axiOut_1_ar_payload_lock,
  output wire [3:0]    axiOut_1_ar_payload_cache,
  output wire [2:0]    axiOut_1_ar_payload_prot,
  input  wire          axiOut_1_r_valid,
  output wire          axiOut_1_r_ready,
  input  wire [31:0]   axiOut_1_r_payload_data,
  input  wire [4:0]    axiOut_1_r_payload_id,
  input  wire [1:0]    axiOut_1_r_payload_resp,
  input  wire          axiOut_1_r_payload_last,
  output wire          axiOut_2_aw_valid,
  input  wire          axiOut_2_aw_ready,
  output wire [31:0]   axiOut_2_aw_payload_addr,
  output wire [4:0]    axiOut_2_aw_payload_id,
  output wire [7:0]    axiOut_2_aw_payload_len,
  output wire [2:0]    axiOut_2_aw_payload_size,
  output wire [1:0]    axiOut_2_aw_payload_burst,
  output wire [0:0]    axiOut_2_aw_payload_lock,
  output wire [3:0]    axiOut_2_aw_payload_cache,
  output wire [2:0]    axiOut_2_aw_payload_prot,
  output wire          axiOut_2_w_valid,
  input  wire          axiOut_2_w_ready,
  output wire [31:0]   axiOut_2_w_payload_data,
  output wire [3:0]    axiOut_2_w_payload_strb,
  output wire          axiOut_2_w_payload_last,
  input  wire          axiOut_2_b_valid,
  output wire          axiOut_2_b_ready,
  input  wire [4:0]    axiOut_2_b_payload_id,
  input  wire [1:0]    axiOut_2_b_payload_resp,
  output wire          axiOut_2_ar_valid,
  input  wire          axiOut_2_ar_ready,
  output wire [31:0]   axiOut_2_ar_payload_addr,
  output wire [4:0]    axiOut_2_ar_payload_id,
  output wire [7:0]    axiOut_2_ar_payload_len,
  output wire [2:0]    axiOut_2_ar_payload_size,
  output wire [1:0]    axiOut_2_ar_payload_burst,
  output wire [0:0]    axiOut_2_ar_payload_lock,
  output wire [3:0]    axiOut_2_ar_payload_cache,
  output wire [2:0]    axiOut_2_ar_payload_prot,
  input  wire          axiOut_2_r_valid,
  output wire          axiOut_2_r_ready,
  input  wire [31:0]   axiOut_2_r_payload_data,
  input  wire [4:0]    axiOut_2_r_payload_id,
  input  wire [1:0]    axiOut_2_r_payload_resp,
  input  wire          axiOut_2_r_payload_last,
  output wire          axiOut_3_aw_valid,
  input  wire          axiOut_3_aw_ready,
  output wire [31:0]   axiOut_3_aw_payload_addr,
  output wire [4:0]    axiOut_3_aw_payload_id,
  output wire [7:0]    axiOut_3_aw_payload_len,
  output wire [2:0]    axiOut_3_aw_payload_size,
  output wire [1:0]    axiOut_3_aw_payload_burst,
  output wire [0:0]    axiOut_3_aw_payload_lock,
  output wire [3:0]    axiOut_3_aw_payload_cache,
  output wire [2:0]    axiOut_3_aw_payload_prot,
  output wire          axiOut_3_w_valid,
  input  wire          axiOut_3_w_ready,
  output wire [31:0]   axiOut_3_w_payload_data,
  output wire [3:0]    axiOut_3_w_payload_strb,
  output wire          axiOut_3_w_payload_last,
  input  wire          axiOut_3_b_valid,
  output wire          axiOut_3_b_ready,
  input  wire [4:0]    axiOut_3_b_payload_id,
  input  wire [1:0]    axiOut_3_b_payload_resp,
  output wire          axiOut_3_ar_valid,
  input  wire          axiOut_3_ar_ready,
  output wire [31:0]   axiOut_3_ar_payload_addr,
  output wire [4:0]    axiOut_3_ar_payload_id,
  output wire [7:0]    axiOut_3_ar_payload_len,
  output wire [2:0]    axiOut_3_ar_payload_size,
  output wire [1:0]    axiOut_3_ar_payload_burst,
  output wire [0:0]    axiOut_3_ar_payload_lock,
  output wire [3:0]    axiOut_3_ar_payload_cache,
  output wire [2:0]    axiOut_3_ar_payload_prot,
  input  wire          axiOut_3_r_valid,
  output wire          axiOut_3_r_ready,
  input  wire [31:0]   axiOut_3_r_payload_data,
  input  wire [4:0]    axiOut_3_r_payload_id,
  input  wire [1:0]    axiOut_3_r_payload_resp,
  input  wire          axiOut_3_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  wire                axiIn0_readOnly_decoder_io_input_ar_ready;
  wire                axiIn0_readOnly_decoder_io_input_r_valid;
  wire       [31:0]   axiIn0_readOnly_decoder_io_input_r_payload_data;
  wire       [3:0]    axiIn0_readOnly_decoder_io_input_r_payload_id;
  wire       [1:0]    axiIn0_readOnly_decoder_io_input_r_payload_resp;
  wire                axiIn0_readOnly_decoder_io_input_r_payload_last;
  wire                axiIn0_readOnly_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   axiIn0_readOnly_decoder_io_outputs_0_ar_payload_addr;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_id;
  wire       [7:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_size;
  wire       [1:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_burst;
  wire       [0:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_lock;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_0_ar_payload_prot;
  wire                axiIn0_readOnly_decoder_io_outputs_0_r_ready;
  wire                axiIn0_readOnly_decoder_io_outputs_1_ar_valid;
  wire       [31:0]   axiIn0_readOnly_decoder_io_outputs_1_ar_payload_addr;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_id;
  wire       [7:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_len;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_size;
  wire       [1:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_burst;
  wire       [0:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_lock;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_cache;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_1_ar_payload_prot;
  wire                axiIn0_readOnly_decoder_io_outputs_1_r_ready;
  wire                axiIn0_readOnly_decoder_io_outputs_2_ar_valid;
  wire       [31:0]   axiIn0_readOnly_decoder_io_outputs_2_ar_payload_addr;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_id;
  wire       [7:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_len;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_size;
  wire       [1:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_burst;
  wire       [0:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_lock;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_cache;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_2_ar_payload_prot;
  wire                axiIn0_readOnly_decoder_io_outputs_2_r_ready;
  wire                axiIn0_readOnly_decoder_io_outputs_3_ar_valid;
  wire       [31:0]   axiIn0_readOnly_decoder_io_outputs_3_ar_payload_addr;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_id;
  wire       [7:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_len;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_size;
  wire       [1:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_burst;
  wire       [0:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_lock;
  wire       [3:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_cache;
  wire       [2:0]    axiIn0_readOnly_decoder_io_outputs_3_ar_payload_prot;
  wire                axiIn0_readOnly_decoder_io_outputs_3_r_ready;
  wire                axiIn0_writeOnly_decoder_io_input_aw_ready;
  wire                axiIn0_writeOnly_decoder_io_input_w_ready;
  wire                axiIn0_writeOnly_decoder_io_input_b_valid;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_input_b_payload_id;
  wire       [1:0]    axiIn0_writeOnly_decoder_io_input_b_payload_resp;
  wire                axiIn0_writeOnly_decoder_io_outputs_0_aw_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_id;
  wire       [7:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_len;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_size;
  wire       [1:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  wire       [0:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  wire                axiIn0_writeOnly_decoder_io_outputs_0_w_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_0_w_payload_data;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_0_w_payload_strb;
  wire                axiIn0_writeOnly_decoder_io_outputs_0_w_payload_last;
  wire                axiIn0_writeOnly_decoder_io_outputs_0_b_ready;
  wire                axiIn0_writeOnly_decoder_io_outputs_1_aw_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_addr;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_id;
  wire       [7:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_len;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_size;
  wire       [1:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_burst;
  wire       [0:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_lock;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_cache;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_prot;
  wire                axiIn0_writeOnly_decoder_io_outputs_1_w_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_1_w_payload_data;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_1_w_payload_strb;
  wire                axiIn0_writeOnly_decoder_io_outputs_1_w_payload_last;
  wire                axiIn0_writeOnly_decoder_io_outputs_1_b_ready;
  wire                axiIn0_writeOnly_decoder_io_outputs_2_aw_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_addr;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_id;
  wire       [7:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_len;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_size;
  wire       [1:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_burst;
  wire       [0:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_lock;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_cache;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_prot;
  wire                axiIn0_writeOnly_decoder_io_outputs_2_w_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_2_w_payload_data;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_2_w_payload_strb;
  wire                axiIn0_writeOnly_decoder_io_outputs_2_w_payload_last;
  wire                axiIn0_writeOnly_decoder_io_outputs_2_b_ready;
  wire                axiIn0_writeOnly_decoder_io_outputs_3_aw_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_addr;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_id;
  wire       [7:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_len;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_size;
  wire       [1:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_burst;
  wire       [0:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_lock;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_cache;
  wire       [2:0]    axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_prot;
  wire                axiIn0_writeOnly_decoder_io_outputs_3_w_valid;
  wire       [31:0]   axiIn0_writeOnly_decoder_io_outputs_3_w_payload_data;
  wire       [3:0]    axiIn0_writeOnly_decoder_io_outputs_3_w_payload_strb;
  wire                axiIn0_writeOnly_decoder_io_outputs_3_w_payload_last;
  wire                axiIn0_writeOnly_decoder_io_outputs_3_b_ready;
  wire                axiIn1_readOnly_decoder_io_input_ar_ready;
  wire                axiIn1_readOnly_decoder_io_input_r_valid;
  wire       [31:0]   axiIn1_readOnly_decoder_io_input_r_payload_data;
  wire       [3:0]    axiIn1_readOnly_decoder_io_input_r_payload_id;
  wire       [1:0]    axiIn1_readOnly_decoder_io_input_r_payload_resp;
  wire                axiIn1_readOnly_decoder_io_input_r_payload_last;
  wire                axiIn1_readOnly_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   axiIn1_readOnly_decoder_io_outputs_0_ar_payload_addr;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_id;
  wire       [7:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_size;
  wire       [1:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_burst;
  wire       [0:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_lock;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_cache;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_0_ar_payload_prot;
  wire                axiIn1_readOnly_decoder_io_outputs_0_r_ready;
  wire                axiIn1_readOnly_decoder_io_outputs_1_ar_valid;
  wire       [31:0]   axiIn1_readOnly_decoder_io_outputs_1_ar_payload_addr;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_id;
  wire       [7:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_len;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_size;
  wire       [1:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_burst;
  wire       [0:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_lock;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_cache;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_1_ar_payload_prot;
  wire                axiIn1_readOnly_decoder_io_outputs_1_r_ready;
  wire                axiIn1_readOnly_decoder_io_outputs_2_ar_valid;
  wire       [31:0]   axiIn1_readOnly_decoder_io_outputs_2_ar_payload_addr;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_id;
  wire       [7:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_len;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_size;
  wire       [1:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_burst;
  wire       [0:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_lock;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_cache;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_2_ar_payload_prot;
  wire                axiIn1_readOnly_decoder_io_outputs_2_r_ready;
  wire                axiIn1_readOnly_decoder_io_outputs_3_ar_valid;
  wire       [31:0]   axiIn1_readOnly_decoder_io_outputs_3_ar_payload_addr;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_id;
  wire       [7:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_len;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_size;
  wire       [1:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_burst;
  wire       [0:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_lock;
  wire       [3:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_cache;
  wire       [2:0]    axiIn1_readOnly_decoder_io_outputs_3_ar_payload_prot;
  wire                axiIn1_readOnly_decoder_io_outputs_3_r_ready;
  wire                axiIn1_writeOnly_decoder_io_input_aw_ready;
  wire                axiIn1_writeOnly_decoder_io_input_w_ready;
  wire                axiIn1_writeOnly_decoder_io_input_b_valid;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_input_b_payload_id;
  wire       [1:0]    axiIn1_writeOnly_decoder_io_input_b_payload_resp;
  wire                axiIn1_writeOnly_decoder_io_outputs_0_aw_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_id;
  wire       [7:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_len;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_size;
  wire       [1:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  wire       [0:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  wire                axiIn1_writeOnly_decoder_io_outputs_0_w_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_0_w_payload_data;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_0_w_payload_strb;
  wire                axiIn1_writeOnly_decoder_io_outputs_0_w_payload_last;
  wire                axiIn1_writeOnly_decoder_io_outputs_0_b_ready;
  wire                axiIn1_writeOnly_decoder_io_outputs_1_aw_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_addr;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_id;
  wire       [7:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_len;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_size;
  wire       [1:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_burst;
  wire       [0:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_lock;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_cache;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_prot;
  wire                axiIn1_writeOnly_decoder_io_outputs_1_w_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_1_w_payload_data;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_1_w_payload_strb;
  wire                axiIn1_writeOnly_decoder_io_outputs_1_w_payload_last;
  wire                axiIn1_writeOnly_decoder_io_outputs_1_b_ready;
  wire                axiIn1_writeOnly_decoder_io_outputs_2_aw_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_addr;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_id;
  wire       [7:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_len;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_size;
  wire       [1:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_burst;
  wire       [0:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_lock;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_cache;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_prot;
  wire                axiIn1_writeOnly_decoder_io_outputs_2_w_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_2_w_payload_data;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_2_w_payload_strb;
  wire                axiIn1_writeOnly_decoder_io_outputs_2_w_payload_last;
  wire                axiIn1_writeOnly_decoder_io_outputs_2_b_ready;
  wire                axiIn1_writeOnly_decoder_io_outputs_3_aw_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_addr;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_id;
  wire       [7:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_len;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_size;
  wire       [1:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_burst;
  wire       [0:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_lock;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_cache;
  wire       [2:0]    axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_prot;
  wire                axiIn1_writeOnly_decoder_io_outputs_3_w_valid;
  wire       [31:0]   axiIn1_writeOnly_decoder_io_outputs_3_w_payload_data;
  wire       [3:0]    axiIn1_writeOnly_decoder_io_outputs_3_w_payload_strb;
  wire                axiIn1_writeOnly_decoder_io_outputs_3_w_payload_last;
  wire                axiIn1_writeOnly_decoder_io_outputs_3_b_ready;
  wire                axi4ReadOnlyArbiter_4_io_inputs_0_ar_ready;
  wire                axi4ReadOnlyArbiter_4_io_inputs_0_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_resp;
  wire                axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_last;
  wire                axi4ReadOnlyArbiter_4_io_inputs_1_ar_ready;
  wire                axi4ReadOnlyArbiter_4_io_inputs_1_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_resp;
  wire                axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_last;
  wire                axi4ReadOnlyArbiter_4_io_output_ar_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_4_io_output_ar_payload_addr;
  wire       [4:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_id;
  wire       [7:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_len;
  wire       [2:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_size;
  wire       [1:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_burst;
  wire       [0:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_lock;
  wire       [3:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyArbiter_4_io_output_ar_payload_prot;
  wire                axi4ReadOnlyArbiter_4_io_output_r_ready;
  wire                axi4WriteOnlyArbiter_4_io_inputs_0_aw_ready;
  wire                axi4WriteOnlyArbiter_4_io_inputs_0_w_ready;
  wire                axi4WriteOnlyArbiter_4_io_inputs_0_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_4_io_inputs_0_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_4_io_inputs_0_b_payload_resp;
  wire                axi4WriteOnlyArbiter_4_io_inputs_1_aw_ready;
  wire                axi4WriteOnlyArbiter_4_io_inputs_1_w_ready;
  wire                axi4WriteOnlyArbiter_4_io_inputs_1_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_4_io_inputs_1_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_4_io_inputs_1_b_payload_resp;
  wire                axi4WriteOnlyArbiter_4_io_output_aw_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_4_io_output_aw_payload_addr;
  wire       [4:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_id;
  wire       [7:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_len;
  wire       [2:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_size;
  wire       [1:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_burst;
  wire       [0:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_lock;
  wire       [3:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_cache;
  wire       [2:0]    axi4WriteOnlyArbiter_4_io_output_aw_payload_prot;
  wire                axi4WriteOnlyArbiter_4_io_output_w_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_4_io_output_w_payload_data;
  wire       [3:0]    axi4WriteOnlyArbiter_4_io_output_w_payload_strb;
  wire                axi4WriteOnlyArbiter_4_io_output_w_payload_last;
  wire                axi4WriteOnlyArbiter_4_io_output_b_ready;
  wire                axi4ReadOnlyArbiter_5_io_inputs_0_ar_ready;
  wire                axi4ReadOnlyArbiter_5_io_inputs_0_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_resp;
  wire                axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_last;
  wire                axi4ReadOnlyArbiter_5_io_inputs_1_ar_ready;
  wire                axi4ReadOnlyArbiter_5_io_inputs_1_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_resp;
  wire                axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_last;
  wire                axi4ReadOnlyArbiter_5_io_output_ar_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_5_io_output_ar_payload_addr;
  wire       [4:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_id;
  wire       [7:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_len;
  wire       [2:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_size;
  wire       [1:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_burst;
  wire       [0:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_lock;
  wire       [3:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyArbiter_5_io_output_ar_payload_prot;
  wire                axi4ReadOnlyArbiter_5_io_output_r_ready;
  wire                axi4WriteOnlyArbiter_5_io_inputs_0_aw_ready;
  wire                axi4WriteOnlyArbiter_5_io_inputs_0_w_ready;
  wire                axi4WriteOnlyArbiter_5_io_inputs_0_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_5_io_inputs_0_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_5_io_inputs_0_b_payload_resp;
  wire                axi4WriteOnlyArbiter_5_io_inputs_1_aw_ready;
  wire                axi4WriteOnlyArbiter_5_io_inputs_1_w_ready;
  wire                axi4WriteOnlyArbiter_5_io_inputs_1_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_5_io_inputs_1_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_5_io_inputs_1_b_payload_resp;
  wire                axi4WriteOnlyArbiter_5_io_output_aw_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_5_io_output_aw_payload_addr;
  wire       [4:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_id;
  wire       [7:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_len;
  wire       [2:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_size;
  wire       [1:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_burst;
  wire       [0:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_lock;
  wire       [3:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_cache;
  wire       [2:0]    axi4WriteOnlyArbiter_5_io_output_aw_payload_prot;
  wire                axi4WriteOnlyArbiter_5_io_output_w_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_5_io_output_w_payload_data;
  wire       [3:0]    axi4WriteOnlyArbiter_5_io_output_w_payload_strb;
  wire                axi4WriteOnlyArbiter_5_io_output_w_payload_last;
  wire                axi4WriteOnlyArbiter_5_io_output_b_ready;
  wire                axi4ReadOnlyArbiter_6_io_inputs_0_ar_ready;
  wire                axi4ReadOnlyArbiter_6_io_inputs_0_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_resp;
  wire                axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_last;
  wire                axi4ReadOnlyArbiter_6_io_inputs_1_ar_ready;
  wire                axi4ReadOnlyArbiter_6_io_inputs_1_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_resp;
  wire                axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_last;
  wire                axi4ReadOnlyArbiter_6_io_output_ar_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_6_io_output_ar_payload_addr;
  wire       [4:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_id;
  wire       [7:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_len;
  wire       [2:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_size;
  wire       [1:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_burst;
  wire       [0:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_lock;
  wire       [3:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyArbiter_6_io_output_ar_payload_prot;
  wire                axi4ReadOnlyArbiter_6_io_output_r_ready;
  wire                axi4WriteOnlyArbiter_6_io_inputs_0_aw_ready;
  wire                axi4WriteOnlyArbiter_6_io_inputs_0_w_ready;
  wire                axi4WriteOnlyArbiter_6_io_inputs_0_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_6_io_inputs_0_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_6_io_inputs_0_b_payload_resp;
  wire                axi4WriteOnlyArbiter_6_io_inputs_1_aw_ready;
  wire                axi4WriteOnlyArbiter_6_io_inputs_1_w_ready;
  wire                axi4WriteOnlyArbiter_6_io_inputs_1_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_6_io_inputs_1_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_6_io_inputs_1_b_payload_resp;
  wire                axi4WriteOnlyArbiter_6_io_output_aw_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_6_io_output_aw_payload_addr;
  wire       [4:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_id;
  wire       [7:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_len;
  wire       [2:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_size;
  wire       [1:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_burst;
  wire       [0:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_lock;
  wire       [3:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_cache;
  wire       [2:0]    axi4WriteOnlyArbiter_6_io_output_aw_payload_prot;
  wire                axi4WriteOnlyArbiter_6_io_output_w_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_6_io_output_w_payload_data;
  wire       [3:0]    axi4WriteOnlyArbiter_6_io_output_w_payload_strb;
  wire                axi4WriteOnlyArbiter_6_io_output_w_payload_last;
  wire                axi4WriteOnlyArbiter_6_io_output_b_ready;
  wire                axi4ReadOnlyArbiter_7_io_inputs_0_ar_ready;
  wire                axi4ReadOnlyArbiter_7_io_inputs_0_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_resp;
  wire                axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_last;
  wire                axi4ReadOnlyArbiter_7_io_inputs_1_ar_ready;
  wire                axi4ReadOnlyArbiter_7_io_inputs_1_r_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_data;
  wire       [3:0]    axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_resp;
  wire                axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_last;
  wire                axi4ReadOnlyArbiter_7_io_output_ar_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_7_io_output_ar_payload_addr;
  wire       [4:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_id;
  wire       [7:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_len;
  wire       [2:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_size;
  wire       [1:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_burst;
  wire       [0:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_lock;
  wire       [3:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyArbiter_7_io_output_ar_payload_prot;
  wire                axi4ReadOnlyArbiter_7_io_output_r_ready;
  wire                axi4WriteOnlyArbiter_7_io_inputs_0_aw_ready;
  wire                axi4WriteOnlyArbiter_7_io_inputs_0_w_ready;
  wire                axi4WriteOnlyArbiter_7_io_inputs_0_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_7_io_inputs_0_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_7_io_inputs_0_b_payload_resp;
  wire                axi4WriteOnlyArbiter_7_io_inputs_1_aw_ready;
  wire                axi4WriteOnlyArbiter_7_io_inputs_1_w_ready;
  wire                axi4WriteOnlyArbiter_7_io_inputs_1_b_valid;
  wire       [3:0]    axi4WriteOnlyArbiter_7_io_inputs_1_b_payload_id;
  wire       [1:0]    axi4WriteOnlyArbiter_7_io_inputs_1_b_payload_resp;
  wire                axi4WriteOnlyArbiter_7_io_output_aw_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_7_io_output_aw_payload_addr;
  wire       [4:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_id;
  wire       [7:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_len;
  wire       [2:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_size;
  wire       [1:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_burst;
  wire       [0:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_lock;
  wire       [3:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_cache;
  wire       [2:0]    axi4WriteOnlyArbiter_7_io_output_aw_payload_prot;
  wire                axi4WriteOnlyArbiter_7_io_output_w_valid;
  wire       [31:0]   axi4WriteOnlyArbiter_7_io_output_w_payload_data;
  wire       [3:0]    axi4WriteOnlyArbiter_7_io_output_w_payload_strb;
  wire                axi4WriteOnlyArbiter_7_io_output_w_payload_last;
  wire                axi4WriteOnlyArbiter_7_io_output_b_ready;
  wire                axiIn0_readOnly_ar_valid;
  wire                axiIn0_readOnly_ar_ready;
  wire       [31:0]   axiIn0_readOnly_ar_payload_addr;
  wire       [3:0]    axiIn0_readOnly_ar_payload_id;
  wire       [7:0]    axiIn0_readOnly_ar_payload_len;
  wire       [2:0]    axiIn0_readOnly_ar_payload_size;
  wire       [1:0]    axiIn0_readOnly_ar_payload_burst;
  wire       [0:0]    axiIn0_readOnly_ar_payload_lock;
  wire       [3:0]    axiIn0_readOnly_ar_payload_cache;
  wire       [2:0]    axiIn0_readOnly_ar_payload_prot;
  wire                axiIn0_readOnly_r_valid;
  wire                axiIn0_readOnly_r_ready;
  wire       [31:0]   axiIn0_readOnly_r_payload_data;
  wire       [3:0]    axiIn0_readOnly_r_payload_id;
  wire       [1:0]    axiIn0_readOnly_r_payload_resp;
  wire                axiIn0_readOnly_r_payload_last;
  wire                axiIn0_writeOnly_aw_valid;
  wire                axiIn0_writeOnly_aw_ready;
  wire       [31:0]   axiIn0_writeOnly_aw_payload_addr;
  wire       [3:0]    axiIn0_writeOnly_aw_payload_id;
  wire       [7:0]    axiIn0_writeOnly_aw_payload_len;
  wire       [2:0]    axiIn0_writeOnly_aw_payload_size;
  wire       [1:0]    axiIn0_writeOnly_aw_payload_burst;
  wire       [0:0]    axiIn0_writeOnly_aw_payload_lock;
  wire       [3:0]    axiIn0_writeOnly_aw_payload_cache;
  wire       [2:0]    axiIn0_writeOnly_aw_payload_prot;
  wire                axiIn0_writeOnly_w_valid;
  wire                axiIn0_writeOnly_w_ready;
  wire       [31:0]   axiIn0_writeOnly_w_payload_data;
  wire       [3:0]    axiIn0_writeOnly_w_payload_strb;
  wire                axiIn0_writeOnly_w_payload_last;
  wire                axiIn0_writeOnly_b_valid;
  wire                axiIn0_writeOnly_b_ready;
  wire       [3:0]    axiIn0_writeOnly_b_payload_id;
  wire       [1:0]    axiIn0_writeOnly_b_payload_resp;
  wire                axiIn1_readOnly_ar_valid;
  wire                axiIn1_readOnly_ar_ready;
  wire       [31:0]   axiIn1_readOnly_ar_payload_addr;
  wire       [3:0]    axiIn1_readOnly_ar_payload_id;
  wire       [7:0]    axiIn1_readOnly_ar_payload_len;
  wire       [2:0]    axiIn1_readOnly_ar_payload_size;
  wire       [1:0]    axiIn1_readOnly_ar_payload_burst;
  wire       [0:0]    axiIn1_readOnly_ar_payload_lock;
  wire       [3:0]    axiIn1_readOnly_ar_payload_cache;
  wire       [2:0]    axiIn1_readOnly_ar_payload_prot;
  wire                axiIn1_readOnly_r_valid;
  wire                axiIn1_readOnly_r_ready;
  wire       [31:0]   axiIn1_readOnly_r_payload_data;
  wire       [3:0]    axiIn1_readOnly_r_payload_id;
  wire       [1:0]    axiIn1_readOnly_r_payload_resp;
  wire                axiIn1_readOnly_r_payload_last;
  wire                axiIn1_writeOnly_aw_valid;
  wire                axiIn1_writeOnly_aw_ready;
  wire       [31:0]   axiIn1_writeOnly_aw_payload_addr;
  wire       [3:0]    axiIn1_writeOnly_aw_payload_id;
  wire       [7:0]    axiIn1_writeOnly_aw_payload_len;
  wire       [2:0]    axiIn1_writeOnly_aw_payload_size;
  wire       [1:0]    axiIn1_writeOnly_aw_payload_burst;
  wire       [0:0]    axiIn1_writeOnly_aw_payload_lock;
  wire       [3:0]    axiIn1_writeOnly_aw_payload_cache;
  wire       [2:0]    axiIn1_writeOnly_aw_payload_prot;
  wire                axiIn1_writeOnly_w_valid;
  wire                axiIn1_writeOnly_w_ready;
  wire       [31:0]   axiIn1_writeOnly_w_payload_data;
  wire       [3:0]    axiIn1_writeOnly_w_payload_strb;
  wire                axiIn1_writeOnly_w_payload_last;
  wire                axiIn1_writeOnly_b_valid;
  wire                axiIn1_writeOnly_b_ready;
  wire       [3:0]    axiIn1_writeOnly_b_payload_id;
  wire       [1:0]    axiIn1_writeOnly_b_payload_resp;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_valid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_rValid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_fire;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_valid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_rValid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_fire;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_valid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_rValid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_fire;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_valid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_rValid;
  wire                toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_fire;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_rValid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_valid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_rValid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_fire;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_valid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_rValid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_fire;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_valid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_rValid;
  wire                toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_fire;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_valid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_rValid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_fire;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_valid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_rValid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_fire;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_valid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_rValid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_fire;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_valid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot;
  reg                 toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_rValid;
  wire                toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_fire;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_rValid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_valid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_rValid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_fire;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_valid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_rValid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_fire;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_valid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_ready;
  wire       [31:0]   toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id;
  wire       [7:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size;
  wire       [1:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst;
  wire       [0:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock;
  wire       [3:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache;
  wire       [2:0]    toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot;
  reg                 toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_rValid;
  wire                toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_fire;

  Axi4ReadOnlyDecoder axiIn0_readOnly_decoder (
    .io_input_ar_valid             (axiIn0_readOnly_ar_valid                                       ), //i
    .io_input_ar_ready             (axiIn0_readOnly_decoder_io_input_ar_ready                      ), //o
    .io_input_ar_payload_addr      (axiIn0_readOnly_ar_payload_addr[31:0]                          ), //i
    .io_input_ar_payload_id        (axiIn0_readOnly_ar_payload_id[3:0]                             ), //i
    .io_input_ar_payload_len       (axiIn0_readOnly_ar_payload_len[7:0]                            ), //i
    .io_input_ar_payload_size      (axiIn0_readOnly_ar_payload_size[2:0]                           ), //i
    .io_input_ar_payload_burst     (axiIn0_readOnly_ar_payload_burst[1:0]                          ), //i
    .io_input_ar_payload_lock      (axiIn0_readOnly_ar_payload_lock                                ), //i
    .io_input_ar_payload_cache     (axiIn0_readOnly_ar_payload_cache[3:0]                          ), //i
    .io_input_ar_payload_prot      (axiIn0_readOnly_ar_payload_prot[2:0]                           ), //i
    .io_input_r_valid              (axiIn0_readOnly_decoder_io_input_r_valid                       ), //o
    .io_input_r_ready              (axiIn0_readOnly_r_ready                                        ), //i
    .io_input_r_payload_data       (axiIn0_readOnly_decoder_io_input_r_payload_data[31:0]          ), //o
    .io_input_r_payload_id         (axiIn0_readOnly_decoder_io_input_r_payload_id[3:0]             ), //o
    .io_input_r_payload_resp       (axiIn0_readOnly_decoder_io_input_r_payload_resp[1:0]           ), //o
    .io_input_r_payload_last       (axiIn0_readOnly_decoder_io_input_r_payload_last                ), //o
    .io_outputs_0_ar_valid         (axiIn0_readOnly_decoder_io_outputs_0_ar_valid                  ), //o
    .io_outputs_0_ar_ready         (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_fire), //i
    .io_outputs_0_ar_payload_addr  (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_addr[31:0]     ), //o
    .io_outputs_0_ar_payload_id    (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_id[3:0]        ), //o
    .io_outputs_0_ar_payload_len   (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_len[7:0]       ), //o
    .io_outputs_0_ar_payload_size  (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_size[2:0]      ), //o
    .io_outputs_0_ar_payload_burst (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_burst[1:0]     ), //o
    .io_outputs_0_ar_payload_lock  (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_lock           ), //o
    .io_outputs_0_ar_payload_cache (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_cache[3:0]     ), //o
    .io_outputs_0_ar_payload_prot  (axiIn0_readOnly_decoder_io_outputs_0_ar_payload_prot[2:0]      ), //o
    .io_outputs_0_r_valid          (axi4ReadOnlyArbiter_4_io_inputs_0_r_valid                      ), //i
    .io_outputs_0_r_ready          (axiIn0_readOnly_decoder_io_outputs_0_r_ready                   ), //o
    .io_outputs_0_r_payload_data   (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_data[31:0]         ), //i
    .io_outputs_0_r_payload_id     (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_id[3:0]            ), //i
    .io_outputs_0_r_payload_resp   (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_resp[1:0]          ), //i
    .io_outputs_0_r_payload_last   (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_last               ), //i
    .io_outputs_1_ar_valid         (axiIn0_readOnly_decoder_io_outputs_1_ar_valid                  ), //o
    .io_outputs_1_ar_ready         (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_fire), //i
    .io_outputs_1_ar_payload_addr  (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_addr[31:0]     ), //o
    .io_outputs_1_ar_payload_id    (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_id[3:0]        ), //o
    .io_outputs_1_ar_payload_len   (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_len[7:0]       ), //o
    .io_outputs_1_ar_payload_size  (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_size[2:0]      ), //o
    .io_outputs_1_ar_payload_burst (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_burst[1:0]     ), //o
    .io_outputs_1_ar_payload_lock  (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_lock           ), //o
    .io_outputs_1_ar_payload_cache (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_cache[3:0]     ), //o
    .io_outputs_1_ar_payload_prot  (axiIn0_readOnly_decoder_io_outputs_1_ar_payload_prot[2:0]      ), //o
    .io_outputs_1_r_valid          (axi4ReadOnlyArbiter_5_io_inputs_0_r_valid                      ), //i
    .io_outputs_1_r_ready          (axiIn0_readOnly_decoder_io_outputs_1_r_ready                   ), //o
    .io_outputs_1_r_payload_data   (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_data[31:0]         ), //i
    .io_outputs_1_r_payload_id     (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_id[3:0]            ), //i
    .io_outputs_1_r_payload_resp   (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_resp[1:0]          ), //i
    .io_outputs_1_r_payload_last   (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_last               ), //i
    .io_outputs_2_ar_valid         (axiIn0_readOnly_decoder_io_outputs_2_ar_valid                  ), //o
    .io_outputs_2_ar_ready         (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_fire), //i
    .io_outputs_2_ar_payload_addr  (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_addr[31:0]     ), //o
    .io_outputs_2_ar_payload_id    (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_id[3:0]        ), //o
    .io_outputs_2_ar_payload_len   (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_len[7:0]       ), //o
    .io_outputs_2_ar_payload_size  (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_size[2:0]      ), //o
    .io_outputs_2_ar_payload_burst (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_burst[1:0]     ), //o
    .io_outputs_2_ar_payload_lock  (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_lock           ), //o
    .io_outputs_2_ar_payload_cache (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_cache[3:0]     ), //o
    .io_outputs_2_ar_payload_prot  (axiIn0_readOnly_decoder_io_outputs_2_ar_payload_prot[2:0]      ), //o
    .io_outputs_2_r_valid          (axi4ReadOnlyArbiter_6_io_inputs_0_r_valid                      ), //i
    .io_outputs_2_r_ready          (axiIn0_readOnly_decoder_io_outputs_2_r_ready                   ), //o
    .io_outputs_2_r_payload_data   (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_data[31:0]         ), //i
    .io_outputs_2_r_payload_id     (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_id[3:0]            ), //i
    .io_outputs_2_r_payload_resp   (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_resp[1:0]          ), //i
    .io_outputs_2_r_payload_last   (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_last               ), //i
    .io_outputs_3_ar_valid         (axiIn0_readOnly_decoder_io_outputs_3_ar_valid                  ), //o
    .io_outputs_3_ar_ready         (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_fire), //i
    .io_outputs_3_ar_payload_addr  (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_addr[31:0]     ), //o
    .io_outputs_3_ar_payload_id    (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_id[3:0]        ), //o
    .io_outputs_3_ar_payload_len   (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_len[7:0]       ), //o
    .io_outputs_3_ar_payload_size  (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_size[2:0]      ), //o
    .io_outputs_3_ar_payload_burst (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_burst[1:0]     ), //o
    .io_outputs_3_ar_payload_lock  (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_lock           ), //o
    .io_outputs_3_ar_payload_cache (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_cache[3:0]     ), //o
    .io_outputs_3_ar_payload_prot  (axiIn0_readOnly_decoder_io_outputs_3_ar_payload_prot[2:0]      ), //o
    .io_outputs_3_r_valid          (axi4ReadOnlyArbiter_7_io_inputs_0_r_valid                      ), //i
    .io_outputs_3_r_ready          (axiIn0_readOnly_decoder_io_outputs_3_r_ready                   ), //o
    .io_outputs_3_r_payload_data   (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_data[31:0]         ), //i
    .io_outputs_3_r_payload_id     (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_id[3:0]            ), //i
    .io_outputs_3_r_payload_resp   (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_resp[1:0]          ), //i
    .io_outputs_3_r_payload_last   (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_last               ), //i
    .clk                           (clk                                                            ), //i
    .resetn                        (resetn                                                         )  //i
  );
  Axi4WriteOnlyDecoder axiIn0_writeOnly_decoder (
    .io_input_aw_valid             (axiIn0_writeOnly_aw_valid                                       ), //i
    .io_input_aw_ready             (axiIn0_writeOnly_decoder_io_input_aw_ready                      ), //o
    .io_input_aw_payload_addr      (axiIn0_writeOnly_aw_payload_addr[31:0]                          ), //i
    .io_input_aw_payload_id        (axiIn0_writeOnly_aw_payload_id[3:0]                             ), //i
    .io_input_aw_payload_len       (axiIn0_writeOnly_aw_payload_len[7:0]                            ), //i
    .io_input_aw_payload_size      (axiIn0_writeOnly_aw_payload_size[2:0]                           ), //i
    .io_input_aw_payload_burst     (axiIn0_writeOnly_aw_payload_burst[1:0]                          ), //i
    .io_input_aw_payload_lock      (axiIn0_writeOnly_aw_payload_lock                                ), //i
    .io_input_aw_payload_cache     (axiIn0_writeOnly_aw_payload_cache[3:0]                          ), //i
    .io_input_aw_payload_prot      (axiIn0_writeOnly_aw_payload_prot[2:0]                           ), //i
    .io_input_w_valid              (axiIn0_writeOnly_w_valid                                        ), //i
    .io_input_w_ready              (axiIn0_writeOnly_decoder_io_input_w_ready                       ), //o
    .io_input_w_payload_data       (axiIn0_writeOnly_w_payload_data[31:0]                           ), //i
    .io_input_w_payload_strb       (axiIn0_writeOnly_w_payload_strb[3:0]                            ), //i
    .io_input_w_payload_last       (axiIn0_writeOnly_w_payload_last                                 ), //i
    .io_input_b_valid              (axiIn0_writeOnly_decoder_io_input_b_valid                       ), //o
    .io_input_b_ready              (axiIn0_writeOnly_b_ready                                        ), //i
    .io_input_b_payload_id         (axiIn0_writeOnly_decoder_io_input_b_payload_id[3:0]             ), //o
    .io_input_b_payload_resp       (axiIn0_writeOnly_decoder_io_input_b_payload_resp[1:0]           ), //o
    .io_outputs_0_aw_valid         (axiIn0_writeOnly_decoder_io_outputs_0_aw_valid                  ), //o
    .io_outputs_0_aw_ready         (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire), //i
    .io_outputs_0_aw_payload_addr  (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_addr[31:0]     ), //o
    .io_outputs_0_aw_payload_id    (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_id[3:0]        ), //o
    .io_outputs_0_aw_payload_len   (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_len[7:0]       ), //o
    .io_outputs_0_aw_payload_size  (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_size[2:0]      ), //o
    .io_outputs_0_aw_payload_burst (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_burst[1:0]     ), //o
    .io_outputs_0_aw_payload_lock  (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_lock           ), //o
    .io_outputs_0_aw_payload_cache (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_cache[3:0]     ), //o
    .io_outputs_0_aw_payload_prot  (axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_prot[2:0]      ), //o
    .io_outputs_0_w_valid          (axiIn0_writeOnly_decoder_io_outputs_0_w_valid                   ), //o
    .io_outputs_0_w_ready          (axi4WriteOnlyArbiter_4_io_inputs_0_w_ready                      ), //i
    .io_outputs_0_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_0_w_payload_data[31:0]      ), //o
    .io_outputs_0_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]       ), //o
    .io_outputs_0_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_0_w_payload_last            ), //o
    .io_outputs_0_b_valid          (axi4WriteOnlyArbiter_4_io_inputs_0_b_valid                      ), //i
    .io_outputs_0_b_ready          (axiIn0_writeOnly_decoder_io_outputs_0_b_ready                   ), //o
    .io_outputs_0_b_payload_id     (axi4WriteOnlyArbiter_4_io_inputs_0_b_payload_id[3:0]            ), //i
    .io_outputs_0_b_payload_resp   (axi4WriteOnlyArbiter_4_io_inputs_0_b_payload_resp[1:0]          ), //i
    .io_outputs_1_aw_valid         (axiIn0_writeOnly_decoder_io_outputs_1_aw_valid                  ), //o
    .io_outputs_1_aw_ready         (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_fire), //i
    .io_outputs_1_aw_payload_addr  (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_addr[31:0]     ), //o
    .io_outputs_1_aw_payload_id    (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_id[3:0]        ), //o
    .io_outputs_1_aw_payload_len   (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_len[7:0]       ), //o
    .io_outputs_1_aw_payload_size  (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_size[2:0]      ), //o
    .io_outputs_1_aw_payload_burst (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_burst[1:0]     ), //o
    .io_outputs_1_aw_payload_lock  (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_lock           ), //o
    .io_outputs_1_aw_payload_cache (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_cache[3:0]     ), //o
    .io_outputs_1_aw_payload_prot  (axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_prot[2:0]      ), //o
    .io_outputs_1_w_valid          (axiIn0_writeOnly_decoder_io_outputs_1_w_valid                   ), //o
    .io_outputs_1_w_ready          (axi4WriteOnlyArbiter_5_io_inputs_0_w_ready                      ), //i
    .io_outputs_1_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_1_w_payload_data[31:0]      ), //o
    .io_outputs_1_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_1_w_payload_strb[3:0]       ), //o
    .io_outputs_1_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_1_w_payload_last            ), //o
    .io_outputs_1_b_valid          (axi4WriteOnlyArbiter_5_io_inputs_0_b_valid                      ), //i
    .io_outputs_1_b_ready          (axiIn0_writeOnly_decoder_io_outputs_1_b_ready                   ), //o
    .io_outputs_1_b_payload_id     (axi4WriteOnlyArbiter_5_io_inputs_0_b_payload_id[3:0]            ), //i
    .io_outputs_1_b_payload_resp   (axi4WriteOnlyArbiter_5_io_inputs_0_b_payload_resp[1:0]          ), //i
    .io_outputs_2_aw_valid         (axiIn0_writeOnly_decoder_io_outputs_2_aw_valid                  ), //o
    .io_outputs_2_aw_ready         (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_fire), //i
    .io_outputs_2_aw_payload_addr  (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_addr[31:0]     ), //o
    .io_outputs_2_aw_payload_id    (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_id[3:0]        ), //o
    .io_outputs_2_aw_payload_len   (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_len[7:0]       ), //o
    .io_outputs_2_aw_payload_size  (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_size[2:0]      ), //o
    .io_outputs_2_aw_payload_burst (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_burst[1:0]     ), //o
    .io_outputs_2_aw_payload_lock  (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_lock           ), //o
    .io_outputs_2_aw_payload_cache (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_cache[3:0]     ), //o
    .io_outputs_2_aw_payload_prot  (axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_prot[2:0]      ), //o
    .io_outputs_2_w_valid          (axiIn0_writeOnly_decoder_io_outputs_2_w_valid                   ), //o
    .io_outputs_2_w_ready          (axi4WriteOnlyArbiter_6_io_inputs_0_w_ready                      ), //i
    .io_outputs_2_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_2_w_payload_data[31:0]      ), //o
    .io_outputs_2_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_2_w_payload_strb[3:0]       ), //o
    .io_outputs_2_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_2_w_payload_last            ), //o
    .io_outputs_2_b_valid          (axi4WriteOnlyArbiter_6_io_inputs_0_b_valid                      ), //i
    .io_outputs_2_b_ready          (axiIn0_writeOnly_decoder_io_outputs_2_b_ready                   ), //o
    .io_outputs_2_b_payload_id     (axi4WriteOnlyArbiter_6_io_inputs_0_b_payload_id[3:0]            ), //i
    .io_outputs_2_b_payload_resp   (axi4WriteOnlyArbiter_6_io_inputs_0_b_payload_resp[1:0]          ), //i
    .io_outputs_3_aw_valid         (axiIn0_writeOnly_decoder_io_outputs_3_aw_valid                  ), //o
    .io_outputs_3_aw_ready         (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_fire), //i
    .io_outputs_3_aw_payload_addr  (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_addr[31:0]     ), //o
    .io_outputs_3_aw_payload_id    (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_id[3:0]        ), //o
    .io_outputs_3_aw_payload_len   (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_len[7:0]       ), //o
    .io_outputs_3_aw_payload_size  (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_size[2:0]      ), //o
    .io_outputs_3_aw_payload_burst (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_burst[1:0]     ), //o
    .io_outputs_3_aw_payload_lock  (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_lock           ), //o
    .io_outputs_3_aw_payload_cache (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_cache[3:0]     ), //o
    .io_outputs_3_aw_payload_prot  (axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_prot[2:0]      ), //o
    .io_outputs_3_w_valid          (axiIn0_writeOnly_decoder_io_outputs_3_w_valid                   ), //o
    .io_outputs_3_w_ready          (axi4WriteOnlyArbiter_7_io_inputs_0_w_ready                      ), //i
    .io_outputs_3_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_3_w_payload_data[31:0]      ), //o
    .io_outputs_3_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_3_w_payload_strb[3:0]       ), //o
    .io_outputs_3_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_3_w_payload_last            ), //o
    .io_outputs_3_b_valid          (axi4WriteOnlyArbiter_7_io_inputs_0_b_valid                      ), //i
    .io_outputs_3_b_ready          (axiIn0_writeOnly_decoder_io_outputs_3_b_ready                   ), //o
    .io_outputs_3_b_payload_id     (axi4WriteOnlyArbiter_7_io_inputs_0_b_payload_id[3:0]            ), //i
    .io_outputs_3_b_payload_resp   (axi4WriteOnlyArbiter_7_io_inputs_0_b_payload_resp[1:0]          ), //i
    .clk                           (clk                                                             ), //i
    .resetn                        (resetn                                                          )  //i
  );
  Axi4ReadOnlyDecoder axiIn1_readOnly_decoder (
    .io_input_ar_valid             (axiIn1_readOnly_ar_valid                                       ), //i
    .io_input_ar_ready             (axiIn1_readOnly_decoder_io_input_ar_ready                      ), //o
    .io_input_ar_payload_addr      (axiIn1_readOnly_ar_payload_addr[31:0]                          ), //i
    .io_input_ar_payload_id        (axiIn1_readOnly_ar_payload_id[3:0]                             ), //i
    .io_input_ar_payload_len       (axiIn1_readOnly_ar_payload_len[7:0]                            ), //i
    .io_input_ar_payload_size      (axiIn1_readOnly_ar_payload_size[2:0]                           ), //i
    .io_input_ar_payload_burst     (axiIn1_readOnly_ar_payload_burst[1:0]                          ), //i
    .io_input_ar_payload_lock      (axiIn1_readOnly_ar_payload_lock                                ), //i
    .io_input_ar_payload_cache     (axiIn1_readOnly_ar_payload_cache[3:0]                          ), //i
    .io_input_ar_payload_prot      (axiIn1_readOnly_ar_payload_prot[2:0]                           ), //i
    .io_input_r_valid              (axiIn1_readOnly_decoder_io_input_r_valid                       ), //o
    .io_input_r_ready              (axiIn1_readOnly_r_ready                                        ), //i
    .io_input_r_payload_data       (axiIn1_readOnly_decoder_io_input_r_payload_data[31:0]          ), //o
    .io_input_r_payload_id         (axiIn1_readOnly_decoder_io_input_r_payload_id[3:0]             ), //o
    .io_input_r_payload_resp       (axiIn1_readOnly_decoder_io_input_r_payload_resp[1:0]           ), //o
    .io_input_r_payload_last       (axiIn1_readOnly_decoder_io_input_r_payload_last                ), //o
    .io_outputs_0_ar_valid         (axiIn1_readOnly_decoder_io_outputs_0_ar_valid                  ), //o
    .io_outputs_0_ar_ready         (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_fire), //i
    .io_outputs_0_ar_payload_addr  (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_addr[31:0]     ), //o
    .io_outputs_0_ar_payload_id    (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_id[3:0]        ), //o
    .io_outputs_0_ar_payload_len   (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_len[7:0]       ), //o
    .io_outputs_0_ar_payload_size  (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_size[2:0]      ), //o
    .io_outputs_0_ar_payload_burst (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_burst[1:0]     ), //o
    .io_outputs_0_ar_payload_lock  (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_lock           ), //o
    .io_outputs_0_ar_payload_cache (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_cache[3:0]     ), //o
    .io_outputs_0_ar_payload_prot  (axiIn1_readOnly_decoder_io_outputs_0_ar_payload_prot[2:0]      ), //o
    .io_outputs_0_r_valid          (axi4ReadOnlyArbiter_4_io_inputs_1_r_valid                      ), //i
    .io_outputs_0_r_ready          (axiIn1_readOnly_decoder_io_outputs_0_r_ready                   ), //o
    .io_outputs_0_r_payload_data   (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_data[31:0]         ), //i
    .io_outputs_0_r_payload_id     (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_id[3:0]            ), //i
    .io_outputs_0_r_payload_resp   (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_resp[1:0]          ), //i
    .io_outputs_0_r_payload_last   (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_last               ), //i
    .io_outputs_1_ar_valid         (axiIn1_readOnly_decoder_io_outputs_1_ar_valid                  ), //o
    .io_outputs_1_ar_ready         (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_fire), //i
    .io_outputs_1_ar_payload_addr  (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_addr[31:0]     ), //o
    .io_outputs_1_ar_payload_id    (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_id[3:0]        ), //o
    .io_outputs_1_ar_payload_len   (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_len[7:0]       ), //o
    .io_outputs_1_ar_payload_size  (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_size[2:0]      ), //o
    .io_outputs_1_ar_payload_burst (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_burst[1:0]     ), //o
    .io_outputs_1_ar_payload_lock  (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_lock           ), //o
    .io_outputs_1_ar_payload_cache (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_cache[3:0]     ), //o
    .io_outputs_1_ar_payload_prot  (axiIn1_readOnly_decoder_io_outputs_1_ar_payload_prot[2:0]      ), //o
    .io_outputs_1_r_valid          (axi4ReadOnlyArbiter_5_io_inputs_1_r_valid                      ), //i
    .io_outputs_1_r_ready          (axiIn1_readOnly_decoder_io_outputs_1_r_ready                   ), //o
    .io_outputs_1_r_payload_data   (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_data[31:0]         ), //i
    .io_outputs_1_r_payload_id     (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_id[3:0]            ), //i
    .io_outputs_1_r_payload_resp   (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_resp[1:0]          ), //i
    .io_outputs_1_r_payload_last   (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_last               ), //i
    .io_outputs_2_ar_valid         (axiIn1_readOnly_decoder_io_outputs_2_ar_valid                  ), //o
    .io_outputs_2_ar_ready         (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_fire), //i
    .io_outputs_2_ar_payload_addr  (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_addr[31:0]     ), //o
    .io_outputs_2_ar_payload_id    (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_id[3:0]        ), //o
    .io_outputs_2_ar_payload_len   (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_len[7:0]       ), //o
    .io_outputs_2_ar_payload_size  (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_size[2:0]      ), //o
    .io_outputs_2_ar_payload_burst (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_burst[1:0]     ), //o
    .io_outputs_2_ar_payload_lock  (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_lock           ), //o
    .io_outputs_2_ar_payload_cache (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_cache[3:0]     ), //o
    .io_outputs_2_ar_payload_prot  (axiIn1_readOnly_decoder_io_outputs_2_ar_payload_prot[2:0]      ), //o
    .io_outputs_2_r_valid          (axi4ReadOnlyArbiter_6_io_inputs_1_r_valid                      ), //i
    .io_outputs_2_r_ready          (axiIn1_readOnly_decoder_io_outputs_2_r_ready                   ), //o
    .io_outputs_2_r_payload_data   (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_data[31:0]         ), //i
    .io_outputs_2_r_payload_id     (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_id[3:0]            ), //i
    .io_outputs_2_r_payload_resp   (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_resp[1:0]          ), //i
    .io_outputs_2_r_payload_last   (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_last               ), //i
    .io_outputs_3_ar_valid         (axiIn1_readOnly_decoder_io_outputs_3_ar_valid                  ), //o
    .io_outputs_3_ar_ready         (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_fire), //i
    .io_outputs_3_ar_payload_addr  (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_addr[31:0]     ), //o
    .io_outputs_3_ar_payload_id    (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_id[3:0]        ), //o
    .io_outputs_3_ar_payload_len   (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_len[7:0]       ), //o
    .io_outputs_3_ar_payload_size  (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_size[2:0]      ), //o
    .io_outputs_3_ar_payload_burst (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_burst[1:0]     ), //o
    .io_outputs_3_ar_payload_lock  (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_lock           ), //o
    .io_outputs_3_ar_payload_cache (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_cache[3:0]     ), //o
    .io_outputs_3_ar_payload_prot  (axiIn1_readOnly_decoder_io_outputs_3_ar_payload_prot[2:0]      ), //o
    .io_outputs_3_r_valid          (axi4ReadOnlyArbiter_7_io_inputs_1_r_valid                      ), //i
    .io_outputs_3_r_ready          (axiIn1_readOnly_decoder_io_outputs_3_r_ready                   ), //o
    .io_outputs_3_r_payload_data   (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_data[31:0]         ), //i
    .io_outputs_3_r_payload_id     (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_id[3:0]            ), //i
    .io_outputs_3_r_payload_resp   (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_resp[1:0]          ), //i
    .io_outputs_3_r_payload_last   (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_last               ), //i
    .clk                           (clk                                                            ), //i
    .resetn                        (resetn                                                         )  //i
  );
  Axi4WriteOnlyDecoder axiIn1_writeOnly_decoder (
    .io_input_aw_valid             (axiIn1_writeOnly_aw_valid                                       ), //i
    .io_input_aw_ready             (axiIn1_writeOnly_decoder_io_input_aw_ready                      ), //o
    .io_input_aw_payload_addr      (axiIn1_writeOnly_aw_payload_addr[31:0]                          ), //i
    .io_input_aw_payload_id        (axiIn1_writeOnly_aw_payload_id[3:0]                             ), //i
    .io_input_aw_payload_len       (axiIn1_writeOnly_aw_payload_len[7:0]                            ), //i
    .io_input_aw_payload_size      (axiIn1_writeOnly_aw_payload_size[2:0]                           ), //i
    .io_input_aw_payload_burst     (axiIn1_writeOnly_aw_payload_burst[1:0]                          ), //i
    .io_input_aw_payload_lock      (axiIn1_writeOnly_aw_payload_lock                                ), //i
    .io_input_aw_payload_cache     (axiIn1_writeOnly_aw_payload_cache[3:0]                          ), //i
    .io_input_aw_payload_prot      (axiIn1_writeOnly_aw_payload_prot[2:0]                           ), //i
    .io_input_w_valid              (axiIn1_writeOnly_w_valid                                        ), //i
    .io_input_w_ready              (axiIn1_writeOnly_decoder_io_input_w_ready                       ), //o
    .io_input_w_payload_data       (axiIn1_writeOnly_w_payload_data[31:0]                           ), //i
    .io_input_w_payload_strb       (axiIn1_writeOnly_w_payload_strb[3:0]                            ), //i
    .io_input_w_payload_last       (axiIn1_writeOnly_w_payload_last                                 ), //i
    .io_input_b_valid              (axiIn1_writeOnly_decoder_io_input_b_valid                       ), //o
    .io_input_b_ready              (axiIn1_writeOnly_b_ready                                        ), //i
    .io_input_b_payload_id         (axiIn1_writeOnly_decoder_io_input_b_payload_id[3:0]             ), //o
    .io_input_b_payload_resp       (axiIn1_writeOnly_decoder_io_input_b_payload_resp[1:0]           ), //o
    .io_outputs_0_aw_valid         (axiIn1_writeOnly_decoder_io_outputs_0_aw_valid                  ), //o
    .io_outputs_0_aw_ready         (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire), //i
    .io_outputs_0_aw_payload_addr  (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_addr[31:0]     ), //o
    .io_outputs_0_aw_payload_id    (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_id[3:0]        ), //o
    .io_outputs_0_aw_payload_len   (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_len[7:0]       ), //o
    .io_outputs_0_aw_payload_size  (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_size[2:0]      ), //o
    .io_outputs_0_aw_payload_burst (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_burst[1:0]     ), //o
    .io_outputs_0_aw_payload_lock  (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_lock           ), //o
    .io_outputs_0_aw_payload_cache (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_cache[3:0]     ), //o
    .io_outputs_0_aw_payload_prot  (axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_prot[2:0]      ), //o
    .io_outputs_0_w_valid          (axiIn1_writeOnly_decoder_io_outputs_0_w_valid                   ), //o
    .io_outputs_0_w_ready          (axi4WriteOnlyArbiter_4_io_inputs_1_w_ready                      ), //i
    .io_outputs_0_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_0_w_payload_data[31:0]      ), //o
    .io_outputs_0_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]       ), //o
    .io_outputs_0_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_0_w_payload_last            ), //o
    .io_outputs_0_b_valid          (axi4WriteOnlyArbiter_4_io_inputs_1_b_valid                      ), //i
    .io_outputs_0_b_ready          (axiIn1_writeOnly_decoder_io_outputs_0_b_ready                   ), //o
    .io_outputs_0_b_payload_id     (axi4WriteOnlyArbiter_4_io_inputs_1_b_payload_id[3:0]            ), //i
    .io_outputs_0_b_payload_resp   (axi4WriteOnlyArbiter_4_io_inputs_1_b_payload_resp[1:0]          ), //i
    .io_outputs_1_aw_valid         (axiIn1_writeOnly_decoder_io_outputs_1_aw_valid                  ), //o
    .io_outputs_1_aw_ready         (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_fire), //i
    .io_outputs_1_aw_payload_addr  (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_addr[31:0]     ), //o
    .io_outputs_1_aw_payload_id    (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_id[3:0]        ), //o
    .io_outputs_1_aw_payload_len   (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_len[7:0]       ), //o
    .io_outputs_1_aw_payload_size  (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_size[2:0]      ), //o
    .io_outputs_1_aw_payload_burst (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_burst[1:0]     ), //o
    .io_outputs_1_aw_payload_lock  (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_lock           ), //o
    .io_outputs_1_aw_payload_cache (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_cache[3:0]     ), //o
    .io_outputs_1_aw_payload_prot  (axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_prot[2:0]      ), //o
    .io_outputs_1_w_valid          (axiIn1_writeOnly_decoder_io_outputs_1_w_valid                   ), //o
    .io_outputs_1_w_ready          (axi4WriteOnlyArbiter_5_io_inputs_1_w_ready                      ), //i
    .io_outputs_1_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_1_w_payload_data[31:0]      ), //o
    .io_outputs_1_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_1_w_payload_strb[3:0]       ), //o
    .io_outputs_1_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_1_w_payload_last            ), //o
    .io_outputs_1_b_valid          (axi4WriteOnlyArbiter_5_io_inputs_1_b_valid                      ), //i
    .io_outputs_1_b_ready          (axiIn1_writeOnly_decoder_io_outputs_1_b_ready                   ), //o
    .io_outputs_1_b_payload_id     (axi4WriteOnlyArbiter_5_io_inputs_1_b_payload_id[3:0]            ), //i
    .io_outputs_1_b_payload_resp   (axi4WriteOnlyArbiter_5_io_inputs_1_b_payload_resp[1:0]          ), //i
    .io_outputs_2_aw_valid         (axiIn1_writeOnly_decoder_io_outputs_2_aw_valid                  ), //o
    .io_outputs_2_aw_ready         (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_fire), //i
    .io_outputs_2_aw_payload_addr  (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_addr[31:0]     ), //o
    .io_outputs_2_aw_payload_id    (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_id[3:0]        ), //o
    .io_outputs_2_aw_payload_len   (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_len[7:0]       ), //o
    .io_outputs_2_aw_payload_size  (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_size[2:0]      ), //o
    .io_outputs_2_aw_payload_burst (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_burst[1:0]     ), //o
    .io_outputs_2_aw_payload_lock  (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_lock           ), //o
    .io_outputs_2_aw_payload_cache (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_cache[3:0]     ), //o
    .io_outputs_2_aw_payload_prot  (axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_prot[2:0]      ), //o
    .io_outputs_2_w_valid          (axiIn1_writeOnly_decoder_io_outputs_2_w_valid                   ), //o
    .io_outputs_2_w_ready          (axi4WriteOnlyArbiter_6_io_inputs_1_w_ready                      ), //i
    .io_outputs_2_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_2_w_payload_data[31:0]      ), //o
    .io_outputs_2_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_2_w_payload_strb[3:0]       ), //o
    .io_outputs_2_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_2_w_payload_last            ), //o
    .io_outputs_2_b_valid          (axi4WriteOnlyArbiter_6_io_inputs_1_b_valid                      ), //i
    .io_outputs_2_b_ready          (axiIn1_writeOnly_decoder_io_outputs_2_b_ready                   ), //o
    .io_outputs_2_b_payload_id     (axi4WriteOnlyArbiter_6_io_inputs_1_b_payload_id[3:0]            ), //i
    .io_outputs_2_b_payload_resp   (axi4WriteOnlyArbiter_6_io_inputs_1_b_payload_resp[1:0]          ), //i
    .io_outputs_3_aw_valid         (axiIn1_writeOnly_decoder_io_outputs_3_aw_valid                  ), //o
    .io_outputs_3_aw_ready         (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_fire), //i
    .io_outputs_3_aw_payload_addr  (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_addr[31:0]     ), //o
    .io_outputs_3_aw_payload_id    (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_id[3:0]        ), //o
    .io_outputs_3_aw_payload_len   (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_len[7:0]       ), //o
    .io_outputs_3_aw_payload_size  (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_size[2:0]      ), //o
    .io_outputs_3_aw_payload_burst (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_burst[1:0]     ), //o
    .io_outputs_3_aw_payload_lock  (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_lock           ), //o
    .io_outputs_3_aw_payload_cache (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_cache[3:0]     ), //o
    .io_outputs_3_aw_payload_prot  (axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_prot[2:0]      ), //o
    .io_outputs_3_w_valid          (axiIn1_writeOnly_decoder_io_outputs_3_w_valid                   ), //o
    .io_outputs_3_w_ready          (axi4WriteOnlyArbiter_7_io_inputs_1_w_ready                      ), //i
    .io_outputs_3_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_3_w_payload_data[31:0]      ), //o
    .io_outputs_3_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_3_w_payload_strb[3:0]       ), //o
    .io_outputs_3_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_3_w_payload_last            ), //o
    .io_outputs_3_b_valid          (axi4WriteOnlyArbiter_7_io_inputs_1_b_valid                      ), //i
    .io_outputs_3_b_ready          (axiIn1_writeOnly_decoder_io_outputs_3_b_ready                   ), //o
    .io_outputs_3_b_payload_id     (axi4WriteOnlyArbiter_7_io_inputs_1_b_payload_id[3:0]            ), //i
    .io_outputs_3_b_payload_resp   (axi4WriteOnlyArbiter_7_io_inputs_1_b_payload_resp[1:0]          ), //i
    .clk                           (clk                                                             ), //i
    .resetn                        (resetn                                                          )  //i
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_4 (
    .io_inputs_0_ar_valid         (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_valid             ), //i
    .io_inputs_0_ar_ready         (axi4ReadOnlyArbiter_4_io_inputs_0_ar_ready                                   ), //o
    .io_inputs_0_ar_payload_addr  (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_ar_payload_id    (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_ar_payload_len   (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_ar_payload_size  (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_ar_payload_burst (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_ar_payload_lock  (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock      ), //i
    .io_inputs_0_ar_payload_cache (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_ar_payload_prot  (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_r_valid          (axi4ReadOnlyArbiter_4_io_inputs_0_r_valid                                    ), //o
    .io_inputs_0_r_ready          (axiIn0_readOnly_decoder_io_outputs_0_r_ready                                 ), //i
    .io_inputs_0_r_payload_data   (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_data[31:0]                       ), //o
    .io_inputs_0_r_payload_id     (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_id[3:0]                          ), //o
    .io_inputs_0_r_payload_resp   (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_resp[1:0]                        ), //o
    .io_inputs_0_r_payload_last   (axi4ReadOnlyArbiter_4_io_inputs_0_r_payload_last                             ), //o
    .io_inputs_1_ar_valid         (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_valid             ), //i
    .io_inputs_1_ar_ready         (axi4ReadOnlyArbiter_4_io_inputs_1_ar_ready                                   ), //o
    .io_inputs_1_ar_payload_addr  (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_ar_payload_id    (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_ar_payload_len   (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_ar_payload_size  (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_ar_payload_burst (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_ar_payload_lock  (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock      ), //i
    .io_inputs_1_ar_payload_cache (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_ar_payload_prot  (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_r_valid          (axi4ReadOnlyArbiter_4_io_inputs_1_r_valid                                    ), //o
    .io_inputs_1_r_ready          (axiIn1_readOnly_decoder_io_outputs_0_r_ready                                 ), //i
    .io_inputs_1_r_payload_data   (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_data[31:0]                       ), //o
    .io_inputs_1_r_payload_id     (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_id[3:0]                          ), //o
    .io_inputs_1_r_payload_resp   (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_resp[1:0]                        ), //o
    .io_inputs_1_r_payload_last   (axi4ReadOnlyArbiter_4_io_inputs_1_r_payload_last                             ), //o
    .io_output_ar_valid           (axi4ReadOnlyArbiter_4_io_output_ar_valid                                     ), //o
    .io_output_ar_ready           (axiOut_0_ar_ready                                                            ), //i
    .io_output_ar_payload_addr    (axi4ReadOnlyArbiter_4_io_output_ar_payload_addr[31:0]                        ), //o
    .io_output_ar_payload_id      (axi4ReadOnlyArbiter_4_io_output_ar_payload_id[4:0]                           ), //o
    .io_output_ar_payload_len     (axi4ReadOnlyArbiter_4_io_output_ar_payload_len[7:0]                          ), //o
    .io_output_ar_payload_size    (axi4ReadOnlyArbiter_4_io_output_ar_payload_size[2:0]                         ), //o
    .io_output_ar_payload_burst   (axi4ReadOnlyArbiter_4_io_output_ar_payload_burst[1:0]                        ), //o
    .io_output_ar_payload_lock    (axi4ReadOnlyArbiter_4_io_output_ar_payload_lock                              ), //o
    .io_output_ar_payload_cache   (axi4ReadOnlyArbiter_4_io_output_ar_payload_cache[3:0]                        ), //o
    .io_output_ar_payload_prot    (axi4ReadOnlyArbiter_4_io_output_ar_payload_prot[2:0]                         ), //o
    .io_output_r_valid            (axiOut_0_r_valid                                                             ), //i
    .io_output_r_ready            (axi4ReadOnlyArbiter_4_io_output_r_ready                                      ), //o
    .io_output_r_payload_data     (axiOut_0_r_payload_data[31:0]                                                ), //i
    .io_output_r_payload_id       (axiOut_0_r_payload_id[4:0]                                                   ), //i
    .io_output_r_payload_resp     (axiOut_0_r_payload_resp[1:0]                                                 ), //i
    .io_output_r_payload_last     (axiOut_0_r_payload_last                                                      ), //i
    .clk                          (clk                                                                          ), //i
    .resetn                       (resetn                                                                       )  //i
  );
  Axi4WriteOnlyArbiter axi4WriteOnlyArbiter_4 (
    .io_inputs_0_aw_valid         (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid             ), //i
    .io_inputs_0_aw_ready         (axi4WriteOnlyArbiter_4_io_inputs_0_aw_ready                                   ), //o
    .io_inputs_0_aw_payload_addr  (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_aw_payload_id    (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_aw_payload_len   (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_aw_payload_size  (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_aw_payload_burst (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_aw_payload_lock  (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock      ), //i
    .io_inputs_0_aw_payload_cache (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_aw_payload_prot  (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_w_valid          (axiIn0_writeOnly_decoder_io_outputs_0_w_valid                                 ), //i
    .io_inputs_0_w_ready          (axi4WriteOnlyArbiter_4_io_inputs_0_w_ready                                    ), //o
    .io_inputs_0_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_0_w_payload_data[31:0]                    ), //i
    .io_inputs_0_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]                     ), //i
    .io_inputs_0_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_0_w_payload_last                          ), //i
    .io_inputs_0_b_valid          (axi4WriteOnlyArbiter_4_io_inputs_0_b_valid                                    ), //o
    .io_inputs_0_b_ready          (axiIn0_writeOnly_decoder_io_outputs_0_b_ready                                 ), //i
    .io_inputs_0_b_payload_id     (axi4WriteOnlyArbiter_4_io_inputs_0_b_payload_id[3:0]                          ), //o
    .io_inputs_0_b_payload_resp   (axi4WriteOnlyArbiter_4_io_inputs_0_b_payload_resp[1:0]                        ), //o
    .io_inputs_1_aw_valid         (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid             ), //i
    .io_inputs_1_aw_ready         (axi4WriteOnlyArbiter_4_io_inputs_1_aw_ready                                   ), //o
    .io_inputs_1_aw_payload_addr  (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_aw_payload_id    (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_aw_payload_len   (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_aw_payload_size  (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_aw_payload_burst (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_aw_payload_lock  (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock      ), //i
    .io_inputs_1_aw_payload_cache (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_aw_payload_prot  (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_w_valid          (axiIn1_writeOnly_decoder_io_outputs_0_w_valid                                 ), //i
    .io_inputs_1_w_ready          (axi4WriteOnlyArbiter_4_io_inputs_1_w_ready                                    ), //o
    .io_inputs_1_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_0_w_payload_data[31:0]                    ), //i
    .io_inputs_1_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_0_w_payload_strb[3:0]                     ), //i
    .io_inputs_1_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_0_w_payload_last                          ), //i
    .io_inputs_1_b_valid          (axi4WriteOnlyArbiter_4_io_inputs_1_b_valid                                    ), //o
    .io_inputs_1_b_ready          (axiIn1_writeOnly_decoder_io_outputs_0_b_ready                                 ), //i
    .io_inputs_1_b_payload_id     (axi4WriteOnlyArbiter_4_io_inputs_1_b_payload_id[3:0]                          ), //o
    .io_inputs_1_b_payload_resp   (axi4WriteOnlyArbiter_4_io_inputs_1_b_payload_resp[1:0]                        ), //o
    .io_output_aw_valid           (axi4WriteOnlyArbiter_4_io_output_aw_valid                                     ), //o
    .io_output_aw_ready           (axiOut_0_aw_ready                                                             ), //i
    .io_output_aw_payload_addr    (axi4WriteOnlyArbiter_4_io_output_aw_payload_addr[31:0]                        ), //o
    .io_output_aw_payload_id      (axi4WriteOnlyArbiter_4_io_output_aw_payload_id[4:0]                           ), //o
    .io_output_aw_payload_len     (axi4WriteOnlyArbiter_4_io_output_aw_payload_len[7:0]                          ), //o
    .io_output_aw_payload_size    (axi4WriteOnlyArbiter_4_io_output_aw_payload_size[2:0]                         ), //o
    .io_output_aw_payload_burst   (axi4WriteOnlyArbiter_4_io_output_aw_payload_burst[1:0]                        ), //o
    .io_output_aw_payload_lock    (axi4WriteOnlyArbiter_4_io_output_aw_payload_lock                              ), //o
    .io_output_aw_payload_cache   (axi4WriteOnlyArbiter_4_io_output_aw_payload_cache[3:0]                        ), //o
    .io_output_aw_payload_prot    (axi4WriteOnlyArbiter_4_io_output_aw_payload_prot[2:0]                         ), //o
    .io_output_w_valid            (axi4WriteOnlyArbiter_4_io_output_w_valid                                      ), //o
    .io_output_w_ready            (axiOut_0_w_ready                                                              ), //i
    .io_output_w_payload_data     (axi4WriteOnlyArbiter_4_io_output_w_payload_data[31:0]                         ), //o
    .io_output_w_payload_strb     (axi4WriteOnlyArbiter_4_io_output_w_payload_strb[3:0]                          ), //o
    .io_output_w_payload_last     (axi4WriteOnlyArbiter_4_io_output_w_payload_last                               ), //o
    .io_output_b_valid            (axiOut_0_b_valid                                                              ), //i
    .io_output_b_ready            (axi4WriteOnlyArbiter_4_io_output_b_ready                                      ), //o
    .io_output_b_payload_id       (axiOut_0_b_payload_id[4:0]                                                    ), //i
    .io_output_b_payload_resp     (axiOut_0_b_payload_resp[1:0]                                                  ), //i
    .clk                          (clk                                                                           ), //i
    .resetn                       (resetn                                                                        )  //i
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_5 (
    .io_inputs_0_ar_valid         (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_valid             ), //i
    .io_inputs_0_ar_ready         (axi4ReadOnlyArbiter_5_io_inputs_0_ar_ready                                   ), //o
    .io_inputs_0_ar_payload_addr  (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_ar_payload_id    (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_ar_payload_len   (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_ar_payload_size  (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_ar_payload_burst (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_ar_payload_lock  (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock      ), //i
    .io_inputs_0_ar_payload_cache (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_ar_payload_prot  (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_r_valid          (axi4ReadOnlyArbiter_5_io_inputs_0_r_valid                                    ), //o
    .io_inputs_0_r_ready          (axiIn0_readOnly_decoder_io_outputs_1_r_ready                                 ), //i
    .io_inputs_0_r_payload_data   (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_data[31:0]                       ), //o
    .io_inputs_0_r_payload_id     (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_id[3:0]                          ), //o
    .io_inputs_0_r_payload_resp   (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_resp[1:0]                        ), //o
    .io_inputs_0_r_payload_last   (axi4ReadOnlyArbiter_5_io_inputs_0_r_payload_last                             ), //o
    .io_inputs_1_ar_valid         (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_valid             ), //i
    .io_inputs_1_ar_ready         (axi4ReadOnlyArbiter_5_io_inputs_1_ar_ready                                   ), //o
    .io_inputs_1_ar_payload_addr  (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_ar_payload_id    (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_ar_payload_len   (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_ar_payload_size  (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_ar_payload_burst (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_ar_payload_lock  (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock      ), //i
    .io_inputs_1_ar_payload_cache (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_ar_payload_prot  (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_r_valid          (axi4ReadOnlyArbiter_5_io_inputs_1_r_valid                                    ), //o
    .io_inputs_1_r_ready          (axiIn1_readOnly_decoder_io_outputs_1_r_ready                                 ), //i
    .io_inputs_1_r_payload_data   (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_data[31:0]                       ), //o
    .io_inputs_1_r_payload_id     (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_id[3:0]                          ), //o
    .io_inputs_1_r_payload_resp   (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_resp[1:0]                        ), //o
    .io_inputs_1_r_payload_last   (axi4ReadOnlyArbiter_5_io_inputs_1_r_payload_last                             ), //o
    .io_output_ar_valid           (axi4ReadOnlyArbiter_5_io_output_ar_valid                                     ), //o
    .io_output_ar_ready           (axiOut_1_ar_ready                                                            ), //i
    .io_output_ar_payload_addr    (axi4ReadOnlyArbiter_5_io_output_ar_payload_addr[31:0]                        ), //o
    .io_output_ar_payload_id      (axi4ReadOnlyArbiter_5_io_output_ar_payload_id[4:0]                           ), //o
    .io_output_ar_payload_len     (axi4ReadOnlyArbiter_5_io_output_ar_payload_len[7:0]                          ), //o
    .io_output_ar_payload_size    (axi4ReadOnlyArbiter_5_io_output_ar_payload_size[2:0]                         ), //o
    .io_output_ar_payload_burst   (axi4ReadOnlyArbiter_5_io_output_ar_payload_burst[1:0]                        ), //o
    .io_output_ar_payload_lock    (axi4ReadOnlyArbiter_5_io_output_ar_payload_lock                              ), //o
    .io_output_ar_payload_cache   (axi4ReadOnlyArbiter_5_io_output_ar_payload_cache[3:0]                        ), //o
    .io_output_ar_payload_prot    (axi4ReadOnlyArbiter_5_io_output_ar_payload_prot[2:0]                         ), //o
    .io_output_r_valid            (axiOut_1_r_valid                                                             ), //i
    .io_output_r_ready            (axi4ReadOnlyArbiter_5_io_output_r_ready                                      ), //o
    .io_output_r_payload_data     (axiOut_1_r_payload_data[31:0]                                                ), //i
    .io_output_r_payload_id       (axiOut_1_r_payload_id[4:0]                                                   ), //i
    .io_output_r_payload_resp     (axiOut_1_r_payload_resp[1:0]                                                 ), //i
    .io_output_r_payload_last     (axiOut_1_r_payload_last                                                      ), //i
    .clk                          (clk                                                                          ), //i
    .resetn                       (resetn                                                                       )  //i
  );
  Axi4WriteOnlyArbiter_1 axi4WriteOnlyArbiter_5 (
    .io_inputs_0_aw_valid         (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_valid             ), //i
    .io_inputs_0_aw_ready         (axi4WriteOnlyArbiter_5_io_inputs_0_aw_ready                                   ), //o
    .io_inputs_0_aw_payload_addr  (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_aw_payload_id    (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_aw_payload_len   (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_aw_payload_size  (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_aw_payload_burst (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_aw_payload_lock  (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock      ), //i
    .io_inputs_0_aw_payload_cache (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_aw_payload_prot  (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_w_valid          (axiIn0_writeOnly_decoder_io_outputs_1_w_valid                                 ), //i
    .io_inputs_0_w_ready          (axi4WriteOnlyArbiter_5_io_inputs_0_w_ready                                    ), //o
    .io_inputs_0_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_1_w_payload_data[31:0]                    ), //i
    .io_inputs_0_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_1_w_payload_strb[3:0]                     ), //i
    .io_inputs_0_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_1_w_payload_last                          ), //i
    .io_inputs_0_b_valid          (axi4WriteOnlyArbiter_5_io_inputs_0_b_valid                                    ), //o
    .io_inputs_0_b_ready          (axiIn0_writeOnly_decoder_io_outputs_1_b_ready                                 ), //i
    .io_inputs_0_b_payload_id     (axi4WriteOnlyArbiter_5_io_inputs_0_b_payload_id[3:0]                          ), //o
    .io_inputs_0_b_payload_resp   (axi4WriteOnlyArbiter_5_io_inputs_0_b_payload_resp[1:0]                        ), //o
    .io_inputs_1_aw_valid         (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_valid             ), //i
    .io_inputs_1_aw_ready         (axi4WriteOnlyArbiter_5_io_inputs_1_aw_ready                                   ), //o
    .io_inputs_1_aw_payload_addr  (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_aw_payload_id    (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_aw_payload_len   (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_aw_payload_size  (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_aw_payload_burst (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_aw_payload_lock  (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock      ), //i
    .io_inputs_1_aw_payload_cache (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_aw_payload_prot  (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_w_valid          (axiIn1_writeOnly_decoder_io_outputs_1_w_valid                                 ), //i
    .io_inputs_1_w_ready          (axi4WriteOnlyArbiter_5_io_inputs_1_w_ready                                    ), //o
    .io_inputs_1_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_1_w_payload_data[31:0]                    ), //i
    .io_inputs_1_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_1_w_payload_strb[3:0]                     ), //i
    .io_inputs_1_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_1_w_payload_last                          ), //i
    .io_inputs_1_b_valid          (axi4WriteOnlyArbiter_5_io_inputs_1_b_valid                                    ), //o
    .io_inputs_1_b_ready          (axiIn1_writeOnly_decoder_io_outputs_1_b_ready                                 ), //i
    .io_inputs_1_b_payload_id     (axi4WriteOnlyArbiter_5_io_inputs_1_b_payload_id[3:0]                          ), //o
    .io_inputs_1_b_payload_resp   (axi4WriteOnlyArbiter_5_io_inputs_1_b_payload_resp[1:0]                        ), //o
    .io_output_aw_valid           (axi4WriteOnlyArbiter_5_io_output_aw_valid                                     ), //o
    .io_output_aw_ready           (axiOut_1_aw_ready                                                             ), //i
    .io_output_aw_payload_addr    (axi4WriteOnlyArbiter_5_io_output_aw_payload_addr[31:0]                        ), //o
    .io_output_aw_payload_id      (axi4WriteOnlyArbiter_5_io_output_aw_payload_id[4:0]                           ), //o
    .io_output_aw_payload_len     (axi4WriteOnlyArbiter_5_io_output_aw_payload_len[7:0]                          ), //o
    .io_output_aw_payload_size    (axi4WriteOnlyArbiter_5_io_output_aw_payload_size[2:0]                         ), //o
    .io_output_aw_payload_burst   (axi4WriteOnlyArbiter_5_io_output_aw_payload_burst[1:0]                        ), //o
    .io_output_aw_payload_lock    (axi4WriteOnlyArbiter_5_io_output_aw_payload_lock                              ), //o
    .io_output_aw_payload_cache   (axi4WriteOnlyArbiter_5_io_output_aw_payload_cache[3:0]                        ), //o
    .io_output_aw_payload_prot    (axi4WriteOnlyArbiter_5_io_output_aw_payload_prot[2:0]                         ), //o
    .io_output_w_valid            (axi4WriteOnlyArbiter_5_io_output_w_valid                                      ), //o
    .io_output_w_ready            (axiOut_1_w_ready                                                              ), //i
    .io_output_w_payload_data     (axi4WriteOnlyArbiter_5_io_output_w_payload_data[31:0]                         ), //o
    .io_output_w_payload_strb     (axi4WriteOnlyArbiter_5_io_output_w_payload_strb[3:0]                          ), //o
    .io_output_w_payload_last     (axi4WriteOnlyArbiter_5_io_output_w_payload_last                               ), //o
    .io_output_b_valid            (axiOut_1_b_valid                                                              ), //i
    .io_output_b_ready            (axi4WriteOnlyArbiter_5_io_output_b_ready                                      ), //o
    .io_output_b_payload_id       (axiOut_1_b_payload_id[4:0]                                                    ), //i
    .io_output_b_payload_resp     (axiOut_1_b_payload_resp[1:0]                                                  ), //i
    .clk                          (clk                                                                           ), //i
    .resetn                       (resetn                                                                        )  //i
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_6 (
    .io_inputs_0_ar_valid         (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_valid             ), //i
    .io_inputs_0_ar_ready         (axi4ReadOnlyArbiter_6_io_inputs_0_ar_ready                                   ), //o
    .io_inputs_0_ar_payload_addr  (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_ar_payload_id    (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_ar_payload_len   (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_ar_payload_size  (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_ar_payload_burst (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_ar_payload_lock  (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock      ), //i
    .io_inputs_0_ar_payload_cache (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_ar_payload_prot  (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_r_valid          (axi4ReadOnlyArbiter_6_io_inputs_0_r_valid                                    ), //o
    .io_inputs_0_r_ready          (axiIn0_readOnly_decoder_io_outputs_2_r_ready                                 ), //i
    .io_inputs_0_r_payload_data   (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_data[31:0]                       ), //o
    .io_inputs_0_r_payload_id     (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_id[3:0]                          ), //o
    .io_inputs_0_r_payload_resp   (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_resp[1:0]                        ), //o
    .io_inputs_0_r_payload_last   (axi4ReadOnlyArbiter_6_io_inputs_0_r_payload_last                             ), //o
    .io_inputs_1_ar_valid         (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_valid             ), //i
    .io_inputs_1_ar_ready         (axi4ReadOnlyArbiter_6_io_inputs_1_ar_ready                                   ), //o
    .io_inputs_1_ar_payload_addr  (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_ar_payload_id    (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_ar_payload_len   (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_ar_payload_size  (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_ar_payload_burst (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_ar_payload_lock  (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock      ), //i
    .io_inputs_1_ar_payload_cache (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_ar_payload_prot  (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_r_valid          (axi4ReadOnlyArbiter_6_io_inputs_1_r_valid                                    ), //o
    .io_inputs_1_r_ready          (axiIn1_readOnly_decoder_io_outputs_2_r_ready                                 ), //i
    .io_inputs_1_r_payload_data   (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_data[31:0]                       ), //o
    .io_inputs_1_r_payload_id     (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_id[3:0]                          ), //o
    .io_inputs_1_r_payload_resp   (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_resp[1:0]                        ), //o
    .io_inputs_1_r_payload_last   (axi4ReadOnlyArbiter_6_io_inputs_1_r_payload_last                             ), //o
    .io_output_ar_valid           (axi4ReadOnlyArbiter_6_io_output_ar_valid                                     ), //o
    .io_output_ar_ready           (axiOut_2_ar_ready                                                            ), //i
    .io_output_ar_payload_addr    (axi4ReadOnlyArbiter_6_io_output_ar_payload_addr[31:0]                        ), //o
    .io_output_ar_payload_id      (axi4ReadOnlyArbiter_6_io_output_ar_payload_id[4:0]                           ), //o
    .io_output_ar_payload_len     (axi4ReadOnlyArbiter_6_io_output_ar_payload_len[7:0]                          ), //o
    .io_output_ar_payload_size    (axi4ReadOnlyArbiter_6_io_output_ar_payload_size[2:0]                         ), //o
    .io_output_ar_payload_burst   (axi4ReadOnlyArbiter_6_io_output_ar_payload_burst[1:0]                        ), //o
    .io_output_ar_payload_lock    (axi4ReadOnlyArbiter_6_io_output_ar_payload_lock                              ), //o
    .io_output_ar_payload_cache   (axi4ReadOnlyArbiter_6_io_output_ar_payload_cache[3:0]                        ), //o
    .io_output_ar_payload_prot    (axi4ReadOnlyArbiter_6_io_output_ar_payload_prot[2:0]                         ), //o
    .io_output_r_valid            (axiOut_2_r_valid                                                             ), //i
    .io_output_r_ready            (axi4ReadOnlyArbiter_6_io_output_r_ready                                      ), //o
    .io_output_r_payload_data     (axiOut_2_r_payload_data[31:0]                                                ), //i
    .io_output_r_payload_id       (axiOut_2_r_payload_id[4:0]                                                   ), //i
    .io_output_r_payload_resp     (axiOut_2_r_payload_resp[1:0]                                                 ), //i
    .io_output_r_payload_last     (axiOut_2_r_payload_last                                                      ), //i
    .clk                          (clk                                                                          ), //i
    .resetn                       (resetn                                                                       )  //i
  );
  Axi4WriteOnlyArbiter_2 axi4WriteOnlyArbiter_6 (
    .io_inputs_0_aw_valid         (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_valid             ), //i
    .io_inputs_0_aw_ready         (axi4WriteOnlyArbiter_6_io_inputs_0_aw_ready                                   ), //o
    .io_inputs_0_aw_payload_addr  (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_aw_payload_id    (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_aw_payload_len   (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_aw_payload_size  (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_aw_payload_burst (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_aw_payload_lock  (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock      ), //i
    .io_inputs_0_aw_payload_cache (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_aw_payload_prot  (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_w_valid          (axiIn0_writeOnly_decoder_io_outputs_2_w_valid                                 ), //i
    .io_inputs_0_w_ready          (axi4WriteOnlyArbiter_6_io_inputs_0_w_ready                                    ), //o
    .io_inputs_0_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_2_w_payload_data[31:0]                    ), //i
    .io_inputs_0_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_2_w_payload_strb[3:0]                     ), //i
    .io_inputs_0_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_2_w_payload_last                          ), //i
    .io_inputs_0_b_valid          (axi4WriteOnlyArbiter_6_io_inputs_0_b_valid                                    ), //o
    .io_inputs_0_b_ready          (axiIn0_writeOnly_decoder_io_outputs_2_b_ready                                 ), //i
    .io_inputs_0_b_payload_id     (axi4WriteOnlyArbiter_6_io_inputs_0_b_payload_id[3:0]                          ), //o
    .io_inputs_0_b_payload_resp   (axi4WriteOnlyArbiter_6_io_inputs_0_b_payload_resp[1:0]                        ), //o
    .io_inputs_1_aw_valid         (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_valid             ), //i
    .io_inputs_1_aw_ready         (axi4WriteOnlyArbiter_6_io_inputs_1_aw_ready                                   ), //o
    .io_inputs_1_aw_payload_addr  (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_aw_payload_id    (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_aw_payload_len   (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_aw_payload_size  (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_aw_payload_burst (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_aw_payload_lock  (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock      ), //i
    .io_inputs_1_aw_payload_cache (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_aw_payload_prot  (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_w_valid          (axiIn1_writeOnly_decoder_io_outputs_2_w_valid                                 ), //i
    .io_inputs_1_w_ready          (axi4WriteOnlyArbiter_6_io_inputs_1_w_ready                                    ), //o
    .io_inputs_1_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_2_w_payload_data[31:0]                    ), //i
    .io_inputs_1_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_2_w_payload_strb[3:0]                     ), //i
    .io_inputs_1_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_2_w_payload_last                          ), //i
    .io_inputs_1_b_valid          (axi4WriteOnlyArbiter_6_io_inputs_1_b_valid                                    ), //o
    .io_inputs_1_b_ready          (axiIn1_writeOnly_decoder_io_outputs_2_b_ready                                 ), //i
    .io_inputs_1_b_payload_id     (axi4WriteOnlyArbiter_6_io_inputs_1_b_payload_id[3:0]                          ), //o
    .io_inputs_1_b_payload_resp   (axi4WriteOnlyArbiter_6_io_inputs_1_b_payload_resp[1:0]                        ), //o
    .io_output_aw_valid           (axi4WriteOnlyArbiter_6_io_output_aw_valid                                     ), //o
    .io_output_aw_ready           (axiOut_2_aw_ready                                                             ), //i
    .io_output_aw_payload_addr    (axi4WriteOnlyArbiter_6_io_output_aw_payload_addr[31:0]                        ), //o
    .io_output_aw_payload_id      (axi4WriteOnlyArbiter_6_io_output_aw_payload_id[4:0]                           ), //o
    .io_output_aw_payload_len     (axi4WriteOnlyArbiter_6_io_output_aw_payload_len[7:0]                          ), //o
    .io_output_aw_payload_size    (axi4WriteOnlyArbiter_6_io_output_aw_payload_size[2:0]                         ), //o
    .io_output_aw_payload_burst   (axi4WriteOnlyArbiter_6_io_output_aw_payload_burst[1:0]                        ), //o
    .io_output_aw_payload_lock    (axi4WriteOnlyArbiter_6_io_output_aw_payload_lock                              ), //o
    .io_output_aw_payload_cache   (axi4WriteOnlyArbiter_6_io_output_aw_payload_cache[3:0]                        ), //o
    .io_output_aw_payload_prot    (axi4WriteOnlyArbiter_6_io_output_aw_payload_prot[2:0]                         ), //o
    .io_output_w_valid            (axi4WriteOnlyArbiter_6_io_output_w_valid                                      ), //o
    .io_output_w_ready            (axiOut_2_w_ready                                                              ), //i
    .io_output_w_payload_data     (axi4WriteOnlyArbiter_6_io_output_w_payload_data[31:0]                         ), //o
    .io_output_w_payload_strb     (axi4WriteOnlyArbiter_6_io_output_w_payload_strb[3:0]                          ), //o
    .io_output_w_payload_last     (axi4WriteOnlyArbiter_6_io_output_w_payload_last                               ), //o
    .io_output_b_valid            (axiOut_2_b_valid                                                              ), //i
    .io_output_b_ready            (axi4WriteOnlyArbiter_6_io_output_b_ready                                      ), //o
    .io_output_b_payload_id       (axiOut_2_b_payload_id[4:0]                                                    ), //i
    .io_output_b_payload_resp     (axiOut_2_b_payload_resp[1:0]                                                  ), //i
    .clk                          (clk                                                                           ), //i
    .resetn                       (resetn                                                                        )  //i
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_7 (
    .io_inputs_0_ar_valid         (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_valid             ), //i
    .io_inputs_0_ar_ready         (axi4ReadOnlyArbiter_7_io_inputs_0_ar_ready                                   ), //o
    .io_inputs_0_ar_payload_addr  (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_ar_payload_id    (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_ar_payload_len   (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_ar_payload_size  (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_ar_payload_burst (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_ar_payload_lock  (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock      ), //i
    .io_inputs_0_ar_payload_cache (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_ar_payload_prot  (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_r_valid          (axi4ReadOnlyArbiter_7_io_inputs_0_r_valid                                    ), //o
    .io_inputs_0_r_ready          (axiIn0_readOnly_decoder_io_outputs_3_r_ready                                 ), //i
    .io_inputs_0_r_payload_data   (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_data[31:0]                       ), //o
    .io_inputs_0_r_payload_id     (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_id[3:0]                          ), //o
    .io_inputs_0_r_payload_resp   (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_resp[1:0]                        ), //o
    .io_inputs_0_r_payload_last   (axi4ReadOnlyArbiter_7_io_inputs_0_r_payload_last                             ), //o
    .io_inputs_1_ar_valid         (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_valid             ), //i
    .io_inputs_1_ar_ready         (axi4ReadOnlyArbiter_7_io_inputs_1_ar_ready                                   ), //o
    .io_inputs_1_ar_payload_addr  (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_ar_payload_id    (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_ar_payload_len   (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_ar_payload_size  (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_ar_payload_burst (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_ar_payload_lock  (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock      ), //i
    .io_inputs_1_ar_payload_cache (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_ar_payload_prot  (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_r_valid          (axi4ReadOnlyArbiter_7_io_inputs_1_r_valid                                    ), //o
    .io_inputs_1_r_ready          (axiIn1_readOnly_decoder_io_outputs_3_r_ready                                 ), //i
    .io_inputs_1_r_payload_data   (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_data[31:0]                       ), //o
    .io_inputs_1_r_payload_id     (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_id[3:0]                          ), //o
    .io_inputs_1_r_payload_resp   (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_resp[1:0]                        ), //o
    .io_inputs_1_r_payload_last   (axi4ReadOnlyArbiter_7_io_inputs_1_r_payload_last                             ), //o
    .io_output_ar_valid           (axi4ReadOnlyArbiter_7_io_output_ar_valid                                     ), //o
    .io_output_ar_ready           (axiOut_3_ar_ready                                                            ), //i
    .io_output_ar_payload_addr    (axi4ReadOnlyArbiter_7_io_output_ar_payload_addr[31:0]                        ), //o
    .io_output_ar_payload_id      (axi4ReadOnlyArbiter_7_io_output_ar_payload_id[4:0]                           ), //o
    .io_output_ar_payload_len     (axi4ReadOnlyArbiter_7_io_output_ar_payload_len[7:0]                          ), //o
    .io_output_ar_payload_size    (axi4ReadOnlyArbiter_7_io_output_ar_payload_size[2:0]                         ), //o
    .io_output_ar_payload_burst   (axi4ReadOnlyArbiter_7_io_output_ar_payload_burst[1:0]                        ), //o
    .io_output_ar_payload_lock    (axi4ReadOnlyArbiter_7_io_output_ar_payload_lock                              ), //o
    .io_output_ar_payload_cache   (axi4ReadOnlyArbiter_7_io_output_ar_payload_cache[3:0]                        ), //o
    .io_output_ar_payload_prot    (axi4ReadOnlyArbiter_7_io_output_ar_payload_prot[2:0]                         ), //o
    .io_output_r_valid            (axiOut_3_r_valid                                                             ), //i
    .io_output_r_ready            (axi4ReadOnlyArbiter_7_io_output_r_ready                                      ), //o
    .io_output_r_payload_data     (axiOut_3_r_payload_data[31:0]                                                ), //i
    .io_output_r_payload_id       (axiOut_3_r_payload_id[4:0]                                                   ), //i
    .io_output_r_payload_resp     (axiOut_3_r_payload_resp[1:0]                                                 ), //i
    .io_output_r_payload_last     (axiOut_3_r_payload_last                                                      ), //i
    .clk                          (clk                                                                          ), //i
    .resetn                       (resetn                                                                       )  //i
  );
  Axi4WriteOnlyArbiter_3 axi4WriteOnlyArbiter_7 (
    .io_inputs_0_aw_valid         (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_valid             ), //i
    .io_inputs_0_aw_ready         (axi4WriteOnlyArbiter_7_io_inputs_0_aw_ready                                   ), //o
    .io_inputs_0_aw_payload_addr  (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_0_aw_payload_id    (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_0_aw_payload_len   (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_0_aw_payload_size  (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_0_aw_payload_burst (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_0_aw_payload_lock  (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock      ), //i
    .io_inputs_0_aw_payload_cache (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_0_aw_payload_prot  (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_0_w_valid          (axiIn0_writeOnly_decoder_io_outputs_3_w_valid                                 ), //i
    .io_inputs_0_w_ready          (axi4WriteOnlyArbiter_7_io_inputs_0_w_ready                                    ), //o
    .io_inputs_0_w_payload_data   (axiIn0_writeOnly_decoder_io_outputs_3_w_payload_data[31:0]                    ), //i
    .io_inputs_0_w_payload_strb   (axiIn0_writeOnly_decoder_io_outputs_3_w_payload_strb[3:0]                     ), //i
    .io_inputs_0_w_payload_last   (axiIn0_writeOnly_decoder_io_outputs_3_w_payload_last                          ), //i
    .io_inputs_0_b_valid          (axi4WriteOnlyArbiter_7_io_inputs_0_b_valid                                    ), //o
    .io_inputs_0_b_ready          (axiIn0_writeOnly_decoder_io_outputs_3_b_ready                                 ), //i
    .io_inputs_0_b_payload_id     (axi4WriteOnlyArbiter_7_io_inputs_0_b_payload_id[3:0]                          ), //o
    .io_inputs_0_b_payload_resp   (axi4WriteOnlyArbiter_7_io_inputs_0_b_payload_resp[1:0]                        ), //o
    .io_inputs_1_aw_valid         (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_valid             ), //i
    .io_inputs_1_aw_ready         (axi4WriteOnlyArbiter_7_io_inputs_1_aw_ready                                   ), //o
    .io_inputs_1_aw_payload_addr  (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr[31:0]), //i
    .io_inputs_1_aw_payload_id    (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id[3:0]   ), //i
    .io_inputs_1_aw_payload_len   (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len[7:0]  ), //i
    .io_inputs_1_aw_payload_size  (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size[2:0] ), //i
    .io_inputs_1_aw_payload_burst (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst[1:0]), //i
    .io_inputs_1_aw_payload_lock  (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock      ), //i
    .io_inputs_1_aw_payload_cache (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache[3:0]), //i
    .io_inputs_1_aw_payload_prot  (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot[2:0] ), //i
    .io_inputs_1_w_valid          (axiIn1_writeOnly_decoder_io_outputs_3_w_valid                                 ), //i
    .io_inputs_1_w_ready          (axi4WriteOnlyArbiter_7_io_inputs_1_w_ready                                    ), //o
    .io_inputs_1_w_payload_data   (axiIn1_writeOnly_decoder_io_outputs_3_w_payload_data[31:0]                    ), //i
    .io_inputs_1_w_payload_strb   (axiIn1_writeOnly_decoder_io_outputs_3_w_payload_strb[3:0]                     ), //i
    .io_inputs_1_w_payload_last   (axiIn1_writeOnly_decoder_io_outputs_3_w_payload_last                          ), //i
    .io_inputs_1_b_valid          (axi4WriteOnlyArbiter_7_io_inputs_1_b_valid                                    ), //o
    .io_inputs_1_b_ready          (axiIn1_writeOnly_decoder_io_outputs_3_b_ready                                 ), //i
    .io_inputs_1_b_payload_id     (axi4WriteOnlyArbiter_7_io_inputs_1_b_payload_id[3:0]                          ), //o
    .io_inputs_1_b_payload_resp   (axi4WriteOnlyArbiter_7_io_inputs_1_b_payload_resp[1:0]                        ), //o
    .io_output_aw_valid           (axi4WriteOnlyArbiter_7_io_output_aw_valid                                     ), //o
    .io_output_aw_ready           (axiOut_3_aw_ready                                                             ), //i
    .io_output_aw_payload_addr    (axi4WriteOnlyArbiter_7_io_output_aw_payload_addr[31:0]                        ), //o
    .io_output_aw_payload_id      (axi4WriteOnlyArbiter_7_io_output_aw_payload_id[4:0]                           ), //o
    .io_output_aw_payload_len     (axi4WriteOnlyArbiter_7_io_output_aw_payload_len[7:0]                          ), //o
    .io_output_aw_payload_size    (axi4WriteOnlyArbiter_7_io_output_aw_payload_size[2:0]                         ), //o
    .io_output_aw_payload_burst   (axi4WriteOnlyArbiter_7_io_output_aw_payload_burst[1:0]                        ), //o
    .io_output_aw_payload_lock    (axi4WriteOnlyArbiter_7_io_output_aw_payload_lock                              ), //o
    .io_output_aw_payload_cache   (axi4WriteOnlyArbiter_7_io_output_aw_payload_cache[3:0]                        ), //o
    .io_output_aw_payload_prot    (axi4WriteOnlyArbiter_7_io_output_aw_payload_prot[2:0]                         ), //o
    .io_output_w_valid            (axi4WriteOnlyArbiter_7_io_output_w_valid                                      ), //o
    .io_output_w_ready            (axiOut_3_w_ready                                                              ), //i
    .io_output_w_payload_data     (axi4WriteOnlyArbiter_7_io_output_w_payload_data[31:0]                         ), //o
    .io_output_w_payload_strb     (axi4WriteOnlyArbiter_7_io_output_w_payload_strb[3:0]                          ), //o
    .io_output_w_payload_last     (axi4WriteOnlyArbiter_7_io_output_w_payload_last                               ), //o
    .io_output_b_valid            (axiOut_3_b_valid                                                              ), //i
    .io_output_b_ready            (axi4WriteOnlyArbiter_7_io_output_b_ready                                      ), //o
    .io_output_b_payload_id       (axiOut_3_b_payload_id[4:0]                                                    ), //i
    .io_output_b_payload_resp     (axiOut_3_b_payload_resp[1:0]                                                  ), //i
    .clk                          (clk                                                                           ), //i
    .resetn                       (resetn                                                                        )  //i
  );
  assign axiOut_0_ar_valid = axi4ReadOnlyArbiter_4_io_output_ar_valid;
  assign axiOut_0_ar_payload_addr = axi4ReadOnlyArbiter_4_io_output_ar_payload_addr;
  assign axiOut_0_ar_payload_id = axi4ReadOnlyArbiter_4_io_output_ar_payload_id;
  assign axiOut_0_ar_payload_len = axi4ReadOnlyArbiter_4_io_output_ar_payload_len;
  assign axiOut_0_ar_payload_size = axi4ReadOnlyArbiter_4_io_output_ar_payload_size;
  assign axiOut_0_ar_payload_burst = axi4ReadOnlyArbiter_4_io_output_ar_payload_burst;
  assign axiOut_0_ar_payload_lock = axi4ReadOnlyArbiter_4_io_output_ar_payload_lock;
  assign axiOut_0_ar_payload_cache = axi4ReadOnlyArbiter_4_io_output_ar_payload_cache;
  assign axiOut_0_ar_payload_prot = axi4ReadOnlyArbiter_4_io_output_ar_payload_prot;
  assign axiOut_0_r_ready = axi4ReadOnlyArbiter_4_io_output_r_ready;
  assign axiOut_0_aw_valid = axi4WriteOnlyArbiter_4_io_output_aw_valid;
  assign axiOut_0_aw_payload_addr = axi4WriteOnlyArbiter_4_io_output_aw_payload_addr;
  assign axiOut_0_aw_payload_id = axi4WriteOnlyArbiter_4_io_output_aw_payload_id;
  assign axiOut_0_aw_payload_len = axi4WriteOnlyArbiter_4_io_output_aw_payload_len;
  assign axiOut_0_aw_payload_size = axi4WriteOnlyArbiter_4_io_output_aw_payload_size;
  assign axiOut_0_aw_payload_burst = axi4WriteOnlyArbiter_4_io_output_aw_payload_burst;
  assign axiOut_0_aw_payload_lock = axi4WriteOnlyArbiter_4_io_output_aw_payload_lock;
  assign axiOut_0_aw_payload_cache = axi4WriteOnlyArbiter_4_io_output_aw_payload_cache;
  assign axiOut_0_aw_payload_prot = axi4WriteOnlyArbiter_4_io_output_aw_payload_prot;
  assign axiOut_0_w_valid = axi4WriteOnlyArbiter_4_io_output_w_valid;
  assign axiOut_0_w_payload_data = axi4WriteOnlyArbiter_4_io_output_w_payload_data;
  assign axiOut_0_w_payload_strb = axi4WriteOnlyArbiter_4_io_output_w_payload_strb;
  assign axiOut_0_w_payload_last = axi4WriteOnlyArbiter_4_io_output_w_payload_last;
  assign axiOut_0_b_ready = axi4WriteOnlyArbiter_4_io_output_b_ready;
  assign axiOut_1_ar_valid = axi4ReadOnlyArbiter_5_io_output_ar_valid;
  assign axiOut_1_ar_payload_addr = axi4ReadOnlyArbiter_5_io_output_ar_payload_addr;
  assign axiOut_1_ar_payload_id = axi4ReadOnlyArbiter_5_io_output_ar_payload_id;
  assign axiOut_1_ar_payload_len = axi4ReadOnlyArbiter_5_io_output_ar_payload_len;
  assign axiOut_1_ar_payload_size = axi4ReadOnlyArbiter_5_io_output_ar_payload_size;
  assign axiOut_1_ar_payload_burst = axi4ReadOnlyArbiter_5_io_output_ar_payload_burst;
  assign axiOut_1_ar_payload_lock = axi4ReadOnlyArbiter_5_io_output_ar_payload_lock;
  assign axiOut_1_ar_payload_cache = axi4ReadOnlyArbiter_5_io_output_ar_payload_cache;
  assign axiOut_1_ar_payload_prot = axi4ReadOnlyArbiter_5_io_output_ar_payload_prot;
  assign axiOut_1_r_ready = axi4ReadOnlyArbiter_5_io_output_r_ready;
  assign axiOut_1_aw_valid = axi4WriteOnlyArbiter_5_io_output_aw_valid;
  assign axiOut_1_aw_payload_addr = axi4WriteOnlyArbiter_5_io_output_aw_payload_addr;
  assign axiOut_1_aw_payload_id = axi4WriteOnlyArbiter_5_io_output_aw_payload_id;
  assign axiOut_1_aw_payload_len = axi4WriteOnlyArbiter_5_io_output_aw_payload_len;
  assign axiOut_1_aw_payload_size = axi4WriteOnlyArbiter_5_io_output_aw_payload_size;
  assign axiOut_1_aw_payload_burst = axi4WriteOnlyArbiter_5_io_output_aw_payload_burst;
  assign axiOut_1_aw_payload_lock = axi4WriteOnlyArbiter_5_io_output_aw_payload_lock;
  assign axiOut_1_aw_payload_cache = axi4WriteOnlyArbiter_5_io_output_aw_payload_cache;
  assign axiOut_1_aw_payload_prot = axi4WriteOnlyArbiter_5_io_output_aw_payload_prot;
  assign axiOut_1_w_valid = axi4WriteOnlyArbiter_5_io_output_w_valid;
  assign axiOut_1_w_payload_data = axi4WriteOnlyArbiter_5_io_output_w_payload_data;
  assign axiOut_1_w_payload_strb = axi4WriteOnlyArbiter_5_io_output_w_payload_strb;
  assign axiOut_1_w_payload_last = axi4WriteOnlyArbiter_5_io_output_w_payload_last;
  assign axiOut_1_b_ready = axi4WriteOnlyArbiter_5_io_output_b_ready;
  assign axiOut_2_ar_valid = axi4ReadOnlyArbiter_6_io_output_ar_valid;
  assign axiOut_2_ar_payload_addr = axi4ReadOnlyArbiter_6_io_output_ar_payload_addr;
  assign axiOut_2_ar_payload_id = axi4ReadOnlyArbiter_6_io_output_ar_payload_id;
  assign axiOut_2_ar_payload_len = axi4ReadOnlyArbiter_6_io_output_ar_payload_len;
  assign axiOut_2_ar_payload_size = axi4ReadOnlyArbiter_6_io_output_ar_payload_size;
  assign axiOut_2_ar_payload_burst = axi4ReadOnlyArbiter_6_io_output_ar_payload_burst;
  assign axiOut_2_ar_payload_lock = axi4ReadOnlyArbiter_6_io_output_ar_payload_lock;
  assign axiOut_2_ar_payload_cache = axi4ReadOnlyArbiter_6_io_output_ar_payload_cache;
  assign axiOut_2_ar_payload_prot = axi4ReadOnlyArbiter_6_io_output_ar_payload_prot;
  assign axiOut_2_r_ready = axi4ReadOnlyArbiter_6_io_output_r_ready;
  assign axiOut_2_aw_valid = axi4WriteOnlyArbiter_6_io_output_aw_valid;
  assign axiOut_2_aw_payload_addr = axi4WriteOnlyArbiter_6_io_output_aw_payload_addr;
  assign axiOut_2_aw_payload_id = axi4WriteOnlyArbiter_6_io_output_aw_payload_id;
  assign axiOut_2_aw_payload_len = axi4WriteOnlyArbiter_6_io_output_aw_payload_len;
  assign axiOut_2_aw_payload_size = axi4WriteOnlyArbiter_6_io_output_aw_payload_size;
  assign axiOut_2_aw_payload_burst = axi4WriteOnlyArbiter_6_io_output_aw_payload_burst;
  assign axiOut_2_aw_payload_lock = axi4WriteOnlyArbiter_6_io_output_aw_payload_lock;
  assign axiOut_2_aw_payload_cache = axi4WriteOnlyArbiter_6_io_output_aw_payload_cache;
  assign axiOut_2_aw_payload_prot = axi4WriteOnlyArbiter_6_io_output_aw_payload_prot;
  assign axiOut_2_w_valid = axi4WriteOnlyArbiter_6_io_output_w_valid;
  assign axiOut_2_w_payload_data = axi4WriteOnlyArbiter_6_io_output_w_payload_data;
  assign axiOut_2_w_payload_strb = axi4WriteOnlyArbiter_6_io_output_w_payload_strb;
  assign axiOut_2_w_payload_last = axi4WriteOnlyArbiter_6_io_output_w_payload_last;
  assign axiOut_2_b_ready = axi4WriteOnlyArbiter_6_io_output_b_ready;
  assign axiOut_3_ar_valid = axi4ReadOnlyArbiter_7_io_output_ar_valid;
  assign axiOut_3_ar_payload_addr = axi4ReadOnlyArbiter_7_io_output_ar_payload_addr;
  assign axiOut_3_ar_payload_id = axi4ReadOnlyArbiter_7_io_output_ar_payload_id;
  assign axiOut_3_ar_payload_len = axi4ReadOnlyArbiter_7_io_output_ar_payload_len;
  assign axiOut_3_ar_payload_size = axi4ReadOnlyArbiter_7_io_output_ar_payload_size;
  assign axiOut_3_ar_payload_burst = axi4ReadOnlyArbiter_7_io_output_ar_payload_burst;
  assign axiOut_3_ar_payload_lock = axi4ReadOnlyArbiter_7_io_output_ar_payload_lock;
  assign axiOut_3_ar_payload_cache = axi4ReadOnlyArbiter_7_io_output_ar_payload_cache;
  assign axiOut_3_ar_payload_prot = axi4ReadOnlyArbiter_7_io_output_ar_payload_prot;
  assign axiOut_3_r_ready = axi4ReadOnlyArbiter_7_io_output_r_ready;
  assign axiOut_3_aw_valid = axi4WriteOnlyArbiter_7_io_output_aw_valid;
  assign axiOut_3_aw_payload_addr = axi4WriteOnlyArbiter_7_io_output_aw_payload_addr;
  assign axiOut_3_aw_payload_id = axi4WriteOnlyArbiter_7_io_output_aw_payload_id;
  assign axiOut_3_aw_payload_len = axi4WriteOnlyArbiter_7_io_output_aw_payload_len;
  assign axiOut_3_aw_payload_size = axi4WriteOnlyArbiter_7_io_output_aw_payload_size;
  assign axiOut_3_aw_payload_burst = axi4WriteOnlyArbiter_7_io_output_aw_payload_burst;
  assign axiOut_3_aw_payload_lock = axi4WriteOnlyArbiter_7_io_output_aw_payload_lock;
  assign axiOut_3_aw_payload_cache = axi4WriteOnlyArbiter_7_io_output_aw_payload_cache;
  assign axiOut_3_aw_payload_prot = axi4WriteOnlyArbiter_7_io_output_aw_payload_prot;
  assign axiOut_3_w_valid = axi4WriteOnlyArbiter_7_io_output_w_valid;
  assign axiOut_3_w_payload_data = axi4WriteOnlyArbiter_7_io_output_w_payload_data;
  assign axiOut_3_w_payload_strb = axi4WriteOnlyArbiter_7_io_output_w_payload_strb;
  assign axiOut_3_w_payload_last = axi4WriteOnlyArbiter_7_io_output_w_payload_last;
  assign axiOut_3_b_ready = axi4WriteOnlyArbiter_7_io_output_b_ready;
  assign axiIn0_readOnly_ar_valid = axiIn0_ar_valid;
  assign axiIn0_ar_ready = axiIn0_readOnly_ar_ready;
  assign axiIn0_readOnly_ar_payload_addr = axiIn0_ar_payload_addr;
  assign axiIn0_readOnly_ar_payload_id = axiIn0_ar_payload_id;
  assign axiIn0_readOnly_ar_payload_len = axiIn0_ar_payload_len;
  assign axiIn0_readOnly_ar_payload_size = axiIn0_ar_payload_size;
  assign axiIn0_readOnly_ar_payload_burst = axiIn0_ar_payload_burst;
  assign axiIn0_readOnly_ar_payload_lock = axiIn0_ar_payload_lock;
  assign axiIn0_readOnly_ar_payload_cache = axiIn0_ar_payload_cache;
  assign axiIn0_readOnly_ar_payload_prot = axiIn0_ar_payload_prot;
  assign axiIn0_r_valid = axiIn0_readOnly_r_valid;
  assign axiIn0_readOnly_r_ready = axiIn0_r_ready;
  assign axiIn0_r_payload_data = axiIn0_readOnly_r_payload_data;
  assign axiIn0_r_payload_last = axiIn0_readOnly_r_payload_last;
  assign axiIn0_r_payload_id = axiIn0_readOnly_r_payload_id;
  assign axiIn0_r_payload_resp = axiIn0_readOnly_r_payload_resp;
  assign axiIn0_writeOnly_aw_valid = axiIn0_aw_valid;
  assign axiIn0_aw_ready = axiIn0_writeOnly_aw_ready;
  assign axiIn0_writeOnly_aw_payload_addr = axiIn0_aw_payload_addr;
  assign axiIn0_writeOnly_aw_payload_id = axiIn0_aw_payload_id;
  assign axiIn0_writeOnly_aw_payload_len = axiIn0_aw_payload_len;
  assign axiIn0_writeOnly_aw_payload_size = axiIn0_aw_payload_size;
  assign axiIn0_writeOnly_aw_payload_burst = axiIn0_aw_payload_burst;
  assign axiIn0_writeOnly_aw_payload_lock = axiIn0_aw_payload_lock;
  assign axiIn0_writeOnly_aw_payload_cache = axiIn0_aw_payload_cache;
  assign axiIn0_writeOnly_aw_payload_prot = axiIn0_aw_payload_prot;
  assign axiIn0_writeOnly_w_valid = axiIn0_w_valid;
  assign axiIn0_w_ready = axiIn0_writeOnly_w_ready;
  assign axiIn0_writeOnly_w_payload_data = axiIn0_w_payload_data;
  assign axiIn0_writeOnly_w_payload_strb = axiIn0_w_payload_strb;
  assign axiIn0_writeOnly_w_payload_last = axiIn0_w_payload_last;
  assign axiIn0_b_valid = axiIn0_writeOnly_b_valid;
  assign axiIn0_writeOnly_b_ready = axiIn0_b_ready;
  assign axiIn0_b_payload_id = axiIn0_writeOnly_b_payload_id;
  assign axiIn0_b_payload_resp = axiIn0_writeOnly_b_payload_resp;
  assign axiIn1_readOnly_ar_valid = axiIn1_ar_valid;
  assign axiIn1_ar_ready = axiIn1_readOnly_ar_ready;
  assign axiIn1_readOnly_ar_payload_addr = axiIn1_ar_payload_addr;
  assign axiIn1_readOnly_ar_payload_id = axiIn1_ar_payload_id;
  assign axiIn1_readOnly_ar_payload_len = axiIn1_ar_payload_len;
  assign axiIn1_readOnly_ar_payload_size = axiIn1_ar_payload_size;
  assign axiIn1_readOnly_ar_payload_burst = axiIn1_ar_payload_burst;
  assign axiIn1_readOnly_ar_payload_lock = axiIn1_ar_payload_lock;
  assign axiIn1_readOnly_ar_payload_cache = axiIn1_ar_payload_cache;
  assign axiIn1_readOnly_ar_payload_prot = axiIn1_ar_payload_prot;
  assign axiIn1_r_valid = axiIn1_readOnly_r_valid;
  assign axiIn1_readOnly_r_ready = axiIn1_r_ready;
  assign axiIn1_r_payload_data = axiIn1_readOnly_r_payload_data;
  assign axiIn1_r_payload_last = axiIn1_readOnly_r_payload_last;
  assign axiIn1_r_payload_id = axiIn1_readOnly_r_payload_id;
  assign axiIn1_r_payload_resp = axiIn1_readOnly_r_payload_resp;
  assign axiIn1_writeOnly_aw_valid = axiIn1_aw_valid;
  assign axiIn1_aw_ready = axiIn1_writeOnly_aw_ready;
  assign axiIn1_writeOnly_aw_payload_addr = axiIn1_aw_payload_addr;
  assign axiIn1_writeOnly_aw_payload_id = axiIn1_aw_payload_id;
  assign axiIn1_writeOnly_aw_payload_len = axiIn1_aw_payload_len;
  assign axiIn1_writeOnly_aw_payload_size = axiIn1_aw_payload_size;
  assign axiIn1_writeOnly_aw_payload_burst = axiIn1_aw_payload_burst;
  assign axiIn1_writeOnly_aw_payload_lock = axiIn1_aw_payload_lock;
  assign axiIn1_writeOnly_aw_payload_cache = axiIn1_aw_payload_cache;
  assign axiIn1_writeOnly_aw_payload_prot = axiIn1_aw_payload_prot;
  assign axiIn1_writeOnly_w_valid = axiIn1_w_valid;
  assign axiIn1_w_ready = axiIn1_writeOnly_w_ready;
  assign axiIn1_writeOnly_w_payload_data = axiIn1_w_payload_data;
  assign axiIn1_writeOnly_w_payload_strb = axiIn1_w_payload_strb;
  assign axiIn1_writeOnly_w_payload_last = axiIn1_w_payload_last;
  assign axiIn1_b_valid = axiIn1_writeOnly_b_valid;
  assign axiIn1_writeOnly_b_ready = axiIn1_b_ready;
  assign axiIn1_b_payload_id = axiIn1_writeOnly_b_payload_id;
  assign axiIn1_b_payload_resp = axiIn1_writeOnly_b_payload_resp;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_fire = (toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_valid && toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_valid = toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_rValid;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_addr;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_id;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_len;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_size;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_burst;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_lock;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_cache;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot = axiIn0_readOnly_decoder_io_outputs_0_ar_payload_prot;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_ready = axi4ReadOnlyArbiter_4_io_inputs_0_ar_ready;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_fire = (toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_valid && toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_ready);
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_valid = toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_rValid;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_addr;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_id;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_len;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_size;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_burst;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_lock;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_cache;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot = axiIn0_readOnly_decoder_io_outputs_1_ar_payload_prot;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_ready = axi4ReadOnlyArbiter_5_io_inputs_0_ar_ready;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_fire = (toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_valid && toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_ready);
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_valid = toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_rValid;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_addr;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_id;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_len;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_size;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_burst;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_lock;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_cache;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot = axiIn0_readOnly_decoder_io_outputs_2_ar_payload_prot;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_ready = axi4ReadOnlyArbiter_6_io_inputs_0_ar_ready;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_fire = (toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_valid && toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_ready);
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_valid = toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_rValid;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_addr;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_id;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_len;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_size;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_burst;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_lock;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_cache;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot = axiIn0_readOnly_decoder_io_outputs_3_ar_payload_prot;
  assign toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_ready = axi4ReadOnlyArbiter_7_io_inputs_0_ar_ready;
  assign axiIn0_readOnly_ar_ready = axiIn0_readOnly_decoder_io_input_ar_ready;
  assign axiIn0_readOnly_r_valid = axiIn0_readOnly_decoder_io_input_r_valid;
  assign axiIn0_readOnly_r_payload_data = axiIn0_readOnly_decoder_io_input_r_payload_data;
  assign axiIn0_readOnly_r_payload_last = axiIn0_readOnly_decoder_io_input_r_payload_last;
  assign axiIn0_readOnly_r_payload_id = axiIn0_readOnly_decoder_io_input_r_payload_id;
  assign axiIn0_readOnly_r_payload_resp = axiIn0_readOnly_decoder_io_input_r_payload_resp;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire = (toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid = toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_rValid;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_id;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_len;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_size;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot = axiIn0_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready = axi4WriteOnlyArbiter_4_io_inputs_0_aw_ready;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_fire = (toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_valid && toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_ready);
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_valid = toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_rValid;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_addr;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_id;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_len;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_size;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_burst;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_lock;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_cache;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot = axiIn0_writeOnly_decoder_io_outputs_1_aw_payload_prot;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_ready = axi4WriteOnlyArbiter_5_io_inputs_0_aw_ready;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_fire = (toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_valid && toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_ready);
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_valid = toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_rValid;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_addr;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_id;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_len;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_size;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_burst;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_lock;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_cache;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot = axiIn0_writeOnly_decoder_io_outputs_2_aw_payload_prot;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_ready = axi4WriteOnlyArbiter_6_io_inputs_0_aw_ready;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_fire = (toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_valid && toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_ready);
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_valid = toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_rValid;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_addr;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_id;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_len;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_size;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_burst;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_lock;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_cache;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot = axiIn0_writeOnly_decoder_io_outputs_3_aw_payload_prot;
  assign toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_ready = axi4WriteOnlyArbiter_7_io_inputs_0_aw_ready;
  assign axiIn0_writeOnly_aw_ready = axiIn0_writeOnly_decoder_io_input_aw_ready;
  assign axiIn0_writeOnly_w_ready = axiIn0_writeOnly_decoder_io_input_w_ready;
  assign axiIn0_writeOnly_b_valid = axiIn0_writeOnly_decoder_io_input_b_valid;
  assign axiIn0_writeOnly_b_payload_id = axiIn0_writeOnly_decoder_io_input_b_payload_id;
  assign axiIn0_writeOnly_b_payload_resp = axiIn0_writeOnly_decoder_io_input_b_payload_resp;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_fire = (toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_valid && toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_valid = toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_rValid;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_addr;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_id;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_len;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_size;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_burst;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_lock;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_cache;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot = axiIn1_readOnly_decoder_io_outputs_0_ar_payload_prot;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_ready = axi4ReadOnlyArbiter_4_io_inputs_1_ar_ready;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_fire = (toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_valid && toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_ready);
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_valid = toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_rValid;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_addr = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_addr;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_id = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_id;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_len = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_len;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_size = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_size;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_burst = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_burst;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_lock = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_lock;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_cache = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_cache;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_payload_prot = axiIn1_readOnly_decoder_io_outputs_1_ar_payload_prot;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_ready = axi4ReadOnlyArbiter_5_io_inputs_1_ar_ready;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_fire = (toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_valid && toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_ready);
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_valid = toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_rValid;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_addr = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_addr;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_id = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_id;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_len = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_len;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_size = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_size;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_burst = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_burst;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_lock = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_lock;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_cache = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_cache;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_payload_prot = axiIn1_readOnly_decoder_io_outputs_2_ar_payload_prot;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_ready = axi4ReadOnlyArbiter_6_io_inputs_1_ar_ready;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_fire = (toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_valid && toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_ready);
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_valid = toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_rValid;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_addr = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_addr;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_id = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_id;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_len = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_len;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_size = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_size;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_burst = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_burst;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_lock = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_lock;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_cache = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_cache;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_payload_prot = axiIn1_readOnly_decoder_io_outputs_3_ar_payload_prot;
  assign toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_ready = axi4ReadOnlyArbiter_7_io_inputs_1_ar_ready;
  assign axiIn1_readOnly_ar_ready = axiIn1_readOnly_decoder_io_input_ar_ready;
  assign axiIn1_readOnly_r_valid = axiIn1_readOnly_decoder_io_input_r_valid;
  assign axiIn1_readOnly_r_payload_data = axiIn1_readOnly_decoder_io_input_r_payload_data;
  assign axiIn1_readOnly_r_payload_last = axiIn1_readOnly_decoder_io_input_r_payload_last;
  assign axiIn1_readOnly_r_payload_id = axiIn1_readOnly_decoder_io_input_r_payload_id;
  assign axiIn1_readOnly_r_payload_resp = axiIn1_readOnly_decoder_io_input_r_payload_resp;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire = (toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid = toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_rValid;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_id;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_len;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_size;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot = axiIn1_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready = axi4WriteOnlyArbiter_4_io_inputs_1_aw_ready;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_fire = (toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_valid && toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_ready);
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_valid = toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_rValid;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_addr = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_addr;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_id = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_id;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_len = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_len;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_size = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_size;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_burst = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_burst;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_lock = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_lock;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_cache = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_cache;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_payload_prot = axiIn1_writeOnly_decoder_io_outputs_1_aw_payload_prot;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_ready = axi4WriteOnlyArbiter_5_io_inputs_1_aw_ready;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_fire = (toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_valid && toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_ready);
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_valid = toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_rValid;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_addr = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_addr;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_id = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_id;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_len = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_len;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_size = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_size;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_burst = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_burst;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_lock = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_lock;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_cache = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_cache;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_payload_prot = axiIn1_writeOnly_decoder_io_outputs_2_aw_payload_prot;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_ready = axi4WriteOnlyArbiter_6_io_inputs_1_aw_ready;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_fire = (toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_valid && toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_ready);
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_valid = toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_rValid;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_addr = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_addr;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_id = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_id;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_len = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_len;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_size = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_size;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_burst = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_burst;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_lock = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_lock;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_cache = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_cache;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_payload_prot = axiIn1_writeOnly_decoder_io_outputs_3_aw_payload_prot;
  assign toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_ready = axi4WriteOnlyArbiter_7_io_inputs_1_aw_ready;
  assign axiIn1_writeOnly_aw_ready = axiIn1_writeOnly_decoder_io_input_aw_ready;
  assign axiIn1_writeOnly_w_ready = axiIn1_writeOnly_decoder_io_input_w_ready;
  assign axiIn1_writeOnly_b_valid = axiIn1_writeOnly_decoder_io_input_b_valid;
  assign axiIn1_writeOnly_b_payload_id = axiIn1_writeOnly_decoder_io_input_b_payload_id;
  assign axiIn1_writeOnly_b_payload_resp = axiIn1_writeOnly_decoder_io_input_b_payload_resp;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b0;
      toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b0;
      toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b0;
      toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b0;
      toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b0;
      toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b0;
      toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b0;
      toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b0;
      toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b0;
      toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b0;
      toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b0;
      toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b0;
    end else begin
      if(axiIn0_readOnly_decoder_io_outputs_0_ar_valid) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_validPipe_fire) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(axiIn0_readOnly_decoder_io_outputs_1_ar_valid) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_validPipe_fire) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b0;
      end
      if(axiIn0_readOnly_decoder_io_outputs_2_ar_valid) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_validPipe_fire) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b0;
      end
      if(axiIn0_readOnly_decoder_io_outputs_3_ar_valid) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_validPipe_fire) begin
        toplevel_axiIn0_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b0;
      end
      if(axiIn0_writeOnly_decoder_io_outputs_0_aw_valid) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      end
      if(axiIn0_writeOnly_decoder_io_outputs_1_aw_valid) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_validPipe_fire) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b0;
      end
      if(axiIn0_writeOnly_decoder_io_outputs_2_aw_valid) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_validPipe_fire) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b0;
      end
      if(axiIn0_writeOnly_decoder_io_outputs_3_aw_valid) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_validPipe_fire) begin
        toplevel_axiIn0_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b0;
      end
      if(axiIn1_readOnly_decoder_io_outputs_0_ar_valid) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_validPipe_fire) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(axiIn1_readOnly_decoder_io_outputs_1_ar_valid) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_validPipe_fire) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_1_ar_rValid <= 1'b0;
      end
      if(axiIn1_readOnly_decoder_io_outputs_2_ar_valid) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_validPipe_fire) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_2_ar_rValid <= 1'b0;
      end
      if(axiIn1_readOnly_decoder_io_outputs_3_ar_valid) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_validPipe_fire) begin
        toplevel_axiIn1_readOnly_decoder_io_outputs_3_ar_rValid <= 1'b0;
      end
      if(axiIn1_writeOnly_decoder_io_outputs_0_aw_valid) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      end
      if(axiIn1_writeOnly_decoder_io_outputs_1_aw_valid) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_validPipe_fire) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_1_aw_rValid <= 1'b0;
      end
      if(axiIn1_writeOnly_decoder_io_outputs_2_aw_valid) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_validPipe_fire) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_2_aw_rValid <= 1'b0;
      end
      if(axiIn1_writeOnly_decoder_io_outputs_3_aw_valid) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b1;
      end
      if(toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_validPipe_fire) begin
        toplevel_axiIn1_writeOnly_decoder_io_outputs_3_aw_rValid <= 1'b0;
      end
    end
  end


endmodule

module Axi4WriteOnlyArbiter_3 (
  input  wire          io_inputs_0_aw_valid,
  output wire          io_inputs_0_aw_ready,
  input  wire [31:0]   io_inputs_0_aw_payload_addr,
  input  wire [3:0]    io_inputs_0_aw_payload_id,
  input  wire [7:0]    io_inputs_0_aw_payload_len,
  input  wire [2:0]    io_inputs_0_aw_payload_size,
  input  wire [1:0]    io_inputs_0_aw_payload_burst,
  input  wire [0:0]    io_inputs_0_aw_payload_lock,
  input  wire [3:0]    io_inputs_0_aw_payload_cache,
  input  wire [2:0]    io_inputs_0_aw_payload_prot,
  input  wire          io_inputs_0_w_valid,
  output wire          io_inputs_0_w_ready,
  input  wire [31:0]   io_inputs_0_w_payload_data,
  input  wire [3:0]    io_inputs_0_w_payload_strb,
  input  wire          io_inputs_0_w_payload_last,
  output wire          io_inputs_0_b_valid,
  input  wire          io_inputs_0_b_ready,
  output wire [3:0]    io_inputs_0_b_payload_id,
  output wire [1:0]    io_inputs_0_b_payload_resp,
  input  wire          io_inputs_1_aw_valid,
  output wire          io_inputs_1_aw_ready,
  input  wire [31:0]   io_inputs_1_aw_payload_addr,
  input  wire [3:0]    io_inputs_1_aw_payload_id,
  input  wire [7:0]    io_inputs_1_aw_payload_len,
  input  wire [2:0]    io_inputs_1_aw_payload_size,
  input  wire [1:0]    io_inputs_1_aw_payload_burst,
  input  wire [0:0]    io_inputs_1_aw_payload_lock,
  input  wire [3:0]    io_inputs_1_aw_payload_cache,
  input  wire [2:0]    io_inputs_1_aw_payload_prot,
  input  wire          io_inputs_1_w_valid,
  output wire          io_inputs_1_w_ready,
  input  wire [31:0]   io_inputs_1_w_payload_data,
  input  wire [3:0]    io_inputs_1_w_payload_strb,
  input  wire          io_inputs_1_w_payload_last,
  output wire          io_inputs_1_b_valid,
  input  wire          io_inputs_1_b_ready,
  output wire [3:0]    io_inputs_1_b_payload_id,
  output wire [1:0]    io_inputs_1_b_payload_resp,
  output wire          io_output_aw_valid,
  input  wire          io_output_aw_ready,
  output wire [31:0]   io_output_aw_payload_addr,
  output wire [4:0]    io_output_aw_payload_id,
  output wire [7:0]    io_output_aw_payload_len,
  output wire [2:0]    io_output_aw_payload_size,
  output wire [1:0]    io_output_aw_payload_burst,
  output wire [0:0]    io_output_aw_payload_lock,
  output wire [3:0]    io_output_aw_payload_cache,
  output wire [2:0]    io_output_aw_payload_prot,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [4:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_translated_fifo_io_push_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_valid;
  wire       [0:0]    cmdRouteFork_translated_fifo_io_pop_payload;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_availability;
  reg                 _zz_io_output_w_valid;
  reg        [31:0]   _zz_io_output_w_payload_data;
  reg        [3:0]    _zz_io_output_w_payload_strb;
  reg                 _zz_io_output_w_payload_last;
  reg                 _zz_io_output_b_ready;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire       [0:0]    cmdOutputFork_payload_lock;
  wire       [3:0]    cmdOutputFork_payload_cache;
  wire       [2:0]    cmdOutputFork_payload_prot;
  wire                cmdRouteFork_valid;
  wire                cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire       [0:0]    cmdRouteFork_payload_lock;
  wire       [3:0]    cmdRouteFork_payload_cache;
  wire       [2:0]    cmdRouteFork_payload_prot;
  reg                 axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                cmdRouteFork_translated_valid;
  wire                cmdRouteFork_translated_ready;
  wire       [0:0]    cmdRouteFork_translated_payload;
  wire                io_output_w_fire;
  wire       [0:0]    writeRspIndex;
  wire                writeRspSels_0;
  wire                writeRspSels_1;

  StreamArbiter_7 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_aw_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_aw_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_aw_payload_id[3:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_aw_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_aw_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_aw_payload_burst[1:0]      ), //i
    .io_inputs_0_payload_lock  (io_inputs_0_aw_payload_lock            ), //i
    .io_inputs_0_payload_cache (io_inputs_0_aw_payload_cache[3:0]      ), //i
    .io_inputs_0_payload_prot  (io_inputs_0_aw_payload_prot[2:0]       ), //i
    .io_inputs_1_valid         (io_inputs_1_aw_valid                   ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (io_inputs_1_aw_payload_addr[31:0]      ), //i
    .io_inputs_1_payload_id    (io_inputs_1_aw_payload_id[3:0]         ), //i
    .io_inputs_1_payload_len   (io_inputs_1_aw_payload_len[7:0]        ), //i
    .io_inputs_1_payload_size  (io_inputs_1_aw_payload_size[2:0]       ), //i
    .io_inputs_1_payload_burst (io_inputs_1_aw_payload_burst[1:0]      ), //i
    .io_inputs_1_payload_lock  (io_inputs_1_aw_payload_lock            ), //i
    .io_inputs_1_payload_cache (io_inputs_1_aw_payload_cache[3:0]      ), //i
    .io_inputs_1_payload_prot  (io_inputs_1_aw_payload_prot[2:0]       ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_lock    (cmdArbiter_io_output_payload_lock      ), //o
    .io_output_payload_cache   (cmdArbiter_io_output_payload_cache[3:0]), //o
    .io_output_payload_prot    (cmdArbiter_io_output_payload_prot[2:0] ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .resetn                    (resetn                                 )  //i
  );
  StreamFifoLowLatency_3 cmdRouteFork_translated_fifo (
    .io_push_valid   (cmdRouteFork_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_translated_fifo_io_push_ready       ), //o
    .io_push_payload (cmdRouteFork_translated_payload                  ), //i
    .io_pop_valid    (cmdRouteFork_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_translated_fifo_io_pop_ready        ), //i
    .io_pop_payload  (cmdRouteFork_translated_fifo_io_pop_payload      ), //o
    .io_flush        (cmdRouteFork_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                              ), //i
    .resetn          (resetn                                           )  //i
  );
  always @(*) begin
    case(cmdRouteFork_translated_fifo_io_pop_payload)
      1'b0 : begin
        _zz_io_output_w_valid = io_inputs_0_w_valid;
        _zz_io_output_w_payload_data = io_inputs_0_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_0_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_0_w_payload_last;
      end
      default : begin
        _zz_io_output_w_valid = io_inputs_1_w_valid;
        _zz_io_output_w_payload_data = io_inputs_1_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_1_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_1_w_payload_last;
      end
    endcase
  end

  always @(*) begin
    case(writeRspIndex)
      1'b0 : _zz_io_output_b_ready = io_inputs_0_b_ready;
      default : _zz_io_output_b_ready = io_inputs_1_b_ready;
    endcase
  end

  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_aw_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdOutputFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdOutputFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdRouteFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdRouteFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_aw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_aw_payload_len = cmdOutputFork_payload_len;
  assign io_output_aw_payload_size = cmdOutputFork_payload_size;
  assign io_output_aw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_aw_payload_lock = cmdOutputFork_payload_lock;
  assign io_output_aw_payload_cache = cmdOutputFork_payload_cache;
  assign io_output_aw_payload_prot = cmdOutputFork_payload_prot;
  assign io_output_aw_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign cmdRouteFork_translated_valid = cmdRouteFork_valid;
  assign cmdRouteFork_ready = cmdRouteFork_translated_ready;
  assign cmdRouteFork_translated_payload = cmdArbiter_io_chosen;
  assign cmdRouteFork_translated_ready = cmdRouteFork_translated_fifo_io_push_ready;
  assign io_output_w_valid = (cmdRouteFork_translated_fifo_io_pop_valid && _zz_io_output_w_valid);
  assign io_output_w_payload_data = _zz_io_output_w_payload_data;
  assign io_output_w_payload_strb = _zz_io_output_w_payload_strb;
  assign io_output_w_payload_last = _zz_io_output_w_payload_last;
  assign io_inputs_0_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b0));
  assign io_inputs_1_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b1));
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeRspIndex = io_output_b_payload_id[4 : 4];
  assign writeRspSels_0 = (writeRspIndex == 1'b0);
  assign writeRspSels_1 = (writeRspIndex == 1'b1);
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_inputs_1_b_valid = (io_output_b_valid && writeRspSels_1);
  assign io_inputs_1_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_1_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_output_b_ready = _zz_io_output_b_ready;
  assign cmdRouteFork_translated_fifo_io_flush = 1'b0;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        axi4WriteOnlyArbiter_7_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

//Axi4ReadOnlyArbiter_3 replaced by Axi4ReadOnlyArbiter

module Axi4WriteOnlyArbiter_2 (
  input  wire          io_inputs_0_aw_valid,
  output wire          io_inputs_0_aw_ready,
  input  wire [31:0]   io_inputs_0_aw_payload_addr,
  input  wire [3:0]    io_inputs_0_aw_payload_id,
  input  wire [7:0]    io_inputs_0_aw_payload_len,
  input  wire [2:0]    io_inputs_0_aw_payload_size,
  input  wire [1:0]    io_inputs_0_aw_payload_burst,
  input  wire [0:0]    io_inputs_0_aw_payload_lock,
  input  wire [3:0]    io_inputs_0_aw_payload_cache,
  input  wire [2:0]    io_inputs_0_aw_payload_prot,
  input  wire          io_inputs_0_w_valid,
  output wire          io_inputs_0_w_ready,
  input  wire [31:0]   io_inputs_0_w_payload_data,
  input  wire [3:0]    io_inputs_0_w_payload_strb,
  input  wire          io_inputs_0_w_payload_last,
  output wire          io_inputs_0_b_valid,
  input  wire          io_inputs_0_b_ready,
  output wire [3:0]    io_inputs_0_b_payload_id,
  output wire [1:0]    io_inputs_0_b_payload_resp,
  input  wire          io_inputs_1_aw_valid,
  output wire          io_inputs_1_aw_ready,
  input  wire [31:0]   io_inputs_1_aw_payload_addr,
  input  wire [3:0]    io_inputs_1_aw_payload_id,
  input  wire [7:0]    io_inputs_1_aw_payload_len,
  input  wire [2:0]    io_inputs_1_aw_payload_size,
  input  wire [1:0]    io_inputs_1_aw_payload_burst,
  input  wire [0:0]    io_inputs_1_aw_payload_lock,
  input  wire [3:0]    io_inputs_1_aw_payload_cache,
  input  wire [2:0]    io_inputs_1_aw_payload_prot,
  input  wire          io_inputs_1_w_valid,
  output wire          io_inputs_1_w_ready,
  input  wire [31:0]   io_inputs_1_w_payload_data,
  input  wire [3:0]    io_inputs_1_w_payload_strb,
  input  wire          io_inputs_1_w_payload_last,
  output wire          io_inputs_1_b_valid,
  input  wire          io_inputs_1_b_ready,
  output wire [3:0]    io_inputs_1_b_payload_id,
  output wire [1:0]    io_inputs_1_b_payload_resp,
  output wire          io_output_aw_valid,
  input  wire          io_output_aw_ready,
  output wire [31:0]   io_output_aw_payload_addr,
  output wire [4:0]    io_output_aw_payload_id,
  output wire [7:0]    io_output_aw_payload_len,
  output wire [2:0]    io_output_aw_payload_size,
  output wire [1:0]    io_output_aw_payload_burst,
  output wire [0:0]    io_output_aw_payload_lock,
  output wire [3:0]    io_output_aw_payload_cache,
  output wire [2:0]    io_output_aw_payload_prot,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [4:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_translated_fifo_io_push_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_valid;
  wire       [0:0]    cmdRouteFork_translated_fifo_io_pop_payload;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_availability;
  reg                 _zz_io_output_w_valid;
  reg        [31:0]   _zz_io_output_w_payload_data;
  reg        [3:0]    _zz_io_output_w_payload_strb;
  reg                 _zz_io_output_w_payload_last;
  reg                 _zz_io_output_b_ready;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire       [0:0]    cmdOutputFork_payload_lock;
  wire       [3:0]    cmdOutputFork_payload_cache;
  wire       [2:0]    cmdOutputFork_payload_prot;
  wire                cmdRouteFork_valid;
  wire                cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire       [0:0]    cmdRouteFork_payload_lock;
  wire       [3:0]    cmdRouteFork_payload_cache;
  wire       [2:0]    cmdRouteFork_payload_prot;
  reg                 axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                cmdRouteFork_translated_valid;
  wire                cmdRouteFork_translated_ready;
  wire       [0:0]    cmdRouteFork_translated_payload;
  wire                io_output_w_fire;
  wire       [0:0]    writeRspIndex;
  wire                writeRspSels_0;
  wire                writeRspSels_1;

  StreamArbiter_7 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_aw_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_aw_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_aw_payload_id[3:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_aw_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_aw_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_aw_payload_burst[1:0]      ), //i
    .io_inputs_0_payload_lock  (io_inputs_0_aw_payload_lock            ), //i
    .io_inputs_0_payload_cache (io_inputs_0_aw_payload_cache[3:0]      ), //i
    .io_inputs_0_payload_prot  (io_inputs_0_aw_payload_prot[2:0]       ), //i
    .io_inputs_1_valid         (io_inputs_1_aw_valid                   ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (io_inputs_1_aw_payload_addr[31:0]      ), //i
    .io_inputs_1_payload_id    (io_inputs_1_aw_payload_id[3:0]         ), //i
    .io_inputs_1_payload_len   (io_inputs_1_aw_payload_len[7:0]        ), //i
    .io_inputs_1_payload_size  (io_inputs_1_aw_payload_size[2:0]       ), //i
    .io_inputs_1_payload_burst (io_inputs_1_aw_payload_burst[1:0]      ), //i
    .io_inputs_1_payload_lock  (io_inputs_1_aw_payload_lock            ), //i
    .io_inputs_1_payload_cache (io_inputs_1_aw_payload_cache[3:0]      ), //i
    .io_inputs_1_payload_prot  (io_inputs_1_aw_payload_prot[2:0]       ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_lock    (cmdArbiter_io_output_payload_lock      ), //o
    .io_output_payload_cache   (cmdArbiter_io_output_payload_cache[3:0]), //o
    .io_output_payload_prot    (cmdArbiter_io_output_payload_prot[2:0] ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .resetn                    (resetn                                 )  //i
  );
  StreamFifoLowLatency_3 cmdRouteFork_translated_fifo (
    .io_push_valid   (cmdRouteFork_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_translated_fifo_io_push_ready       ), //o
    .io_push_payload (cmdRouteFork_translated_payload                  ), //i
    .io_pop_valid    (cmdRouteFork_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_translated_fifo_io_pop_ready        ), //i
    .io_pop_payload  (cmdRouteFork_translated_fifo_io_pop_payload      ), //o
    .io_flush        (cmdRouteFork_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                              ), //i
    .resetn          (resetn                                           )  //i
  );
  always @(*) begin
    case(cmdRouteFork_translated_fifo_io_pop_payload)
      1'b0 : begin
        _zz_io_output_w_valid = io_inputs_0_w_valid;
        _zz_io_output_w_payload_data = io_inputs_0_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_0_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_0_w_payload_last;
      end
      default : begin
        _zz_io_output_w_valid = io_inputs_1_w_valid;
        _zz_io_output_w_payload_data = io_inputs_1_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_1_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_1_w_payload_last;
      end
    endcase
  end

  always @(*) begin
    case(writeRspIndex)
      1'b0 : _zz_io_output_b_ready = io_inputs_0_b_ready;
      default : _zz_io_output_b_ready = io_inputs_1_b_ready;
    endcase
  end

  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_aw_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdOutputFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdOutputFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdRouteFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdRouteFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_aw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_aw_payload_len = cmdOutputFork_payload_len;
  assign io_output_aw_payload_size = cmdOutputFork_payload_size;
  assign io_output_aw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_aw_payload_lock = cmdOutputFork_payload_lock;
  assign io_output_aw_payload_cache = cmdOutputFork_payload_cache;
  assign io_output_aw_payload_prot = cmdOutputFork_payload_prot;
  assign io_output_aw_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign cmdRouteFork_translated_valid = cmdRouteFork_valid;
  assign cmdRouteFork_ready = cmdRouteFork_translated_ready;
  assign cmdRouteFork_translated_payload = cmdArbiter_io_chosen;
  assign cmdRouteFork_translated_ready = cmdRouteFork_translated_fifo_io_push_ready;
  assign io_output_w_valid = (cmdRouteFork_translated_fifo_io_pop_valid && _zz_io_output_w_valid);
  assign io_output_w_payload_data = _zz_io_output_w_payload_data;
  assign io_output_w_payload_strb = _zz_io_output_w_payload_strb;
  assign io_output_w_payload_last = _zz_io_output_w_payload_last;
  assign io_inputs_0_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b0));
  assign io_inputs_1_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b1));
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeRspIndex = io_output_b_payload_id[4 : 4];
  assign writeRspSels_0 = (writeRspIndex == 1'b0);
  assign writeRspSels_1 = (writeRspIndex == 1'b1);
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_inputs_1_b_valid = (io_output_b_valid && writeRspSels_1);
  assign io_inputs_1_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_1_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_output_b_ready = _zz_io_output_b_ready;
  assign cmdRouteFork_translated_fifo_io_flush = 1'b0;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        axi4WriteOnlyArbiter_6_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

//Axi4ReadOnlyArbiter_2 replaced by Axi4ReadOnlyArbiter

module Axi4WriteOnlyArbiter_1 (
  input  wire          io_inputs_0_aw_valid,
  output wire          io_inputs_0_aw_ready,
  input  wire [31:0]   io_inputs_0_aw_payload_addr,
  input  wire [3:0]    io_inputs_0_aw_payload_id,
  input  wire [7:0]    io_inputs_0_aw_payload_len,
  input  wire [2:0]    io_inputs_0_aw_payload_size,
  input  wire [1:0]    io_inputs_0_aw_payload_burst,
  input  wire [0:0]    io_inputs_0_aw_payload_lock,
  input  wire [3:0]    io_inputs_0_aw_payload_cache,
  input  wire [2:0]    io_inputs_0_aw_payload_prot,
  input  wire          io_inputs_0_w_valid,
  output wire          io_inputs_0_w_ready,
  input  wire [31:0]   io_inputs_0_w_payload_data,
  input  wire [3:0]    io_inputs_0_w_payload_strb,
  input  wire          io_inputs_0_w_payload_last,
  output wire          io_inputs_0_b_valid,
  input  wire          io_inputs_0_b_ready,
  output wire [3:0]    io_inputs_0_b_payload_id,
  output wire [1:0]    io_inputs_0_b_payload_resp,
  input  wire          io_inputs_1_aw_valid,
  output wire          io_inputs_1_aw_ready,
  input  wire [31:0]   io_inputs_1_aw_payload_addr,
  input  wire [3:0]    io_inputs_1_aw_payload_id,
  input  wire [7:0]    io_inputs_1_aw_payload_len,
  input  wire [2:0]    io_inputs_1_aw_payload_size,
  input  wire [1:0]    io_inputs_1_aw_payload_burst,
  input  wire [0:0]    io_inputs_1_aw_payload_lock,
  input  wire [3:0]    io_inputs_1_aw_payload_cache,
  input  wire [2:0]    io_inputs_1_aw_payload_prot,
  input  wire          io_inputs_1_w_valid,
  output wire          io_inputs_1_w_ready,
  input  wire [31:0]   io_inputs_1_w_payload_data,
  input  wire [3:0]    io_inputs_1_w_payload_strb,
  input  wire          io_inputs_1_w_payload_last,
  output wire          io_inputs_1_b_valid,
  input  wire          io_inputs_1_b_ready,
  output wire [3:0]    io_inputs_1_b_payload_id,
  output wire [1:0]    io_inputs_1_b_payload_resp,
  output wire          io_output_aw_valid,
  input  wire          io_output_aw_ready,
  output wire [31:0]   io_output_aw_payload_addr,
  output wire [4:0]    io_output_aw_payload_id,
  output wire [7:0]    io_output_aw_payload_len,
  output wire [2:0]    io_output_aw_payload_size,
  output wire [1:0]    io_output_aw_payload_burst,
  output wire [0:0]    io_output_aw_payload_lock,
  output wire [3:0]    io_output_aw_payload_cache,
  output wire [2:0]    io_output_aw_payload_prot,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [4:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_translated_fifo_io_push_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_valid;
  wire       [0:0]    cmdRouteFork_translated_fifo_io_pop_payload;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_availability;
  reg                 _zz_io_output_w_valid;
  reg        [31:0]   _zz_io_output_w_payload_data;
  reg        [3:0]    _zz_io_output_w_payload_strb;
  reg                 _zz_io_output_w_payload_last;
  reg                 _zz_io_output_b_ready;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire       [0:0]    cmdOutputFork_payload_lock;
  wire       [3:0]    cmdOutputFork_payload_cache;
  wire       [2:0]    cmdOutputFork_payload_prot;
  wire                cmdRouteFork_valid;
  wire                cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire       [0:0]    cmdRouteFork_payload_lock;
  wire       [3:0]    cmdRouteFork_payload_cache;
  wire       [2:0]    cmdRouteFork_payload_prot;
  reg                 axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                cmdRouteFork_translated_valid;
  wire                cmdRouteFork_translated_ready;
  wire       [0:0]    cmdRouteFork_translated_payload;
  wire                io_output_w_fire;
  wire       [0:0]    writeRspIndex;
  wire                writeRspSels_0;
  wire                writeRspSels_1;

  StreamArbiter_7 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_aw_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_aw_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_aw_payload_id[3:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_aw_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_aw_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_aw_payload_burst[1:0]      ), //i
    .io_inputs_0_payload_lock  (io_inputs_0_aw_payload_lock            ), //i
    .io_inputs_0_payload_cache (io_inputs_0_aw_payload_cache[3:0]      ), //i
    .io_inputs_0_payload_prot  (io_inputs_0_aw_payload_prot[2:0]       ), //i
    .io_inputs_1_valid         (io_inputs_1_aw_valid                   ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (io_inputs_1_aw_payload_addr[31:0]      ), //i
    .io_inputs_1_payload_id    (io_inputs_1_aw_payload_id[3:0]         ), //i
    .io_inputs_1_payload_len   (io_inputs_1_aw_payload_len[7:0]        ), //i
    .io_inputs_1_payload_size  (io_inputs_1_aw_payload_size[2:0]       ), //i
    .io_inputs_1_payload_burst (io_inputs_1_aw_payload_burst[1:0]      ), //i
    .io_inputs_1_payload_lock  (io_inputs_1_aw_payload_lock            ), //i
    .io_inputs_1_payload_cache (io_inputs_1_aw_payload_cache[3:0]      ), //i
    .io_inputs_1_payload_prot  (io_inputs_1_aw_payload_prot[2:0]       ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_lock    (cmdArbiter_io_output_payload_lock      ), //o
    .io_output_payload_cache   (cmdArbiter_io_output_payload_cache[3:0]), //o
    .io_output_payload_prot    (cmdArbiter_io_output_payload_prot[2:0] ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .resetn                    (resetn                                 )  //i
  );
  StreamFifoLowLatency_3 cmdRouteFork_translated_fifo (
    .io_push_valid   (cmdRouteFork_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_translated_fifo_io_push_ready       ), //o
    .io_push_payload (cmdRouteFork_translated_payload                  ), //i
    .io_pop_valid    (cmdRouteFork_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_translated_fifo_io_pop_ready        ), //i
    .io_pop_payload  (cmdRouteFork_translated_fifo_io_pop_payload      ), //o
    .io_flush        (cmdRouteFork_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                              ), //i
    .resetn          (resetn                                           )  //i
  );
  always @(*) begin
    case(cmdRouteFork_translated_fifo_io_pop_payload)
      1'b0 : begin
        _zz_io_output_w_valid = io_inputs_0_w_valid;
        _zz_io_output_w_payload_data = io_inputs_0_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_0_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_0_w_payload_last;
      end
      default : begin
        _zz_io_output_w_valid = io_inputs_1_w_valid;
        _zz_io_output_w_payload_data = io_inputs_1_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_1_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_1_w_payload_last;
      end
    endcase
  end

  always @(*) begin
    case(writeRspIndex)
      1'b0 : _zz_io_output_b_ready = io_inputs_0_b_ready;
      default : _zz_io_output_b_ready = io_inputs_1_b_ready;
    endcase
  end

  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_aw_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdOutputFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdOutputFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdRouteFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdRouteFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_aw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_aw_payload_len = cmdOutputFork_payload_len;
  assign io_output_aw_payload_size = cmdOutputFork_payload_size;
  assign io_output_aw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_aw_payload_lock = cmdOutputFork_payload_lock;
  assign io_output_aw_payload_cache = cmdOutputFork_payload_cache;
  assign io_output_aw_payload_prot = cmdOutputFork_payload_prot;
  assign io_output_aw_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign cmdRouteFork_translated_valid = cmdRouteFork_valid;
  assign cmdRouteFork_ready = cmdRouteFork_translated_ready;
  assign cmdRouteFork_translated_payload = cmdArbiter_io_chosen;
  assign cmdRouteFork_translated_ready = cmdRouteFork_translated_fifo_io_push_ready;
  assign io_output_w_valid = (cmdRouteFork_translated_fifo_io_pop_valid && _zz_io_output_w_valid);
  assign io_output_w_payload_data = _zz_io_output_w_payload_data;
  assign io_output_w_payload_strb = _zz_io_output_w_payload_strb;
  assign io_output_w_payload_last = _zz_io_output_w_payload_last;
  assign io_inputs_0_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b0));
  assign io_inputs_1_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b1));
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeRspIndex = io_output_b_payload_id[4 : 4];
  assign writeRspSels_0 = (writeRspIndex == 1'b0);
  assign writeRspSels_1 = (writeRspIndex == 1'b1);
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_inputs_1_b_valid = (io_output_b_valid && writeRspSels_1);
  assign io_inputs_1_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_1_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_output_b_ready = _zz_io_output_b_ready;
  assign cmdRouteFork_translated_fifo_io_flush = 1'b0;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        axi4WriteOnlyArbiter_5_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

//Axi4ReadOnlyArbiter_1 replaced by Axi4ReadOnlyArbiter

module Axi4WriteOnlyArbiter (
  input  wire          io_inputs_0_aw_valid,
  output wire          io_inputs_0_aw_ready,
  input  wire [31:0]   io_inputs_0_aw_payload_addr,
  input  wire [3:0]    io_inputs_0_aw_payload_id,
  input  wire [7:0]    io_inputs_0_aw_payload_len,
  input  wire [2:0]    io_inputs_0_aw_payload_size,
  input  wire [1:0]    io_inputs_0_aw_payload_burst,
  input  wire [0:0]    io_inputs_0_aw_payload_lock,
  input  wire [3:0]    io_inputs_0_aw_payload_cache,
  input  wire [2:0]    io_inputs_0_aw_payload_prot,
  input  wire          io_inputs_0_w_valid,
  output wire          io_inputs_0_w_ready,
  input  wire [31:0]   io_inputs_0_w_payload_data,
  input  wire [3:0]    io_inputs_0_w_payload_strb,
  input  wire          io_inputs_0_w_payload_last,
  output wire          io_inputs_0_b_valid,
  input  wire          io_inputs_0_b_ready,
  output wire [3:0]    io_inputs_0_b_payload_id,
  output wire [1:0]    io_inputs_0_b_payload_resp,
  input  wire          io_inputs_1_aw_valid,
  output wire          io_inputs_1_aw_ready,
  input  wire [31:0]   io_inputs_1_aw_payload_addr,
  input  wire [3:0]    io_inputs_1_aw_payload_id,
  input  wire [7:0]    io_inputs_1_aw_payload_len,
  input  wire [2:0]    io_inputs_1_aw_payload_size,
  input  wire [1:0]    io_inputs_1_aw_payload_burst,
  input  wire [0:0]    io_inputs_1_aw_payload_lock,
  input  wire [3:0]    io_inputs_1_aw_payload_cache,
  input  wire [2:0]    io_inputs_1_aw_payload_prot,
  input  wire          io_inputs_1_w_valid,
  output wire          io_inputs_1_w_ready,
  input  wire [31:0]   io_inputs_1_w_payload_data,
  input  wire [3:0]    io_inputs_1_w_payload_strb,
  input  wire          io_inputs_1_w_payload_last,
  output wire          io_inputs_1_b_valid,
  input  wire          io_inputs_1_b_ready,
  output wire [3:0]    io_inputs_1_b_payload_id,
  output wire [1:0]    io_inputs_1_b_payload_resp,
  output wire          io_output_aw_valid,
  input  wire          io_output_aw_ready,
  output wire [31:0]   io_output_aw_payload_addr,
  output wire [4:0]    io_output_aw_payload_id,
  output wire [7:0]    io_output_aw_payload_len,
  output wire [2:0]    io_output_aw_payload_size,
  output wire [1:0]    io_output_aw_payload_burst,
  output wire [0:0]    io_output_aw_payload_lock,
  output wire [3:0]    io_output_aw_payload_cache,
  output wire [2:0]    io_output_aw_payload_prot,
  output wire          io_output_w_valid,
  input  wire          io_output_w_ready,
  output wire [31:0]   io_output_w_payload_data,
  output wire [3:0]    io_output_w_payload_strb,
  output wire          io_output_w_payload_last,
  input  wire          io_output_b_valid,
  output wire          io_output_b_ready,
  input  wire [4:0]    io_output_b_payload_id,
  input  wire [1:0]    io_output_b_payload_resp,
  input  wire          clk,
  input  wire          resetn
);

  reg                 cmdArbiter_io_output_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_ready;
  wire                cmdRouteFork_translated_fifo_io_flush;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdRouteFork_translated_fifo_io_push_ready;
  wire                cmdRouteFork_translated_fifo_io_pop_valid;
  wire       [0:0]    cmdRouteFork_translated_fifo_io_pop_payload;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_occupancy;
  wire       [2:0]    cmdRouteFork_translated_fifo_io_availability;
  reg                 _zz_io_output_w_valid;
  reg        [31:0]   _zz_io_output_w_payload_data;
  reg        [3:0]    _zz_io_output_w_payload_strb;
  reg                 _zz_io_output_w_payload_last;
  reg                 _zz_io_output_b_ready;
  wire                cmdOutputFork_valid;
  wire                cmdOutputFork_ready;
  wire       [31:0]   cmdOutputFork_payload_addr;
  wire       [3:0]    cmdOutputFork_payload_id;
  wire       [7:0]    cmdOutputFork_payload_len;
  wire       [2:0]    cmdOutputFork_payload_size;
  wire       [1:0]    cmdOutputFork_payload_burst;
  wire       [0:0]    cmdOutputFork_payload_lock;
  wire       [3:0]    cmdOutputFork_payload_cache;
  wire       [2:0]    cmdOutputFork_payload_prot;
  wire                cmdRouteFork_valid;
  wire                cmdRouteFork_ready;
  wire       [31:0]   cmdRouteFork_payload_addr;
  wire       [3:0]    cmdRouteFork_payload_id;
  wire       [7:0]    cmdRouteFork_payload_len;
  wire       [2:0]    cmdRouteFork_payload_size;
  wire       [1:0]    cmdRouteFork_payload_burst;
  wire       [0:0]    cmdRouteFork_payload_lock;
  wire       [3:0]    cmdRouteFork_payload_cache;
  wire       [2:0]    cmdRouteFork_payload_prot;
  reg                 axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_0;
  reg                 axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_1;
  wire                when_Stream_l1020;
  wire                when_Stream_l1020_1;
  wire                cmdOutputFork_fire;
  wire                cmdRouteFork_fire;
  wire                cmdRouteFork_translated_valid;
  wire                cmdRouteFork_translated_ready;
  wire       [0:0]    cmdRouteFork_translated_payload;
  wire                io_output_w_fire;
  wire       [0:0]    writeRspIndex;
  wire                writeRspSels_0;
  wire                writeRspSels_1;

  StreamArbiter_7 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_aw_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_aw_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_aw_payload_id[3:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_aw_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_aw_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_aw_payload_burst[1:0]      ), //i
    .io_inputs_0_payload_lock  (io_inputs_0_aw_payload_lock            ), //i
    .io_inputs_0_payload_cache (io_inputs_0_aw_payload_cache[3:0]      ), //i
    .io_inputs_0_payload_prot  (io_inputs_0_aw_payload_prot[2:0]       ), //i
    .io_inputs_1_valid         (io_inputs_1_aw_valid                   ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (io_inputs_1_aw_payload_addr[31:0]      ), //i
    .io_inputs_1_payload_id    (io_inputs_1_aw_payload_id[3:0]         ), //i
    .io_inputs_1_payload_len   (io_inputs_1_aw_payload_len[7:0]        ), //i
    .io_inputs_1_payload_size  (io_inputs_1_aw_payload_size[2:0]       ), //i
    .io_inputs_1_payload_burst (io_inputs_1_aw_payload_burst[1:0]      ), //i
    .io_inputs_1_payload_lock  (io_inputs_1_aw_payload_lock            ), //i
    .io_inputs_1_payload_cache (io_inputs_1_aw_payload_cache[3:0]      ), //i
    .io_inputs_1_payload_prot  (io_inputs_1_aw_payload_prot[2:0]       ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (cmdArbiter_io_output_ready             ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_lock    (cmdArbiter_io_output_payload_lock      ), //o
    .io_output_payload_cache   (cmdArbiter_io_output_payload_cache[3:0]), //o
    .io_output_payload_prot    (cmdArbiter_io_output_payload_prot[2:0] ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .resetn                    (resetn                                 )  //i
  );
  StreamFifoLowLatency_3 cmdRouteFork_translated_fifo (
    .io_push_valid   (cmdRouteFork_translated_valid                    ), //i
    .io_push_ready   (cmdRouteFork_translated_fifo_io_push_ready       ), //o
    .io_push_payload (cmdRouteFork_translated_payload                  ), //i
    .io_pop_valid    (cmdRouteFork_translated_fifo_io_pop_valid        ), //o
    .io_pop_ready    (cmdRouteFork_translated_fifo_io_pop_ready        ), //i
    .io_pop_payload  (cmdRouteFork_translated_fifo_io_pop_payload      ), //o
    .io_flush        (cmdRouteFork_translated_fifo_io_flush            ), //i
    .io_occupancy    (cmdRouteFork_translated_fifo_io_occupancy[2:0]   ), //o
    .io_availability (cmdRouteFork_translated_fifo_io_availability[2:0]), //o
    .clk             (clk                                              ), //i
    .resetn          (resetn                                           )  //i
  );
  always @(*) begin
    case(cmdRouteFork_translated_fifo_io_pop_payload)
      1'b0 : begin
        _zz_io_output_w_valid = io_inputs_0_w_valid;
        _zz_io_output_w_payload_data = io_inputs_0_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_0_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_0_w_payload_last;
      end
      default : begin
        _zz_io_output_w_valid = io_inputs_1_w_valid;
        _zz_io_output_w_payload_data = io_inputs_1_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_1_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_1_w_payload_last;
      end
    endcase
  end

  always @(*) begin
    case(writeRspIndex)
      1'b0 : _zz_io_output_b_ready = io_inputs_0_b_ready;
      default : _zz_io_output_b_ready = io_inputs_1_b_ready;
    endcase
  end

  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_aw_ready = cmdArbiter_io_inputs_1_ready;
  always @(*) begin
    cmdArbiter_io_output_ready = 1'b1;
    if(when_Stream_l1020) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
    if(when_Stream_l1020_1) begin
      cmdArbiter_io_output_ready = 1'b0;
    end
  end

  assign when_Stream_l1020 = ((! cmdOutputFork_ready) && axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign when_Stream_l1020_1 = ((! cmdRouteFork_ready) && axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdOutputFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_0);
  assign cmdOutputFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdOutputFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdOutputFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdOutputFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdOutputFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdOutputFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdOutputFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdOutputFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdOutputFork_fire = (cmdOutputFork_valid && cmdOutputFork_ready);
  assign cmdRouteFork_valid = (cmdArbiter_io_output_valid && axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_1);
  assign cmdRouteFork_payload_addr = cmdArbiter_io_output_payload_addr;
  assign cmdRouteFork_payload_id = cmdArbiter_io_output_payload_id;
  assign cmdRouteFork_payload_len = cmdArbiter_io_output_payload_len;
  assign cmdRouteFork_payload_size = cmdArbiter_io_output_payload_size;
  assign cmdRouteFork_payload_burst = cmdArbiter_io_output_payload_burst;
  assign cmdRouteFork_payload_lock = cmdArbiter_io_output_payload_lock;
  assign cmdRouteFork_payload_cache = cmdArbiter_io_output_payload_cache;
  assign cmdRouteFork_payload_prot = cmdArbiter_io_output_payload_prot;
  assign cmdRouteFork_fire = (cmdRouteFork_valid && cmdRouteFork_ready);
  assign io_output_aw_valid = cmdOutputFork_valid;
  assign cmdOutputFork_ready = io_output_aw_ready;
  assign io_output_aw_payload_addr = cmdOutputFork_payload_addr;
  assign io_output_aw_payload_len = cmdOutputFork_payload_len;
  assign io_output_aw_payload_size = cmdOutputFork_payload_size;
  assign io_output_aw_payload_burst = cmdOutputFork_payload_burst;
  assign io_output_aw_payload_lock = cmdOutputFork_payload_lock;
  assign io_output_aw_payload_cache = cmdOutputFork_payload_cache;
  assign io_output_aw_payload_prot = cmdOutputFork_payload_prot;
  assign io_output_aw_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign cmdRouteFork_translated_valid = cmdRouteFork_valid;
  assign cmdRouteFork_ready = cmdRouteFork_translated_ready;
  assign cmdRouteFork_translated_payload = cmdArbiter_io_chosen;
  assign cmdRouteFork_translated_ready = cmdRouteFork_translated_fifo_io_push_ready;
  assign io_output_w_valid = (cmdRouteFork_translated_fifo_io_pop_valid && _zz_io_output_w_valid);
  assign io_output_w_payload_data = _zz_io_output_w_payload_data;
  assign io_output_w_payload_strb = _zz_io_output_w_payload_strb;
  assign io_output_w_payload_last = _zz_io_output_w_payload_last;
  assign io_inputs_0_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b0));
  assign io_inputs_1_w_ready = ((cmdRouteFork_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdRouteFork_translated_fifo_io_pop_payload == 1'b1));
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdRouteFork_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeRspIndex = io_output_b_payload_id[4 : 4];
  assign writeRspSels_0 = (writeRspIndex == 1'b0);
  assign writeRspSels_1 = (writeRspIndex == 1'b1);
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_inputs_1_b_valid = (io_output_b_valid && writeRspSels_1);
  assign io_inputs_1_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_1_b_payload_id = io_output_b_payload_id[3 : 0];
  assign io_output_b_ready = _zz_io_output_b_ready;
  assign cmdRouteFork_translated_fifo_io_flush = 1'b0;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
      axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
    end else begin
      if(cmdOutputFork_fire) begin
        axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b0;
      end
      if(cmdRouteFork_fire) begin
        axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b0;
      end
      if(cmdArbiter_io_output_ready) begin
        axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_0 <= 1'b1;
        axi4WriteOnlyArbiter_4_cmdArbiter_io_output_fork2_logic_linkEnable_1 <= 1'b1;
      end
    end
  end


endmodule

module Axi4ReadOnlyArbiter (
  input  wire          io_inputs_0_ar_valid,
  output wire          io_inputs_0_ar_ready,
  input  wire [31:0]   io_inputs_0_ar_payload_addr,
  input  wire [3:0]    io_inputs_0_ar_payload_id,
  input  wire [7:0]    io_inputs_0_ar_payload_len,
  input  wire [2:0]    io_inputs_0_ar_payload_size,
  input  wire [1:0]    io_inputs_0_ar_payload_burst,
  input  wire [0:0]    io_inputs_0_ar_payload_lock,
  input  wire [3:0]    io_inputs_0_ar_payload_cache,
  input  wire [2:0]    io_inputs_0_ar_payload_prot,
  output wire          io_inputs_0_r_valid,
  input  wire          io_inputs_0_r_ready,
  output wire [31:0]   io_inputs_0_r_payload_data,
  output wire [3:0]    io_inputs_0_r_payload_id,
  output wire [1:0]    io_inputs_0_r_payload_resp,
  output wire          io_inputs_0_r_payload_last,
  input  wire          io_inputs_1_ar_valid,
  output wire          io_inputs_1_ar_ready,
  input  wire [31:0]   io_inputs_1_ar_payload_addr,
  input  wire [3:0]    io_inputs_1_ar_payload_id,
  input  wire [7:0]    io_inputs_1_ar_payload_len,
  input  wire [2:0]    io_inputs_1_ar_payload_size,
  input  wire [1:0]    io_inputs_1_ar_payload_burst,
  input  wire [0:0]    io_inputs_1_ar_payload_lock,
  input  wire [3:0]    io_inputs_1_ar_payload_cache,
  input  wire [2:0]    io_inputs_1_ar_payload_prot,
  output wire          io_inputs_1_r_valid,
  input  wire          io_inputs_1_r_ready,
  output wire [31:0]   io_inputs_1_r_payload_data,
  output wire [3:0]    io_inputs_1_r_payload_id,
  output wire [1:0]    io_inputs_1_r_payload_resp,
  output wire          io_inputs_1_r_payload_last,
  output wire          io_output_ar_valid,
  input  wire          io_output_ar_ready,
  output wire [31:0]   io_output_ar_payload_addr,
  output wire [4:0]    io_output_ar_payload_id,
  output wire [7:0]    io_output_ar_payload_len,
  output wire [2:0]    io_output_ar_payload_size,
  output wire [1:0]    io_output_ar_payload_burst,
  output wire [0:0]    io_output_ar_payload_lock,
  output wire [3:0]    io_output_ar_payload_cache,
  output wire [2:0]    io_output_ar_payload_prot,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [31:0]   io_output_r_payload_data,
  input  wire [4:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          clk,
  input  wire          resetn
);

  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  reg                 _zz_io_output_r_ready;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  StreamArbiter_7 cmdArbiter (
    .io_inputs_0_valid         (io_inputs_0_ar_valid                   ), //i
    .io_inputs_0_ready         (cmdArbiter_io_inputs_0_ready           ), //o
    .io_inputs_0_payload_addr  (io_inputs_0_ar_payload_addr[31:0]      ), //i
    .io_inputs_0_payload_id    (io_inputs_0_ar_payload_id[3:0]         ), //i
    .io_inputs_0_payload_len   (io_inputs_0_ar_payload_len[7:0]        ), //i
    .io_inputs_0_payload_size  (io_inputs_0_ar_payload_size[2:0]       ), //i
    .io_inputs_0_payload_burst (io_inputs_0_ar_payload_burst[1:0]      ), //i
    .io_inputs_0_payload_lock  (io_inputs_0_ar_payload_lock            ), //i
    .io_inputs_0_payload_cache (io_inputs_0_ar_payload_cache[3:0]      ), //i
    .io_inputs_0_payload_prot  (io_inputs_0_ar_payload_prot[2:0]       ), //i
    .io_inputs_1_valid         (io_inputs_1_ar_valid                   ), //i
    .io_inputs_1_ready         (cmdArbiter_io_inputs_1_ready           ), //o
    .io_inputs_1_payload_addr  (io_inputs_1_ar_payload_addr[31:0]      ), //i
    .io_inputs_1_payload_id    (io_inputs_1_ar_payload_id[3:0]         ), //i
    .io_inputs_1_payload_len   (io_inputs_1_ar_payload_len[7:0]        ), //i
    .io_inputs_1_payload_size  (io_inputs_1_ar_payload_size[2:0]       ), //i
    .io_inputs_1_payload_burst (io_inputs_1_ar_payload_burst[1:0]      ), //i
    .io_inputs_1_payload_lock  (io_inputs_1_ar_payload_lock            ), //i
    .io_inputs_1_payload_cache (io_inputs_1_ar_payload_cache[3:0]      ), //i
    .io_inputs_1_payload_prot  (io_inputs_1_ar_payload_prot[2:0]       ), //i
    .io_output_valid           (cmdArbiter_io_output_valid             ), //o
    .io_output_ready           (io_output_ar_ready                     ), //i
    .io_output_payload_addr    (cmdArbiter_io_output_payload_addr[31:0]), //o
    .io_output_payload_id      (cmdArbiter_io_output_payload_id[3:0]   ), //o
    .io_output_payload_len     (cmdArbiter_io_output_payload_len[7:0]  ), //o
    .io_output_payload_size    (cmdArbiter_io_output_payload_size[2:0] ), //o
    .io_output_payload_burst   (cmdArbiter_io_output_payload_burst[1:0]), //o
    .io_output_payload_lock    (cmdArbiter_io_output_payload_lock      ), //o
    .io_output_payload_cache   (cmdArbiter_io_output_payload_cache[3:0]), //o
    .io_output_payload_prot    (cmdArbiter_io_output_payload_prot[2:0] ), //o
    .io_chosen                 (cmdArbiter_io_chosen                   ), //o
    .io_chosenOH               (cmdArbiter_io_chosenOH[1:0]            ), //o
    .clk                       (clk                                    ), //i
    .resetn                    (resetn                                 )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : _zz_io_output_r_ready = io_inputs_0_r_ready;
      default : _zz_io_output_r_ready = io_inputs_1_r_ready;
    endcase
  end

  assign io_inputs_0_ar_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_ar_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_ar_valid = cmdArbiter_io_output_valid;
  assign io_output_ar_payload_addr = cmdArbiter_io_output_payload_addr;
  assign io_output_ar_payload_len = cmdArbiter_io_output_payload_len;
  assign io_output_ar_payload_size = cmdArbiter_io_output_payload_size;
  assign io_output_ar_payload_burst = cmdArbiter_io_output_payload_burst;
  assign io_output_ar_payload_lock = cmdArbiter_io_output_payload_lock;
  assign io_output_ar_payload_cache = cmdArbiter_io_output_payload_cache;
  assign io_output_ar_payload_prot = cmdArbiter_io_output_payload_prot;
  assign io_output_ar_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign readRspIndex = io_output_r_payload_id[4 : 4];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_inputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_inputs_0_r_payload_data = io_output_r_payload_data;
  assign io_inputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_0_r_payload_last = io_output_r_payload_last;
  assign io_inputs_0_r_payload_id = io_output_r_payload_id[3 : 0];
  assign io_inputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_inputs_1_r_payload_data = io_output_r_payload_data;
  assign io_inputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_1_r_payload_last = io_output_r_payload_last;
  assign io_inputs_1_r_payload_id = io_output_r_payload_id[3 : 0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

//Axi4WriteOnlyDecoder_1 replaced by Axi4WriteOnlyDecoder

//Axi4ReadOnlyDecoder_1 replaced by Axi4ReadOnlyDecoder

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
  Axi4WriteOnlyErrorSlave_1 errorSlave (
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
  Axi4ReadOnlyErrorSlave_1 errorSlave (
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

//StreamFifoLowLatency replaced by StreamFifoLowLatency_3

//StreamArbiter replaced by StreamArbiter_7

//StreamArbiter_1 replaced by StreamArbiter_7

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_3

//StreamArbiter_2 replaced by StreamArbiter_7

//StreamArbiter_3 replaced by StreamArbiter_7

//StreamFifoLowLatency_2 replaced by StreamFifoLowLatency_3

//StreamArbiter_4 replaced by StreamArbiter_7

//StreamArbiter_5 replaced by StreamArbiter_7

module StreamFifoLowLatency_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [0:0]    io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [0:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          resetn
);

  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [0:0]    fifo_io_pop_payload;
  wire       [2:0]    fifo_io_occupancy;
  wire       [2:0]    fifo_io_availability;

  StreamFifo_3 fifo (
    .io_push_valid   (io_push_valid            ), //i
    .io_push_ready   (fifo_io_push_ready       ), //o
    .io_push_payload (io_push_payload          ), //i
    .io_pop_valid    (fifo_io_pop_valid        ), //o
    .io_pop_ready    (io_pop_ready             ), //i
    .io_pop_payload  (fifo_io_pop_payload      ), //o
    .io_flush        (io_flush                 ), //i
    .io_occupancy    (fifo_io_occupancy[2:0]   ), //o
    .io_availability (fifo_io_availability[2:0]), //o
    .clk             (clk                      ), //i
    .resetn          (resetn                   )  //i
  );
  assign io_push_ready = fifo_io_push_ready;
  assign io_pop_valid = fifo_io_pop_valid;
  assign io_pop_payload = fifo_io_pop_payload;
  assign io_occupancy = fifo_io_occupancy;
  assign io_availability = fifo_io_availability;

endmodule

//StreamArbiter_6 replaced by StreamArbiter_7

module StreamArbiter_7 (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_addr,
  input  wire [3:0]    io_inputs_0_payload_id,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire [0:0]    io_inputs_0_payload_lock,
  input  wire [3:0]    io_inputs_0_payload_cache,
  input  wire [2:0]    io_inputs_0_payload_prot,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [31:0]   io_inputs_1_payload_addr,
  input  wire [3:0]    io_inputs_1_payload_id,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire [0:0]    io_inputs_1_payload_lock,
  input  wire [3:0]    io_inputs_1_payload_cache,
  input  wire [2:0]    io_inputs_1_payload_prot,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_addr,
  output wire [3:0]    io_output_payload_id,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire [0:0]    io_output_payload_lock,
  output wire [3:0]    io_output_payload_cache,
  output wire [2:0]    io_output_payload_prot,
  output wire [0:0]    io_chosen,
  output wire [1:0]    io_chosenOH,
  input  wire          clk,
  input  wire          resetn
);

  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_lock = (maskRouted_0 ? io_inputs_0_payload_lock : io_inputs_1_payload_lock);
  assign io_output_payload_cache = (maskRouted_0 ? io_inputs_0_payload_cache : io_inputs_1_payload_cache);
  assign io_output_payload_prot = (maskRouted_0 ? io_inputs_0_payload_prot : io_inputs_1_payload_prot);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

//Axi4WriteOnlyErrorSlave replaced by Axi4WriteOnlyErrorSlave_1

//Axi4ReadOnlyErrorSlave replaced by Axi4ReadOnlyErrorSlave_1

module Axi4WriteOnlyErrorSlave_1 (
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

module Axi4ReadOnlyErrorSlave_1 (
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

//StreamFifo replaced by StreamFifo_3

//StreamFifo_1 replaced by StreamFifo_3

//StreamFifo_2 replaced by StreamFifo_3

module StreamFifo_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [0:0]    io_push_payload,
  output reg           io_pop_valid,
  input  wire          io_pop_ready,
  output reg  [0:0]    io_pop_payload,
  input  wire          io_flush,
  output wire [2:0]    io_occupancy,
  output wire [2:0]    io_availability,
  input  wire          clk,
  input  wire          resetn
);

  wire       [0:0]    _zz_logic_ram_port1;
  wire       [0:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  reg                 logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [2:0]    logic_ptr_push;
  reg        [2:0]    logic_ptr_pop;
  wire       [2:0]    logic_ptr_occupancy;
  wire       [2:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1205;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [1:0]    logic_push_onRam_write_payload_address;
  wire       [0:0]    logic_push_onRam_write_payload_data;
  wire                logic_pop_addressGen_valid;
  wire                logic_pop_addressGen_ready;
  wire       [1:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire       [0:0]    logic_pop_async_readed;
  wire                logic_pop_addressGen_translated_valid;
  wire                logic_pop_addressGen_translated_ready;
  wire       [0:0]    logic_pop_addressGen_translated_payload;
  (* ram_style = "distributed" *) reg [0:0] logic_ram [0:3];

  assign _zz_logic_ram_port = logic_push_onRam_write_payload_data;
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  assign _zz_logic_ram_port1 = logic_ram[logic_pop_addressGen_payload];
  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1205 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 3'b100) == 3'b000);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  always @(*) begin
    logic_ptr_doPush = io_push_fire;
    if(logic_ptr_empty) begin
      if(io_pop_ready) begin
        logic_ptr_doPush = 1'b0;
      end
    end
  end

  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[1:0];
  assign logic_push_onRam_write_payload_data = io_push_payload;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[1:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  assign logic_pop_async_readed = _zz_logic_ram_port1;
  assign logic_pop_addressGen_translated_valid = logic_pop_addressGen_valid;
  assign logic_pop_addressGen_ready = logic_pop_addressGen_translated_ready;
  assign logic_pop_addressGen_translated_payload = logic_pop_async_readed;
  always @(*) begin
    io_pop_valid = logic_pop_addressGen_translated_valid;
    if(logic_ptr_empty) begin
      io_pop_valid = io_push_valid;
    end
  end

  assign logic_pop_addressGen_translated_ready = io_pop_ready;
  always @(*) begin
    io_pop_payload = logic_pop_addressGen_translated_payload;
    if(logic_ptr_empty) begin
      io_pop_payload = io_push_payload;
    end
  end

  assign logic_ptr_popOnIo = logic_ptr_pop;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (3'b100 - logic_ptr_occupancy);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      logic_ptr_push <= 3'b000;
      logic_ptr_pop <= 3'b000;
      logic_ptr_wentUp <= 1'b0;
    end else begin
      if(when_Stream_l1205) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 3'b001);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 3'b001);
      end
      if(io_flush) begin
        logic_ptr_push <= 3'b000;
        logic_ptr_pop <= 3'b000;
      end
    end
  end


endmodule
