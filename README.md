# Circuit Breaker 

队伍编号：CICC0900647

# 致评委
soc_top64.bit 64bits是完成LLaMA2的推理；
您现在看到的是64bits总线下的系统设计,处于`Dev_bus64`分支下；
FPGA工程文件已经附上，位于fpga文件夹中，打开应可直接看到综合结果，时序报告等。 比赛时我们的代码可能并未将访问权限设置为publish，如果安装有git，可以用`git -log`查看开发历史。
64bits下设计仅为探索，仍有缺陷（FPGA时序违例），32bits下为完整设计。

## 注意
1. 由于我们将两个RAM并成64位，故需要将BaseRAM跟ExtRAM烧录才能运行程序；我们在`convert.c`中对bin文件进行了劈裂
2. 多次reset可能出现初始化失败，请`清空RAM之后`重新烧录(我们自己的做法是退出重新登陆)
3. 我们64位总线的设计也能够通过之前的系统测试，但是由于对RAM进行了魔改，故可能无法直接通过线上的在线测试。
4. 如果需要测试其他程序，请在`sdk`中`make`或者使用我们给您准备好的bin文件。（并对`两个RAM进行`烧录）
 
## Project Overview / 项目概述

Circuit Breaker is an FPGA SoC platform built around the openLA500 LoongArch32R CPU core with a custom AI accelerator. The goal is to run common operating systems and AI workloads such as LLaMA2.

Circuit Breaker项目在FPGA上集成了openLA500处理器核和自定义AI加速器，目标是实现能够运行操作系统和AI应用（例如 LLaMA2）的LoongArch平台。


已经按照复赛要求，通过了HelloWorld测试、系统功能测试、中断测试、启动RT-Thread。
### Architecture / 系统架构
The CPU (OpenLA500) uses a single-issue five-stage pipeline (fetch, decode, execute, memory, write-back) with 2-way associative instruction and data caches, a 32-entry TLB and a simple branch predictor. Peripherals and the AI accelerator connect through an AXI bus. Accelerator RTL can be found under `rtl/ip/Co_processor`.
OpenLA500 处理器采用五级单发射流水线（取指、译码、执行、访存、写回），配备2路组相联的指令和数据缓存、32项TLB和简易的分支预测器。外设与AI加速器通过AXI总线连接，加速器代码位于`rtl/ip/Co_processor`目录。
系统加构图如下

<img width="953" height="578" alt="image" src="https://github.com/user-attachments/assets/16e24b3e-ce03-4ada-97e2-af41a4afb115" />

## 仓库架构

基本同官方


### bitstreams
soc_top.bit是完整32位的SoC bitstream，能通过官方测试，也能完成LLaMA2的推理。
soc_top1.bit为完整32位的LED灯显示加速器状态的备份。
soc_top64.bit 64bits是完成LLaMA2的推理。

## 硬件代码

AI加速器代码位于 `rtl/ip/Co_processor` 目录，其余基本保持不变。(相较于官方的初赛发布包)

## Hardware Build / 硬件编译
1. 安装 Xilinx Vivado（经测试版本为 2019.2/2024.2）。
2. 运行 `vivado -source fpga/create_project.tcl` 创建工程。
3. 在 Vivado 中执行 `write_bitstream` 生成 `soc_top.bit`。




## Software Build / 软件编译
1. 安装 Loongson GNU toolchain `loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0` 及 Picolibc。
2. 进入 `sdk/software/apps` 下的应用目录（例如 `runc`）。
3. 执行 `make` 编译程序。
llama2.c在sdk/software/apps/runc中，make即可

# Tips of Dev
1. 记得创建自己的分支，尽量有统一的命名规范
1. 适当添加描述
1. 注意 `git pull origin master` 
