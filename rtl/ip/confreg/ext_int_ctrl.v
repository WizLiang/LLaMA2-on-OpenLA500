module ext_int_ctrl (
    input  wire        sys_clk,
    input  wire        sys_resetn,
    input  wire        cpu_clk,
    input  wire        cpu_resetn,
    input  wire [31:0] int_en,
    input  wire [31:0] int_edge,
    input  wire [31:0] int_pol,
    input  wire [31:0] int_in,
    input  wire [31:0] int_clr,
    output wire [31:0] int_state,
    output wire        int_out
);

reg [31:0] prev_in;
reg [31:0] state;

always@(posedge sys_clk)begin
    if(!sys_resetn)begin
        prev_in <= 'b0;
    end
    else begin
        prev_in <= int_in;
    end
end

genvar i;
generate
  for (i = 0; i < 32; i = i + 1) begin: int_loop
    always @(posedge sys_clk) begin
      if (!sys_resetn)
        state[i] <= 1'b0;
      else if (int_en[i]) begin
        if (int_edge[i]) begin
          if ((int_pol[i] && ~prev_in[i] && int_in[i]) ||
              (~int_pol[i] && prev_in[i] && ~int_in[i]))
            state[i] <= 1'b1;
          else if (int_clr[i])
            state[i] <= 1'b0;
        end else begin
          if ((int_pol[i] && int_in[i]) ||
              (~int_pol[i] && ~int_in[i]))
            state[i] <= 1'b1;
          else
            state[i] <= 1'b0;
        end
      end else begin
        state[i] <= 1'b0;
      end
    end
  end
endgenerate

//int_out = |state，同步到 cpu_clk 域（2-flop sync）
reg int_out_sys;
reg sync1, sync2;

always @(posedge sys_clk)begin
    if(sys_resetn) int_out_sys <= 'b0;
    else  int_out_sys <= |state;
end

always @(posedge cpu_clk) begin
    if(cpu_resetn)begin
        sync1 <= 'b0;
        sync2 <= 'b0;
    end else begin
        sync1 <= int_out_sys;
        sync2 <= sync1;
    end
end

assign int_state = state;
assign int_out   = |state;

endmodule