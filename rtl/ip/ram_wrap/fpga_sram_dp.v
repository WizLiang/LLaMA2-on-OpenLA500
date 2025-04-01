module fpga_sram_dp #(
    parameter AW = 16,
    parameter Init_File = "none"
)
(
    input  wire          CLK,

    input  wire [AW-1:0] ram_raddr,
    output wire [31  :0] ram_rdata,
    input  wire          ram_ren  ,

    input  wire [AW-1:0] ram_waddr,
    input  wire [31  :0] ram_wdata,
    input  wire [3   :0] ram_wen
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

    always@(posedge CLK) begin
		  if(ram_wen[0]) BRAM[ram_waddr][7:0] <= ram_wdata[7:0];
    end
    always@(posedge CLK) begin
		  if(ram_wen[1]) BRAM[ram_waddr][15:8] <= ram_wdata[15:8];
    end
    always@(posedge CLK) begin
		  if(ram_wen[2]) BRAM[ram_waddr][23:16] <= ram_wdata[23:16];
    end
    always@(posedge CLK) begin
		  if(ram_wen[3]) BRAM[ram_waddr][31:24] <= ram_wdata[31:24];
    end

    always @ (posedge CLK) begin
      if(ram_ren)
            addr_q1 <= ram_raddr;
    end

    assign ram_rdata  = BRAM[addr_q1];

endmodule
