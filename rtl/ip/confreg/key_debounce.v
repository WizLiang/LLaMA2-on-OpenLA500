module key_debounce(
    input sys_clk, //外部时钟

    input key, //外部按键输入

    output wire key_out //按键消抖后的数据
);

    //reg define
    reg [31:0] delay_cnt; //延时计数
    reg key_reg;
    reg key_value = 1'b1;

//*****************************************************
//** main code
//*****************************************************
    always @(posedge sys_clk ) begin
        key_reg <= key;
        if(key_reg != key) //一旦检测到按键状态发生变化(有按键被按下或释放)
            delay_cnt <= 32'd400000; //给延时计数器重新装载初始值（计数时间为 20ms）
        else if(key_reg == key) begin //在按键状态稳定时，计数器递减，开始 20ms 倒计时
            if(delay_cnt > 32'd0)
                delay_cnt <= delay_cnt - 1'b1;
            else
                delay_cnt <= delay_cnt;
        end
    end

    always @(posedge sys_clk ) begin
        if(delay_cnt == 32'd1) begin //当计数器递减到 1 时，说明按键稳定状态维持了 20ms
            key_value <= key; //并寄存此时按键的值
        end
        else begin
            key_value <= key_out;
        end
    end

    assign key_out = key & key_value ;

endmodule