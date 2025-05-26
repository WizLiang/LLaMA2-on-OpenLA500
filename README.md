# circuir breaker 

队伍编号：CICC0900647

文件架构同初赛发布包裹，本次代码同步平台采用github，github仓库连接https://github.com/WizLiang/la32r_soc_ciciec/tree/master
建立为私人仓库，如有需要可以通过邮箱/钉钉联系。

开发历史可以通过git log查看。

当前处在dev_axi中。

## FPGA工程

FPGA工程采用的是AXI1X4的架构，目前2x4的进行功能仿真的时候出现问题，而上板子调试仍可通过。（ 如需测试，将soc_top改用相同路径下soc_top.2x4run，生成bitstream即可。）

## 软件部分

我们的软件代码放在/la32r_soc_ciciec/sdk/software/examples/runq中

## 额外说明

目前协处理器由于并未进入联调阶段，故暂未合并仓库

