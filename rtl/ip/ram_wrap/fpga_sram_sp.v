module fpga_sram_sp #(
    parameter AW = 16,
    parameter Init_File = "none"
)
(
    input  wire          CLK,
    input  wire [AW-1:0] ADDR,
    input  wire [31:0]   WDATA,
    input  wire [3:0]    WREN,
    input  wire          CS,
    output wire [31:0]   RDATA
);

    localparam AWT = ((1<<(AW-0))-1);
    localparam V_STYLE = "block";
    localparam P_STYLE =    (V_STYLE == "ultra")        ? "uram" :
                            (V_STYLE == "distributed")  ? "select_ram" :
                            "block_ram";

    (*ram_style = V_STYLE*)reg [31:0] BRAM [AWT:0]/*synthesis syn_ramstyle=P_STYLE*/;

    initial begin
        if(Init_File != "none") begin
            $readmemb(Init_File,BRAM);
        end
    end
    
    reg     [AW-1:0]  addr_q1;
    wire    [3:0]     write_enable;

    assign write_enable[3:0] = WREN[3:0] & {4{CS}};


    always@(posedge CLK) begin
		if(write_enable[0]) BRAM[ADDR][7:0] <= WDATA[7:0];
    end
    always@(posedge CLK) begin
		if(write_enable[1]) BRAM[ADDR][15:8] <= WDATA[15:8];
    end
    always@(posedge CLK) begin
		if(write_enable[2]) BRAM[ADDR][23:16] <= WDATA[23:16];
    end
    always@(posedge CLK) begin
		if(write_enable[3]) BRAM[ADDR][31:24] <= WDATA[31:24];
    end

    always @ (posedge CLK) begin
		if(CS && !(|WREN))
        	addr_q1 <= ADDR[AW-1:0];
    end

    assign RDATA  = BRAM[addr_q1];

endmodule
