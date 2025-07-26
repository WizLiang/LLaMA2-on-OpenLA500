# Circuir Breaker 

队伍编号：CICC0900647

系统加构图如下

![image-20250726110636298](/home/wizard/.config/Typora/typora-user-images/image-20250726110636298.png)


目前已经按照复赛要求，通过了（修改之后的）中断测试还有之后的RT-Tread的启动。
![image](https://github.com/user-attachments/assets/5c8dc6a2-f999-4cec-af63-2b5c56bcbea9)



## 仓库架构

基本同官方，`sdk/software/apps`为测试C语言



## 硬件代码

AI加速器位于 Co_processor在中

其余基本不变




## 软件部分
llama2.c在sdk/software/apps/runc中，make即可

# Tips of Dev
1. 记得创建自己的分支，尽量有统一的命名规范
1. 适当添加描述
1. 注意git pull origin master
