module fifo #(
    parameter D_WIDTH = 4,
    parameter FIFO_DEPTH =16
) (
    input clk,
    input rst_n,
    input push,
    input pop,
    input [D_WIDTH-1 :0] din,
    output [D_WIDTH-1 :0] dout,
    output fifo_empty,
    output fifo_full
);

    reg [D_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
    reg [$clog2(FIFO_DEPTH):0] fifo_wr_ptr;
    reg [$clog2(FIFO_DEPTH):0] fifo_rd_ptr;
    
    integer i;
    
    always @(posedge clk)begin
        if(!rst_n)begin
            fifo_rd_ptr <= 0;
            fifo_wr_ptr <= 0;
            for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
                fifo_mem[i] <= {D_WIDTH{1'b0}};
            end
        end
        else if(pop & !fifo_empty)begin
            //dout <= fifo_mem[fifo_rd_ptr[$clog2(FIFO_DEPTH) -1 :0]];
            fifo_rd_ptr <= fifo_rd_ptr + 1;
        end
        else if(push & !fifo_full)begin
            fifo_mem[fifo_wr_ptr[$clog2(FIFO_DEPTH) -1 :0]] <= din;
            fifo_wr_ptr <= fifo_wr_ptr + 1;
        end
    end

    assign fifo_empty = fifo_wr_ptr == fifo_rd_ptr;
    assign fifo_full  = (fifo_wr_ptr[$clog2(FIFO_DEPTH) -1 :0] == fifo_rd_ptr[$clog2(FIFO_DEPTH) -1 :0]) ?
                                 fifo_wr_ptr[$clog2(FIFO_DEPTH)] ^ fifo_rd_ptr[$clog2(FIFO_DEPTH)] :1'b0;
    assign dout = (pop & !fifo_empty) ? fifo_mem[fifo_rd_ptr[$clog2(FIFO_DEPTH)-1:0]] : 0;


endmodule