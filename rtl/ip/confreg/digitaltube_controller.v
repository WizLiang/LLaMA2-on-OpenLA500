module digitaltube_controller(
    // 输入配置寄存器 默认 32 位
    // [1:0] 控制右边的数码管 ：00：灭 01：仅显示数字 10：显示数字和小数点
    // [3:2] 控制左边数码管
    input wire [31:0] control_reg,
    
    // 数据寄存器 [15:0]
    // 0x0000_000X [3:0] 对应第一个灯的显示
    // 0x0000_00X0 [7:4] 对应第二个灯的显示
    inout wire [31:0] data_reg,
    
    input wire clk,
    input wire rst_n,
    
    output wire [7:0] dpy0, // dpy0
    output wire [7:0] dpy1  // dpy1
);
    
    // 内部寄存器定义
    reg [7:0] dpy0_reg; 
    reg [7:0] dpy1_reg; 
    
    assign dpy0 = dpy0_reg;
    assign dpy1 = dpy1_reg;
    
    reg [3:0] dpy0_data; // dpy0 显示内容（4 位，0-F）
    reg [3:0] dpy1_data; // dpy1 显示内容（4 位，0-F）
    
    // 数码管段码存储
    reg [6:0] seg_code [0:15]; // 存储 0-F 的编码

    // 初始化数码管段码
    initial begin
        seg_code[0] = 7'b1000000; // 0
        seg_code[1] = 7'b1110110; // 1
        seg_code[2] = 7'b0100001; // 2
        seg_code[3] = 7'b0100100; // 3
        seg_code[4] = 7'b0010110; // 4
        seg_code[5] = 7'b0001100; // 5
        seg_code[6] = 7'b0001000; // 6
        seg_code[7] = 7'b1100110; // 7
        seg_code[8] = 7'b0000000; // 8
        seg_code[9] = 7'b0000110; // 9
        seg_code[10] = 7'b0000010; // A
        seg_code[11] = 7'b0011000; // B
        seg_code[12] = 7'b1001001; // C
        seg_code[13] = 7'b0110000; // D
        seg_code[14] = 7'b0001001; // E
        seg_code[15] = 7'b0001011; // F
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dpy0_reg <= 8'b0000_0000;
        end
        else begin
            // 解析数据寄存器中的显示内容
            dpy0_data <= data_reg[3:0];  // dpy0 显示的内容
            
            // 根据 control_reg 控制显示
            case (control_reg[1:0])
                2'b01: begin
                    dpy0_reg <= {~seg_code[dpy0_data], 1'b0}; // 显示 dpy0
                end
                2'b10: begin
                    dpy0_reg <= {~seg_code[dpy0_data], 1'b1}; // 显示 dpy0和小数点
                end
                default: begin
                    dpy0_reg <= 8'b0000_0000;
                end
            endcase    
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dpy1_reg <= 8'b0000_0000;
        end
        else begin
            // 解析数据寄存器中的显示内容
            dpy1_data <= data_reg[7:4];  // dpy0 显示的内容
            
            // 根据 control_reg 控制显示
            case (control_reg[3:2])
                2'b01: begin
                    dpy1_reg <= {~seg_code[dpy1_data], 1'b0}; // 显示 dpy0
                end
                2'b10: begin
                    dpy1_reg <= {~seg_code[dpy1_data], 1'b1}; // 显示 dpy0和小数点
                end
                default: begin
                    dpy1_reg <= 8'b0000_0000;
                end
            endcase    
        end
    end

endmodule
