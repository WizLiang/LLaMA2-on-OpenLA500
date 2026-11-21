# LLaMA2-on-OpenLA500

[简体中文](README.md) · English

This project runs a small language model on the Loongson cloud platform's Artix-7 XC7A200T FPGA. An OpenLA500 LoongArch32R CPU runs a bare-metal port of llama2.c and offloads matrix–vector products to a custom AXI accelerator. Circuit Breakers (CICC0900647) won first prize in the national finals of the 9th CICC (Loongson Cup). [Competition brief](https://univ.ciciec.com/nd.jsp?id=882) · [Team write-up in Chinese](https://zhuanlan.zhihu.com/p/1961830081061184854)

## Using the repository

- **Run the competition demo.** Use the supplied SoC bitstream, build the board version of the inference program and load it into BaseRAM. Generated text appears on the serial console. [Build the program](#build-the-inference-program) · [Run the demo](#run-on-the-competition-cloud-platform)
- **Change the hardware.** Start with the SoC and accelerator top levels. After changing the RTL, rebuild the bitstream. The competition backup bitstream exposes accelerator status on LEDs. [SoC top](rtl/soc_top.sv) · [Accelerator top](rtl/ip/Co_processor/CB_top.v) · [Backup bitstream](bitstream/soc_top1.bit) · [FPGA build](#rebuild-the-fpga-project)
- **Check the platform first.** The repository includes a HelloWorld test package and a SoC simulation testbench. [HelloWorld files](helloworld_test/) · [Testbench](sim/mycpu_tb.v)

## What to study

**Porting a C program to bare metal.** Read `build_transformer` and `build_tokenizer` to see how the program reads weights and vocabulary directly from arrays compiled into its image. When changing the model, check that the weights, runtime buffers and stack fit the target memory map. [Inference source](sdk/software/apps/runc/run.c) · [Linker script](sdk/software/bsp/env/separate.lds)

**Connecting a C operator to hardware.** Search for `matmul(s->q` in the inference source. Follow the input vector, weights and output buffer into `matmul`, then follow the register writes into the accelerator. Its controller coordinates DMA transfers and multiply–accumulate operations. When adapting this example to another SoC, check the register base address, cache maintenance and completion interrupt against the target hardware. [Register definitions](sdk/software/apps/runc/hw_accelerator.h) · [Accelerator top](rtl/ip/Co_processor/CB_top.v) · [Controller](rtl/ip/Co_processor/cb_controll.v)

## Demo model

Andrej Karpathy released **stories260K** for llama2.c. This Llama 2 architecture model was trained on TinyStories and has about 260,000 parameters, five Transformer layers, a hidden dimension of 64, a 512-token vocabulary and a maximum sequence length of 512. The team embedded the FP32 weights and tokenizer in the executable as C arrays. [llama2.c](https://github.com/karpathy/llama2.c) · [Model card](https://huggingface.co/karpathy/tinyllamas) · [Embedded weights](sdk/software/apps/runc/stories_data.h) · [Tokenizer](sdk/software/apps/runc/tok512.h)

## How a matrix–vector product runs

The CPU is a single-issue, five-stage Open-LA500 core. The team adapted the competition SoC's cache, interrupts, clocks and constraints and connected the accelerator over AXI. [Upstream CPU](https://github.com/loongson-community/open-la500)

For each attention projection (Q, K or V), the CPU writes the buffer addresses, performs cache maintenance, sets the matrix dimensions and starts the accelerator. The accelerator fetches tiles through DMA, computes and writes back the result, and interrupts the CPU so inference can resume. [DMA controller](rtl/ip/Co_processor/axi_dma_controller.v) · [Multiply–accumulate unit](rtl/ip/Co_processor/mac_top.v)

![SoC and accelerator architecture](https://github.com/user-attachments/assets/16e24b3e-ce03-4ada-97e2-af41a4afb115)

## Build the inference program

On x86-64 Linux, install GNU Make and host GCC. The repository includes the LoongArch32R cross-toolchain and Picolibc. For an FPGA build, change `-DSIMU=1` to `-DSIMU=0` in the application Makefile to select the board UART configuration. Run the following from the repository root. [Application Makefile](sdk/software/apps/runc/Makefile)

```bash
export CICIEC_WINDOWS_HOME="$PWD"
export PATH="$PWD/sdk/toolchains/loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0/bin:$PATH"
make -C sdk/software/apps/runc
```

The build produces `sdk/software/apps/runc/obj/run.elf` and copies the program binary and RAM image to `sdk/run.bin` and `sdk/axi_ram.mif`, overwriting existing files at those paths. [Build rules](sdk/software/bsp/common_runc.mk)

## Run on the competition cloud platform

1. Build the board version of `sdk/run.bin` as described above.
2. Upload the supplied [soc_top.bit](bitstream/soc_top.bit) and start the FPGA.
3. In the SRAM download panel, select BaseRAM and write `run.bin`. Read the generated text on the serial console. Section 1.3 of the platform guide describes the workflow, and chapter 2 illustrates it with HelloWorld. [Platform guide in Chinese](doc/集创赛龙芯中科杯初赛发布包说明.pdf)

## Rebuild the FPGA project

The team used Vivado 2019.2 and 2024.2 with target part `xc7a200tfbg676-1`. Back up any existing work in `fpga/project/` before running the creation script, which deletes and recreates that directory.

A fresh clone needs `rtl/ip/PLL_2019_2/clk_pll.xci`. Git ignores that directory. To recreate the local clock configuration in Vivado Clocking Wizard, name the PLL `clk_pll`, use a 50 MHz single-ended input named `clk_in1`, request 33 MHz for `cpu_clk` and 50 MHz for `sys_clk`, and enable active-low reset `resetn` and the `locked` output. Place the XCI at the path above. From the repository root, run:

```bash
cd fpga
vivado -source create_project.tcl
```

Set the synthesis top to `soc_top` and disable the unused `rtl/ip/Bus_interconnects/AxiCrossbar_1x4.v`. Run synthesis, implementation and bitstream generation in sequence. Vivado writes the new bitstream to the implementation run directory. [Project script](fpga/create_project.tcl) · [Board constraints](fpga/constraints/)

## Competition materials

The team's finals submissions are in Chinese. Start with the [presentation](doc/finals/CICC0900647PPT.pdf) or [design paper](doc/finals/CICC0900647设计分享论文.pdf). The [system design report](doc/finals/CICC0900647系统设计报告.pdf) covers the model port, integration and verification. The [accelerator report](doc/finals/CICC0900647自主IP报告.pdf) describes the custom IP. Physical implementation is documented for both the [base SoC](doc/finals/CICC0900647基础SOC后端报告.pdf) and the [complete SoC](doc/finals/CICC0900647完整SOC后端报告.pdf).

## Validation and performance

On the Loongson cloud FPGA platform, the team ran HelloWorld, system functionality and interrupt tests, booted RT-Thread, and demonstrated inference. Porting and validating the design on a local physical board remains future work.

![Cloud FPGA demo](https://github.com/user-attachments/assets/26924b9c-05de-4a28-b19f-b3e6f8236f0c)

After the competition, [@threepoint-s](https://github.com/threepoint-s) measured per-token latency and generation speed (tokens/s) with and without acceleration and contributed both comparison figures. [Original PR #11](https://github.com/WizLiang/LLaMA2-on-OpenLA500/pull/11)

![Inference comparison, first record](https://github.com/user-attachments/assets/014feee8-efd5-4052-86b8-66e99ce83df9)
![Inference comparison, second record](https://github.com/user-attachments/assets/062c5247-a43d-4f75-80b6-82020c4e2326)

<details>
<summary>FPGA implementation, setup and hold timing, and exploratory physical layout</summary>

![Implementation results](https://github.com/user-attachments/assets/7b955440-0f89-4815-8601-1dc929571563)
![Setup timing](https://github.com/user-attachments/assets/6acbf7a4-b0bb-44ba-b58f-fa457411a54a)
![Hold timing](https://github.com/user-attachments/assets/d36ca6af-7631-46cb-bec7-9dba3f72ea29)
![Exploratory physical layout](https://github.com/user-attachments/assets/dd843904-ad96-496b-848a-f0f73df0520e)

</details>

## Licensing

Licensing is documented per component. The repository has no project-wide license. The OpenLA500 CPU core uses [MulanPSL-2.0](rtl/ip/open-la500/LICENSE). The upstream llama2.c code used in the inference port carries the [MIT license](sdk/software/apps/LICENSE.llama2.c). The stories260K publisher lists MIT on the [model card](https://huggingface.co/karpathy/tinyllamas). The team has yet to specify an open-source license for its custom accelerator RTL.

Share reproduction results or suggestions in [Issues](https://github.com/WizLiang/LLaMA2-on-OpenLA500/issues).

[Repository clone history](doc/traffic/)
