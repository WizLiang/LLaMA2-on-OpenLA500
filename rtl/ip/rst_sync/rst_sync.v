module rst_sync(
	input clk,
	input rst_n_in,
	output rst_n_out
);

	reg [1:0] delay;
	always @(posedge clk or negedge rst_n_in) begin
		if(~rst_n_in) begin
			delay <= 2'b00;
		end
		else begin
			delay <= {delay[0],1'b1};
		end
	end
	assign rst_n_out = delay[1];
 
endmodule