// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// ----------------------------
// AXI to SRAM Adapter
// ----------------------------
// Author: Florian Zaruba (zarubaf@iis.ee.ethz.ch)
//
// Description: Manages AXI transactions
//              Supports all burst accesses but only on aligned addresses and with full data width.
//              Assertions should guide you if there is something unsupported happening.
//
module axi2sram_sp #(
    parameter AXI_ID_WIDTH      = 5,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_DATA_WIDTH    = 32
)(
    input                         clk,
    input                         resetn,

    input     [AXI_ADDR_WIDTH-1:0] s_araddr ,
    input     [1               :0] s_arburst,
    input     [3               :0] s_arcache,
    input     [AXI_ID_WIDTH-1  :0] s_arid   ,
    input     [3               :0] s_arlen  ,
    input     [1               :0] s_arlock ,
    input     [2               :0] s_arprot ,
    output reg                        s_arready,
    input     [2               :0] s_arsize ,
    input                          s_arvalid,
    input     [AXI_ADDR_WIDTH-1:0] s_awaddr ,
    input     [1               :0] s_awburst,
    input     [3               :0] s_awcache,
    input     [AXI_ID_WIDTH    :0] s_awid   ,
    input     [3               :0] s_awlen  ,
    input     [1               :0] s_awlock ,
    input     [2               :0] s_awprot ,
    output reg                        s_awready,
    input     [2               :0] s_awsize ,
    input                          s_awvalid,
    output reg   [AXI_ID_WIDTH-1  :0] s_bid    ,
    input                          s_bready ,
    output reg   [1               :0] s_bresp  ,
    output reg                        s_bvalid ,
    output reg   [AXI_DATA_WIDTH-1:0] s_rdata  ,
    output reg   [AXI_ID_WIDTH    :0] s_rid    ,
    output reg                        s_rlast  ,
    input                          s_rready ,
    output reg   [1               :0] s_rresp  ,
    output reg                        s_rvalid ,
    input     [AXI_DATA_WIDTH-1:0] s_wdata  ,
    input                          s_wlast  ,
    output reg                        s_wready ,
    input     [AXI_DATA_WIDTH/8-1:0] s_wstrb  ,
    input                          s_wvalid ,

    output  reg                       req_o,
    output  reg                       we_o,
    output  reg [AXI_ADDR_WIDTH-1:0]   addr_o,
    output  reg [AXI_DATA_WIDTH/8-1:0] be_o,
    output  reg [AXI_DATA_WIDTH-1:0]   data_o,
    input   [AXI_DATA_WIDTH-1:0]   data_i
);
    // AXI has the following rules governing the use of bursts:
    // - for wrapping bursts, the burst length must be 2, 4, 8, or 16
    // - a burst must not cross a 4KB address boundary
    // - early termination of bursts is not supported.

    localparam LOG_NR_BYTES = $clog2(AXI_DATA_WIDTH/8);

    reg [AXI_ID_WIDTH-1:0]   ax_req_d_id;
    reg [AXI_ADDR_WIDTH-1:0] ax_req_d_addr;
    reg [7:0]                ax_req_d_len;
    reg [2:0]                ax_req_d_size;
    reg [1:0]                ax_req_d_burst;

    reg [AXI_ID_WIDTH-1:0]   ax_req_q_id;
    reg [AXI_ADDR_WIDTH-1:0] ax_req_q_addr;
    reg [7:0]                ax_req_q_len;
    reg [2:0]                ax_req_q_size;
    reg [1:0]                ax_req_q_burst;

    reg [2:0]                state_d;
    reg [2:0]                state_q;

    localparam              IDLE        = 3'h0;
    localparam              READ        = 3'h1;
    localparam              WRITE       = 3'h2;
    localparam              SEND_B      = 3'h3;
    localparam              WAIT_WVALID = 3'h4;

    localparam              FIXED       = 2'b00;
    localparam              INCR        = 2'b01;
    localparam              WRAP        = 2'b10;
    
    reg [AXI_ADDR_WIDTH-1:0] req_addr_d, req_addr_q;
    reg [7:0]                cnt_d, cnt_q;

    function automatic [AXI_ADDR_WIDTH-1:0] get_wrap_boundary;
        input [AXI_ADDR_WIDTH-1:0] unaligned_address;
        input [7:0] len;
    begin
        get_wrap_boundary = 'h0;
        //  for wrapping transfers ax_len can only be of size 1, 3, 7 or 15
        if (len == 4'b1)
            get_wrap_boundary[AXI_ADDR_WIDTH-1:1+LOG_NR_BYTES] = unaligned_address[AXI_ADDR_WIDTH-1:1+LOG_NR_BYTES];
        else if (len == 4'b11)
            get_wrap_boundary[AXI_ADDR_WIDTH-1:2+LOG_NR_BYTES] = unaligned_address[AXI_ADDR_WIDTH-1:2+LOG_NR_BYTES];
        else if (len == 4'b111)
            get_wrap_boundary[AXI_ADDR_WIDTH-1:3+LOG_NR_BYTES] = unaligned_address[AXI_ADDR_WIDTH-3:2+LOG_NR_BYTES];
        else if (len == 4'b1111)
            get_wrap_boundary[AXI_ADDR_WIDTH-1:4+LOG_NR_BYTES] = unaligned_address[AXI_ADDR_WIDTH-3:4+LOG_NR_BYTES];
    end
    endfunction

    reg [AXI_ADDR_WIDTH-1:0] aligned_address;
    reg [AXI_ADDR_WIDTH-1:0] wrap_boundary;
    reg [AXI_ADDR_WIDTH-1:0] upper_wrap_boundary;
    reg [AXI_ADDR_WIDTH-1:0] cons_addr;

    always @ (*) begin
        // address generation
        aligned_address = {ax_req_q_addr[AXI_ADDR_WIDTH-1:LOG_NR_BYTES], {{LOG_NR_BYTES}{1'b0}}};
        wrap_boundary = get_wrap_boundary(ax_req_q_addr, ax_req_q_len);
        // this will overflow
        upper_wrap_boundary = wrap_boundary + ((ax_req_q_len + 1) << LOG_NR_BYTES);
        // calculate consecutive address
        cons_addr = aligned_address + (cnt_q << LOG_NR_BYTES);

        // Transaction attributes
        // default assignments
        state_d         = state_q;
        ax_req_d_id     = ax_req_q_id;
        ax_req_d_addr   = ax_req_q_addr;
        ax_req_d_len    = ax_req_q_len;
        ax_req_d_size   = ax_req_q_size;
        ax_req_d_burst  = ax_req_q_burst;
        req_addr_d      = req_addr_q;
        cnt_d           = cnt_q;
        // Memory default assignments
        data_o = s_wdata;
        be_o   = s_wstrb;
        we_o   = 1'b0;
        req_o  = 1'b0;
        addr_o = 'h0;
        // AXI assignments
        // request
        s_awready = 1'b0;
        s_arready = 1'b0;
        // read response channel
        s_rvalid  = 1'b0;
        s_rdata   = data_i;
        s_rresp   = 'h0;
        s_rlast   = 'h0;
        s_rid     = ax_req_q_id;
        // slave write data channel
        s_wready  = 1'b0;
        // write response channel
        s_bvalid  = 1'b0;
        s_bresp   = 1'b0;
        s_bid     = 1'b0;

        case (state_q)

            IDLE: begin
                // Wait for a read or write
                // ------------
                // Read
                // ------------
                if (s_arvalid) begin
                    s_arready = 1'b1;
                    // sample ax
                    ax_req_d_id     = s_arid;
                    ax_req_d_addr   = s_araddr;
                    ax_req_d_len    = s_arlen;
                    ax_req_d_size   = s_arsize;
                    ax_req_d_burst  = s_arburst;
                    state_d        = READ;
                    //  we can request the first address, this saves us time
                    req_o          = 1'b1;
                    addr_o         = s_araddr;
                    // save the address
                    req_addr_d     = s_araddr;
                    // save the ar_len
                    cnt_d          = 1;
                // ------------
                // Write
                // ------------
                end else if (s_awvalid) begin
                    s_awready = 1'b1;
                    s_wready  = 1'b1;
                    addr_o         = s_awaddr;
                    // sample ax
                    ax_req_d_id     = s_awid;
                    ax_req_d_addr   = s_awaddr;
                    ax_req_d_len    = s_awlen;
                    ax_req_d_size   = s_awsize;
                    ax_req_d_burst  = s_awburst;
                    // we've got our first w_valid so start the write process
                    if (s_wvalid) begin
                        req_o          = 1'b1;
                        we_o           = 1'b1;
                        state_d        = (s_wlast) ? SEND_B : WRITE;
                        cnt_d          = 1;
                    // we still have to wait for the first w_valid to arrive
                    end else
                        state_d = WAIT_WVALID;
                end
            end

            // ~> we are still missing a w_valid
            WAIT_WVALID: begin
                s_wready = 1'b1;
                addr_o = ax_req_q_addr;
                // we can now make our first request
                if (s_wvalid) begin
                    req_o          = 1'b1;
                    we_o           = 1'b1;
                    state_d        = (s_wlast) ? SEND_B : WRITE;
                    cnt_d          = 1;
                end
            end

            READ: begin
                // keep request to memory high
                req_o  = 1'b1;
                addr_o = req_addr_q;
                // send the response
                s_rvalid = 1'b1;
                s_rdata  = data_i;
                s_rid    = ax_req_q_id;
                s_rlast  = (cnt_q == ax_req_q_len + 1);

                // check that the master is ready, the slave must not wait on this
                if (s_rready) begin
                    // ----------------------------
                    // Next address generation
                    // ----------------------------
                    // handle the correct burst type
                    case (ax_req_q_burst)
                        FIXED, INCR: addr_o = cons_addr;
                        WRAP:  begin
                            // check if the address reached warp boundary
                            if (cons_addr == upper_wrap_boundary) begin
                                addr_o = wrap_boundary;
                            // address warped beyond boundary
                            end else if (cons_addr > upper_wrap_boundary) begin
                                addr_o = ax_req_q_addr + ((cnt_q - ax_req_q_len) << LOG_NR_BYTES);
                            // we are still in the incremental regime
                            end else begin
                                addr_o = cons_addr;
                            end
                        end
                    endcase
                    // we need to change the address here for the upcoming request
                    // we sent the last byte -> go back to idle
                    if (s_rlast) begin
                        state_d = IDLE;
                        // we already got everything
                        req_o = 1'b0;
                    end
                    // save the request address for the next cycle
                    req_addr_d = addr_o;
                    // we can decrease the counter as the master has consumed the read data
                    cnt_d = cnt_q + 1;
                    // TODO: configure correct byte-lane
                end
            end
            // ~> we already wrote the first word here
            WRITE: begin

                s_wready = 1'b1;

                // consume a word here
                if (s_wvalid) begin
                    req_o         = 1'b1;
                    we_o          = 1'b1;
                    // ----------------------------
                    // Next address generation
                    // ----------------------------
                    // handle the correct burst type
                    case (ax_req_q_burst)

                        FIXED, INCR: addr_o = cons_addr;
                        WRAP:  begin
                            // check if the address reached warp boundary
                            if (cons_addr == upper_wrap_boundary) begin
                                addr_o = wrap_boundary;
                            // address warped beyond boundary
                            end else if (cons_addr > upper_wrap_boundary) begin
                                addr_o = ax_req_q_addr + ((cnt_q - ax_req_q_len) << LOG_NR_BYTES);
                            // we are still in the incremental regime
                            end else begin
                                addr_o = cons_addr;
                            end
                        end
                    endcase
                    // save the request address for the next cycle
                    req_addr_d = addr_o;
                    // we can decrease the counter as the master has consumed the read data
                    cnt_d = cnt_q + 1;

                    if (s_wlast)
                        state_d = SEND_B;
                end
            end
            // ~> send a write acknowledge back
            SEND_B: begin
                s_bvalid = 1'b1;
                s_bid    = ax_req_q_id;
                if (s_bready)
                    state_d = IDLE;
            end

        endcase
    end

    // --------------
    // Registers
    // --------------
    always @(posedge clk or negedge resetn) begin
        if (~resetn) begin
            state_q         <= IDLE;
            ax_req_q_addr   <= 32'h0;
            ax_req_q_burst  <= 2'h0;
            ax_req_q_id     <= 'h0;
            ax_req_q_len    <= 8'h0;
            ax_req_q_size   <= 3'h0;
            req_addr_q      <= 'h0;
            cnt_q           <= 8'h0;
        end else begin
            state_q         <= state_d;
            ax_req_q_addr   <= ax_req_d_addr;
            ax_req_q_burst  <= ax_req_d_burst;
            ax_req_q_id     <= ax_req_d_id;
            ax_req_q_len    <= ax_req_d_len;
            ax_req_q_size   <= ax_req_d_size;
            req_addr_q      <= req_addr_d;
            cnt_q           <= cnt_d;
        end
    end
endmodule

