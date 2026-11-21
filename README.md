# LLaMA2-on-OpenLA500

简体中文 · [English](README.en.md)

在龙芯云平台的 Artix-7 XC7A200T FPGA 上，OpenLA500 处理器运行由 [llama2.c](https://github.com/karpathy/llama2.c) 移植的推理程序，自研 AXI 协处理器负责矩阵与向量乘法。Circuit Breakers 队（CICC0900647）凭此项目获得第九届全国大学生集成电路创新创业大赛（龙芯中科杯） **全国总决赛一等奖**。[赛题说明](https://univ.ciciec.com/nd.jsp?id=882) · [团队技术复盘](https://zhuanlan.zhihu.com/p/1961830081061184854)

LLaMA2-on-OpenLA500 runs a small llama2.c model on an FPGA using a LoongArch32R CPU and a custom matrix–vector accelerator. Circuit Breakers won first prize in the national finals of the 9th CICC (Loongson Cup).

## 怎么使用这个仓库

- **在比赛平台跑一次推理。** 用仓库里的 [soc_top.bit](bitstream/soc_top.bit) 配置 FPGA，再把自己编译的 `run.bin` 写入 BaseRAM，从串口观察生成文本。第一次复现可以直接使用现成位流。[编译推理程序](#编译推理程序) · [云平台操作步骤](#在比赛云平台运行演示)
- **改硬件并观察结果。** SoC 顶层连接在 [soc_top.sv](rtl/soc_top.sv)，加速器入口是 [CB_top.v](rtl/ip/Co_processor/CB_top.v)。修改 RTL 后需要重新生成位流；仓库另有一份用 LED 显示加速器状态的[比赛备份位流](bitstream/soc_top1.bit)。[重建 FPGA 工程](#重建-fpga-工程)
- **先检查基础环境。** 可以从 [HelloWorld 验证文件](helloworld_test/) 和 [SoC 仿真入口](sim/mycpu_tb.v) 入手，再接入推理程序。

## 可以借鉴什么

**把已有 C 程序移植到裸机。** 在 `run.c` 里从 `build_transformer` 和 `build_tokenizer` 开始读，看程序如何直接从编译进镜像的数组读取权重和词表。如果自己的应用也有固定的只读数据，可以参考这个做法。换模型时，先对照目标板的内存布局，确认权重、运行缓冲区和栈能同时放下。[推理程序](sdk/software/apps/runc/run.c) · [链接脚本](sdk/software/bsp/env/separate.lds)

**给已有算子接一个硬件实现。** 可以只跟读一次 Q 投影：在 `run.c` 搜索 `matmul(s->q`，记下输入向量、权重和输出缓冲区，再到 `matmul` 看这些参数分别写入哪个寄存器。最后打开 `CB_top.v`，看控制器如何协调 DMA 和乘加单元。移植到自己的 SoC 时，这条调用顺序可以参考；寄存器基址、缓存维护和完成中断要按目标平台核对。[寄存器定义](sdk/software/apps/runc/hw_accelerator.h) · [加速器顶层](rtl/ip/Co_processor/CB_top.v) · [控制器状态机](rtl/ip/Co_processor/cb_controll.v)

## 演示模型

演示使用 Andrej Karpathy 为 llama2.c 发布的 **stories260K**。它采用 Llama 2 架构，在 TinyStories 英文短篇故事数据集上训练，约有 26 万个参数。模型有 5 层 Transformer，隐藏维度为 64，词表和最大序列长度均为 512。为在裸机上运行，团队把 FP32 权重和分词器转成 C 数组，随程序编译进镜像。[上游模型卡](https://huggingface.co/karpathy/tinyllamas) · [模型数据](sdk/software/apps/runc/stories_data.h) · [分词器数据](sdk/software/apps/runc/tok512.h)

## 一次矩阵运算如何执行

CPU 基于龙芯社区的 [Open-LA500](https://github.com/loongson-community/open-la500)，采用五级单发射流水线。团队在比赛 SoC 上调整了缓存、中断、时钟和约束，并通过 AXI 接入加速器。

以注意力层的 Q、K、V 投影为例，推理程序分别调用 `matmul`。CPU 将权重矩阵、输入向量和输出缓冲区的地址写入寄存器，执行缓存维护，设置矩阵行列数并启动加速器。协处理器通过 DMA 访问内存，分块完成乘加并写回结果。CPU 等待完成中断，再继续执行推理。[推理程序](sdk/software/apps/runc/run.c) · [DMA 控制器](rtl/ip/Co_processor/axi_dma_controller.v) · [乘加单元](rtl/ip/Co_processor/mac_top.v)

![OpenLA500 SoC 与 AXI 协处理器系统架构](https://github.com/user-attachments/assets/16e24b3e-ce03-4ada-97e2-af41a4afb115)

## 编译推理程序

在 x86-64 Linux 下准备 GNU Make 和宿主机 GCC。仓库已包含 LoongArch32R 交叉工具链和 Picolibc。从**仓库根目录**执行以下命令。构建规则会将生成的程序和内存镜像复制到 `sdk/`，覆盖其中的同名文件。

```bash
export CICIEC_WINDOWS_HOME="$PWD"
export PATH="$PWD/sdk/toolchains/loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0/bin:$PATH"
make -C sdk/software/apps/runc
```

构建生成 `sdk/software/apps/runc/obj/run.elf`、`sdk/run.bin` 和 `sdk/axi_ram.mif`。推理应用的 Makefile 默认使用 `-DSIMU=1` 选择仿真串口配置；编译上板版本时按 Makefile 注释改为 `-DSIMU=0` 并重新构建。[应用 Makefile](sdk/software/apps/runc/Makefile) · [构建规则](sdk/software/bsp/common_runc.mk)

## 在比赛云平台运行演示

1. 按上一节编译上板版本，准备好 `sdk/run.bin`。
2. 在平台上传 [soc_top.bit](bitstream/soc_top.bit) 并启动 FPGA。
3. 在 SRAM 下载区选择 BaseRAM，写入 `run.bin`，从串口窗口查看生成文本。官方文档第 1.3 节介绍平台流程，第 2 章的 HelloWorld 示例附有操作截图。[初赛 SoC 发布包说明](doc/集创赛龙芯中科杯初赛发布包说明.pdf)

## 重建 FPGA 工程

团队使用过 Vivado 2019.2 和 2024.2，工程目标器件为 `xc7a200tfbg676-1`。创建脚本按当前工作目录查找 RTL 和约束，并会先删除再重建 `fpga/project/`。如需保留已有工程，请先备份该目录。

新克隆需先准备 `rtl/ip/PLL_2019_2/clk_pll.xci`，该目录被 Git 忽略。可在 Vivado Clocking Wizard 中按本地工程配置重建名为 `clk_pll` 的 PLL：单端输入 `clk_in1` 为 50 MHz，输出 `cpu_clk` 和 `sys_clk` 的目标频率分别为 33 MHz 和 50 MHz，启用低有效复位 `resetn` 和锁定输出 `locked`。将生成的 XCI 放到上述路径后，从仓库根目录执行以下命令。

```bash
cd fpga
vivado -source create_project.tcl
```

在 Vivado 中将综合顶层设为 `soc_top`，禁用当前设计未使用的 `rtl/ip/Bus_interconnects/AxiCrossbar_1x4.v`，然后依次运行 **Run Synthesis → Run Implementation → Generate Bitstream**。新位流位于工程的实现输出目录。[创建脚本](fpga/create_project.tcl) · [板级约束](fpga/constraints/)

## 决赛资料

初次了解项目，可以先看[答辩演示](doc/finals/CICC0900647PPT.pdf)或[设计分享论文](doc/finals/CICC0900647设计分享论文.pdf)。以下报告保留了决赛提交时的设计与实验记录。

| 关注点 | 团队报告 |
| --- | --- |
| 模型移植、SoC 集成与系统验证 | [系统设计报告](doc/finals/CICC0900647系统设计报告.pdf) |
| 自研矩阵运算加速器的接口与实现 | [自主 IP 报告](doc/finals/CICC0900647自主IP报告.pdf) |
| 基础 SoC 和完整 SoC 的物理实现 | [基础 SoC 后端报告](doc/finals/CICC0900647基础SOC后端报告.pdf) · [完整 SoC 后端报告](doc/finals/CICC0900647完整SOC后端报告.pdf) |

## 验证与性能

团队在龙芯云 FPGA 平台完成了 HelloWorld、系统功能、中断和 RT-Thread 启动测试，并运行了 LLaMA2 推理演示。线下实体开发板的移植和部署验证仍是待办项。

![云平台上板演示](https://github.com/user-attachments/assets/26924b9c-05de-4a28-b19f-b3e6f8236f0c)

感谢 [@threepoint-s](https://github.com/threepoint-s) 在赛后实测加速前后每个 token 的耗时与生成速度（token/s），并提供了以下两张对比图。[原始 PR #11](https://github.com/WizLiang/LLaMA2-on-OpenLA500/pull/11)

![推理性能对比记录一](https://github.com/user-attachments/assets/014feee8-efd5-4052-86b8-66e99ce83df9)
![推理性能对比记录二](https://github.com/user-attachments/assets/062c5247-a43d-4f75-80b6-82020c4e2326)

<details>
<summary>查看综合实现、建立与保持时序，以及后端版图探索</summary>

![FPGA 综合实现结果](https://github.com/user-attachments/assets/7b955440-0f89-4815-8601-1dc929571563)
![建立时序报告](https://github.com/user-attachments/assets/6acbf7a4-b0bb-44ba-b58f-fa457411a54a)
![保持时序报告](https://github.com/user-attachments/assets/d36ca6af-7631-46cb-bec7-9dba3f72ea29)
![后端版图探索](https://github.com/user-attachments/assets/dd843904-ad96-496b-848a-f0f73df0520e)

</details>

## 许可说明

本仓库按组件说明许可，目前没有仓库级许可证。OpenLA500 CPU 核采用[木兰宽松许可证第 2 版](rtl/ip/open-la500/LICENSE)。推理程序移植自 llama2.c，上游代码采用 [MIT 许可证](sdk/software/apps/LICENSE.llama2.c)。stories260K 的发布者在[模型卡](https://huggingface.co/karpathy/tinyllamas)中标注了 MIT。团队自研加速器 RTL 尚未声明单独的开源许可证。

欢迎在 [Issues](https://github.com/WizLiang/LLaMA2-on-OpenLA500/issues) 中交流复现结果或提交改进建议。

