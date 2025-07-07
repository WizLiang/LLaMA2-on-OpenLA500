# Circuir Breaker 

队伍编号：CICC0900647


目前已经按照复赛要求，通过了（修改之后的）中断测试还有之后的RT-Tread的启动。
![image](https://github.com/user-attachments/assets/5c8dc6a2-f999-4cec-af63-2b5c56bcbea9)

## 仓库架构
基本同官方，`sdk/software/apps`为测试C语言

## FPGA工程
完成2x4的AXI总线拓展

### DC综合可能遗留问题

目前工程中含有`PLL`，可能在DC综合的时候会出现问题。Cache到时候得留，我们似乎需要一直搬数据，去掉 **D$** 不可取。

---
官方的原话是`在进行DC逻辑综合时，还需手动调整一下顶层文件。此时，iopad由工艺库提供，不需要使用iopad_fpga.v。并且不使用pll，请将时钟和复位相关逻辑用下述代码替换。CDC模块不需要删除。并关闭cache，将rtl/config.h中的宏define USE_CACHE注释掉。这样处理完后，不需要使用pll和SRAM这些hard macro，物理设计会更简单。`

---


 ~~这话我读了两三遍。~~ 目前由于需要上FPGA验证，为了保证时序，没有去除PLL。


## 软件部分
### 测试代码
int_test中的对clr寄存器进行了复位，否则无法

# Tips of Dev
1. 记得创建自己的分支，尽量有统一的命名规范
1. 适当添加描述
1. 注意git pull origin master
