安装GNU交叉工具链与C库的方案

* Step1：修改init.sh中的 CICIEC_WINDOWS_HOME 路径为windows下的发布包路径

* Step2：在终端中执行命令
./init.sh

* Step3: 测试是否安装成功
输入命令
loongarch32r-linux-gnusf-gcc --version
若出现gcc版本信息则为安装成功


* tips: 修改调用newlib的方法（一般情况下不需要修改）：

Makefile默认使用picolib，若使用newlib，首先将`examples/*/Makefile`文件中的

`PICOLIBC_DIR=../../../toolchains/picolibc`

改为

`PICOLIBC_DIR=../../../toolchains/newlib`

之后将`bsp/common.mk`文件中`LDFLAGS`的

`-lsemihost` 

替换为

`-lgloss`
 
完成修改，此时调用的是newlib库

