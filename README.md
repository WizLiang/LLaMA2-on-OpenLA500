# LLaMA2-on-OpenLA500

## 🧩 Project Overview / 项目概述

**LLaMA2-on-OpenLA500** is an **FPGA-based SoC platform** built around the **openLA500 LoongArch32R CPU core** with a **custom AI accelerator**. The goal is to enable LoongArch platforms to run both common operating systems and **AI workloads such as LLaMA2**.

**LLaMA2-on-OpenLA500** 项目基于 **openLA500 LoongArch32R CPU 核**，在 **FPGA** 上集成了 **自定义 AI 加速器**，旨在构建一个能够运行主流操作系统和 **AI 应用（如 LLaMA2）** 的 **LoongArch SoC 平台**。

The system has successfully passed the **HelloWorld**, **system functionality**, **interrupt**, and **RT-Thread boot** tests required by the competition. The design was created by **Circuit Breakers (team ID CICC0900647)** for the **9th China IC Competition (Loongson Cup)** and won **First Prize in the national finals**.

项目已通过比赛官方要求的 **HelloWorld 测试、系统功能测试、中断测试** 以及 **RT-Thread 启动测试**。本作品由 **Circuit Breakers 队（编号 CICC0900647）** 设计开发，参加 **第九届全国大学生集成电路创新创业大赛（龙芯中科杯）**，并获 **全国总决赛一等奖**。

赛题链接：http://univ.ciciec.com/nd.jsp?id=882#_jcp=1

## Table of Contents / 目录

- [Architecture / 系统架构](#architecture--系统架构)
- [Repository Layout / 仓库结构](#repository-layout--仓库结构)
- [Getting Started / 快速开始](#getting-started--快速开始)
  - [Hardware Toolchain Setup / 硬件工具链配置](#hardware-toolchain-setup--硬件工具链配置)
  - [Software Toolchain Setup / 软件工具链配置](#software-toolchain-setup--软件工具链配置)
  - [Build Instructions / 编译步骤](#build-instructions--编译步骤)
- [Project Status & TODO](#project-status--todo)
- [Results / 项目成果](#results--项目成果)
- [Support / 支持我们](#support--支持我们)
- [Zhihu Write-up / 知乎文章](#zhihu-write-up--知乎文章)


## Architecture / 系统架构
The CPU comes from the Loongson Community’s  [Open-LA500](https://github.com/loongson-community/open-la500). We applied minimal changes (interrupt/clock & constraints, cache ...) to attach our AI accelerator and pass competition tests.
The OpenLA500 core uses a single-issue five-stage pipeline (fetch, decode, execute, memory, write-back) with 2-way associative instruction and data caches, a 32-entry TLB and a simple branch predictor. Peripherals and the AI accelerator connect through an AXI bus. Accelerator RTL can be found under `rtl/ip/Co_processor`.

CPU 实现来源于龙芯社区的 [Open-LA500](https://github.com/loongson-community/open-la500)；我们仅做了少量改动（中断/时钟与约束、Cache），用于接入自研 AI 加速器并通过比赛测试。
处理器采用五级单发射流水线（取指、译码、执行、访存、写回），配备 2 路组相联的指令和数据缓存、32 项 TLB 和简易分支预测器。外设与 AI 加速器通过 AXI 总线连接，加速器代码位于 `rtl/ip/Co_processor` 目录。

系统结构示意图如下：

<img width="953" height="578" alt="architecture" src="https://github.com/user-attachments/assets/16e24b3e-ce03-4ada-97e2-af41a4afb115" />

## Repository Layout / 仓库结构

```
.
├── bitstream/            # Pre-built FPGA bitstreams
├── doc/                  # Official documentation and release notes
├── fpga/                 # Vivado project scripts (create_project.tcl etc.)
├── helloworld_test/      # Reference HelloWorld verification package
├── rtl/                  # OpenLA500 SoC RTL sources and custom accelerator
├── sdk/                  # LoongArch software stack, apps, and libraries
└── sim/                  # Simulation environments and test benches
```

- `bitstream/soc_top.bit` 是完整的 SoC bitstream，可通过官方测试并运行 LLaMA2 推理。
- `bitstream/soc_top1.bit` 为带 LED 指示功能的备份版本。
- `rtl/ip/Co_processor` 保存 AI 加速器实现；其它 RTL 大体保持与官方初赛发布包一致。

## Getting Started / 快速开始

### Hardware Toolchain Setup / 硬件工具链配置

1. Install **Xilinx Vivado** (verified with 2019.2 and 2024.2).
2. Clone or download this repository.
3. Refer to the official release guide in `doc/集创赛龙芯中科杯初赛发布包说明.pdf` for environment prerequisites (OS, drivers, license setup).
4. Launch Vivado and execute `vivado -source fpga/create_project.tcl` to recreate the project. Disable unused files such as `rtl/ip/Bus_interconnects/AxiCrossbar_1x4.v` to avoid synthesis issues.

### Software Toolchain Setup / 软件工具链配置

1. Install the **Loongson GNU toolchain** `loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0`.
2. Install **Picolibc** per the guidance in `doc/集创赛龙芯中科杯初赛发布包说明.pdf` (toolchain path configuration and environment variables).
3. Ensure the toolchain binaries are added to your `PATH` (e.g., `export PATH=/opt/loongson/bin:$PATH`).

### Build Instructions / 编译步骤

**Hardware / 硬件**

1. Run synthesis and implementation in Vivado.
2. Generate the bitstream with `write_bitstream` to produce `bitstream/soc_top.bit`.
3. Program the FPGA board with the generated bitstream.

**Software / 软件**

1. Navigate to an application, e.g. `sdk/software/apps/runc`.
2. Build the application with `make` using the Loongson toolchain.
3. Deploy the binary through the SDK workflow described in the official documentation.

我们的软件功能是对 Karpathy 的 [llama2.c](https://github.com/karpathy/llama2.c) 进行移植，代码位于 `sdk/software/apps/runc`，执行 `make` 即可完成编译。

## Project Status & TODO

- ✅ FPGA bitstream validated on Loongson cloud platform (Artix-7 XC7A200T).
- ✅ RT-Thread, interrupt, and system functionality tests completed.
- ✅ LLaMA2 inference demo running on accelerator.
- [ ] 移植并验证至线下实体开发板，完善部署流程。

欢迎在 Issues 中补充新的 TODO 项目或提交 Pull Request！

## Results / 项目成果

综合实现与时序结果：

<img width="1147" height="468" alt="timing-summary" src="https://github.com/user-attachments/assets/7b955440-0f89-4815-8601-1dc929571563" />
<img width="1153" height="277" alt="timing-setup" src="https://github.com/user-attachments/assets/6acbf7a4-b0bb-44ba-b58f-fa457411a54a" />
<img width="1153" height="265" alt="timing-hold" src="https://github.com/user-attachments/assets/d36ca6af-7631-46cb-bec7-9dba3f72ea29" />

上板测试与演示：

<img width="1189" height="567" alt="board-demo" src="https://github.com/user-attachments/assets/26924b9c-05de-4a28-b19f-b3e6f8236f0c" />

加速前后token耗时/速度对比：

<img width="1717" height="953" alt="b3e55067-dfa7-41ce-bf9f-7cdc856da32a" src="https://github.com/user-attachments/assets/014feee8-efd5-4052-86b8-66e99ce83df9" />
<img width="1733" height="1061" alt="0e4ca43d-e1fb-42d9-ace2-740f07d692e6" src="https://github.com/user-attachments/assets/062c5247-a43d-4f75-80b6-82020c4e2326" />

后端版图尝试：

<img width="2463" height="1434" alt="layout" src="https://github.com/user-attachments/assets/dd843904-ad96-496b-848a-f0f73df0520e" />

## Support / 支持我们

If you find this project useful, please ⭐ Star it! We’re continuously improving the LLaMA2-on-OpenLA500 platform and welcome all suggestions, issues, or pull requests.

如果你觉得这个项目有趣，欢迎点个 Star 支持一下，也可以在 Issues 中提出建议或问题 🙌

## Zhihu Write-up / 知乎文章

我们在知乎专栏对项目做了更通俗完整的介绍，包含部分设计取舍、踩坑和性能细节，欢迎阅读与交流：

- 《【龙芯中科杯｜第九届集创赛】LoongArch SoC 跑 LLaMA2.c （含仓库链接）》  
  https://zhuanlan.zhihu.com/p/1961830081061184854

