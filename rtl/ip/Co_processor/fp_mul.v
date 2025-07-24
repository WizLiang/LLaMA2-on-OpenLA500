/*******************************************************************************
 * 模块名: fp_mul
 * 描述:   IEEE 754浮点乘法器。
 *
 * 功能:
 * - 处理特殊值 (NaN, Infinity, Zero)。
 * - 正确处理规格化数 (Normalized) 和非规格化数 (Denormalized)。
 * - 使用一个完全展开的、可综合的优先编码器进行动态规格化。
 * - 实现上溢 (Overflow) 和下溢 (Underflow) 处理。
 *******************************************************************************/
module fp_mul(
    input  [31:0] a,
    input  [31:0] b,
    output reg [31:0] result
);

    // 1. 分解输入 a 和 b 的组成部分
    wire sign_a = a[31];
    wire [7:0] exp_a = a[30:23];
    wire [22:0] mant_a = a[22:0];

    wire sign_b = b[31];
    wire [7:0] exp_b = b[30:23];
    wire [22:0] mant_b = b[22:0];

    // 2. 检测特殊类型的浮点数
    wire is_zero_a   = (exp_a == 8'd0) && (mant_a == 23'd0);
    wire is_zero_b   = (exp_b == 8'd0) && (mant_b == 23'd0);
    wire is_inf_a    = (exp_a == 8'hFF) && (mant_a == 23'd0);
    wire is_inf_b    = (exp_b == 8'hFF) && (mant_b == 23'd0);
    wire is_nan_a    = (exp_a == 8'hFF) && (mant_a != 23'd0);
    wire is_nan_b    = (exp_b == 8'hFF) && (mant_b != 23'd0);
    wire is_denorm_a = (exp_a == 8'd0) && !is_zero_a;
    wire is_denorm_b = (exp_b == 8'd0) && !is_zero_b;

    // 3. 核心计算逻辑
    
    // 最终结果的符号
    wire final_sign = sign_a ^ sign_b;

    // 为尾数添加隐含位 (规格化数为'1', 非规格化数/零为'0') -> 24位
    wire [23:0] mant_a_ext = {~is_denorm_a & ~is_zero_a, mant_a};
    wire [23:0] mant_b_ext = {~is_denorm_b & ~is_zero_b, mant_b};

    // 24位尾数相乘得到48位结果
    wire [47:0] mant_prod = mant_a_ext * mant_b_ext;

    // 计算指数和 (使用10位有符号数以避免计算溢出)
    // 非规格化数的有效指数为1 (对应 2^(-126))
    wire signed [9:0] exp_sum = (is_denorm_a ? 1 : exp_a) + (is_denorm_b ? 1 : exp_b) - 127;

    // 动态规格化
    reg [5:0] shift_left_amount;
    wire [47:0] mant_shifted;
    reg signed [9:0] exp_normalized;
    wire [22:0] mant_final;

    // 查找最高有效位 (MSB) 并计算左移位数
    // 使用 casex 结构实现一个可综合的48位优先编码器
    always @(*) begin
        if      (mant_prod[46]) shift_left_amount = 0;
        else if (mant_prod[45]) shift_left_amount = 1;
        else if (mant_prod[44]) shift_left_amount = 2;
        else if (mant_prod[43]) shift_left_amount = 3;
        else if (mant_prod[42]) shift_left_amount = 4;
        else if (mant_prod[41]) shift_left_amount = 5;
        else if (mant_prod[40]) shift_left_amount = 6;
        else if (mant_prod[39]) shift_left_amount = 7;
        else if (mant_prod[38]) shift_left_amount = 8;
        else if (mant_prod[37]) shift_left_amount = 9;
        else if (mant_prod[36]) shift_left_amount = 10;
        else if (mant_prod[35]) shift_left_amount = 11;
        else if (mant_prod[34]) shift_left_amount = 12;
        else if (mant_prod[33]) shift_left_amount = 13;
        else if (mant_prod[32]) shift_left_amount = 14;
        else if (mant_prod[31]) shift_left_amount = 15;
        else if (mant_prod[30]) shift_left_amount = 16;
        else if (mant_prod[29]) shift_left_amount = 17;
        else if (mant_prod[28]) shift_left_amount = 18;
        else if (mant_prod[27]) shift_left_amount = 19;
        else if (mant_prod[26]) shift_left_amount = 20;
        else if (mant_prod[25]) shift_left_amount = 21;
        else if (mant_prod[24]) shift_left_amount = 22;
        else if (mant_prod[23]) shift_left_amount = 23;
        else if (mant_prod[22]) shift_left_amount = 24;
        else if (mant_prod[21]) shift_left_amount = 25;
        else if (mant_prod[20]) shift_left_amount = 26;
        else if (mant_prod[19]) shift_left_amount = 27;
        else if (mant_prod[18]) shift_left_amount = 28;
        else if (mant_prod[17]) shift_left_amount = 29;
        else if (mant_prod[16]) shift_left_amount = 30;
        else if (mant_prod[15]) shift_left_amount = 31;
        else if (mant_prod[14]) shift_left_amount = 32;
        else if (mant_prod[13]) shift_left_amount = 33;
        else if (mant_prod[12]) shift_left_amount = 34;
        else if (mant_prod[11]) shift_left_amount = 35;
        else if (mant_prod[10]) shift_left_amount = 36;
        else if (mant_prod[9])  shift_left_amount = 37;
        else if (mant_prod[8])  shift_left_amount = 38;
        else if (mant_prod[7])  shift_left_amount = 39;
        else if (mant_prod[6])  shift_left_amount = 40;
        else if (mant_prod[5])  shift_left_amount = 41;
        else if (mant_prod[4])  shift_left_amount = 42;
        else if (mant_prod[3])  shift_left_amount = 43;
        else if (mant_prod[2])  shift_left_amount = 44;
        else if (mant_prod[1])  shift_left_amount = 45;
        else if (mant_prod[0])  shift_left_amount = 46;
        else                    shift_left_amount = 47; // Product is zero
    end

    // 根据移位调整尾数和指数
    // 目标是将MSB对齐到bit 46 (代表 1.M 格式)
    always @(*) begin
        if (mant_prod[47]) begin // 乘积的整数部分 >= 2, 右移1位
            exp_normalized = exp_sum + 1;
        end else begin // 乘积的整数部分为0或1, 左移
            exp_normalized = exp_sum - shift_left_amount;
        end
    end

    // 执行移位操作
    assign mant_shifted = mant_prod[47] ? (mant_prod >> 1) : (mant_prod << shift_left_amount);

    // 截取最终的23位尾数 (此处为简单截断, 未实现舍入)
    assign mant_final = mant_shifted[45:23];

    // 4. 处理最终结果 (包括特殊值和溢出/下溢)
    always @(*) begin
        // 情况 1: 输入或结果为 NaN
        if (is_nan_a || is_nan_b || (is_inf_a && is_zero_b) || (is_zero_a && is_inf_b)) begin
            result = 32'h7FC00000; // 标准的 quiet NaN
        // 情况 2: 输入或结果为无穷大 (或上溢)
        end else if (is_inf_a || is_inf_b || (exp_normalized >= 255)) begin
            result = {final_sign, 8'hFF, 23'd0};
        // 情况 3: 输入或结果为零 (或下溢)
        end else if (is_zero_a || is_zero_b || (mant_prod == 0) || (exp_normalized <= 0)) begin
            result = {final_sign, 8'd0, 23'd0};
        // 情况 4: 正常规格化结果
        end else begin
            result = {final_sign, exp_normalized[7:0], mant_final};
        end
    end

endmodule
