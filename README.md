# Circuir Breaker 

队伍编号：CICC0900647

系统加构图如下

<img width="953" height="578" alt="image" src="https://github.com/user-attachments/assets/16e24b3e-ce03-4ada-97e2-af41a4afb115" />



目前已经按照复赛要求，通过了（修改之后的）中断测试还有之后的RT-Tread的启动。


## 仓库架构

基本同官方


### bitstreams
soc_top.bit是完整的soc bitstream，能通过官方测试，也能完成llama2的推理
soc_top1.bit为led灯显示加速器状态，由于功能测试需要测试led，故做备份。


## 硬件代码

AI加速器位于 Co_processor在中

其余基本不变




## 软件部分
llama2.c在sdk/software/apps/runc中，make即可

# Tips of Dev
1. 记得创建自己的分支，尽量有统一的命名规范
1. 适当添加描述
1. 注意git pull origin master
