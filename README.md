# Circuit Breaker 

队伍编号：CICC0900647


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
soc_top.bit是完整的SoC bitstream，能通过官方测试，也能完成LLaMA2的推理。
soc_top1.bit为LED灯显示加速器状态的备份。


## 硬件代码

AI加速器代码位于 `rtl/ip/Co_processor` 目录，其余基本保持不变。(相较于官方的初赛发布包)

## Hardware Build / 硬件编译
1. 安装 Xilinx Vivado（经测试版本为 2019.2/2024.2）。
2. 运行 `vivado -source fpga/create_project.tcl` 创建工程。注意disable掉不需要的文件，例如`./rtl/ip/Bus_interconnects/AxiCrossbar_1x4.v`以免综合报错！
3. 在 Vivado 中执行 `write_bitstream` 生成 `soc_top.bit`。




## Software Build / 软件编译
我们的软件功能是对Karpathy的LlaMA2.c进行了移植，具体请看https://github.com/karpathy/llama2.c
下面是大致的编译过程
1. 安装 Loongson GNU toolchain `loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0` 及 Picolibc。
2. 进入 `sdk/software/apps` 下的应用目录（例如 `runc`）。
3. 执行 `make` 编译程序。
llama2.c在sdk/software/apps/runc中，make即可

# 最终效果
挖个坑，各类技术报告晚些同步。
## 综合结果
我们在龙芯的云平台上面部署的，FPGA型号是Artix-7 XC7A200T
<img width="1147" height="468" alt="image" src="https://github.com/user-attachments/assets/7b955440-0f89-4815-8601-1dc929571563" />
Setup Timing以及Hold Timing
<img width="1153" height="277" alt="image" src="https://github.com/user-attachments/assets/6acbf7a4-b0bb-44ba-b58f-fa457411a54a" />
<img width="1153" height="265" alt="image" src="https://github.com/user-attachments/assets/d36ca6af-7631-46cb-bec7-9dba3f72ea29" />


## 上板测试
<img width="1189" height="567" alt="image" src="https://github.com/user-attachments/assets/26924b9c-05de-4a28-b19f-b3e6f8236f0c" />

## 后端版图
额，其实我们不太会后端，就象征性跑一个结果。贴上来就是留个念
<img width="2463" height="1434" alt="Screenshot from 2025-08-18 09-58-17" src="https://github.com/user-attachments/assets/dd843904-ad96-496b-848a-f0f73df0520e" />

