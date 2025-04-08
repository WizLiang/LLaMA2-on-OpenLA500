# Dev_soc
大部分按照demo完成了soc_top的连接。跑完了Helloword以及Coremark
![Screenshot from 2025-04-08 10-08-24](https://github.com/user-attachments/assets/0864f55d-5077-4077-84f8-3ef0180d349e)

## 代码修改
### .gitnore添加了
/vivado24.2/ #这是我自己的vivado启动目录，结果他运行.tcl脚本之后，project创建在/fpga/中，所以需要将/fpga/也加进去
/rtl/ip/PLL_2019_2/#避免了vivado版本问题，
/fpga/

### rtl/ip/confreg/confreg.v
注释 无用信号input [4 :0] s_wid,

## 注意事项
### critcal warning
soc_top中并没有对wire sys_clk 和 cpu_clk进行引出，可能导致critical warning，但是我在第一次编译的时候并没有出现报这个warning，而在我将.xdc文件移位之后出现ip报错，重新升级之后才出现，故怀疑也可能是pll_ip的问题，故没有修改.xdc

### IP core
由于clk_pll不再跟踪，所以第一次创建工程的时候可能需要使用先前版本的xci

# Github Tips
## 更新本地仓库

在开始任何新工作之前，先执行 `git pull`（或从远程仓库拉取最新代码）来确保你的本地仓库与远程仓库保持同步，避免因为代码版本差异而产生冲突。


`git pull origin main  # 或者你所在仓库使用的主分支名称`

## 创建新分支
为了保持主分支的稳定性，建议在本地创建一个新的分支来进行修改。创建分支的命令通常是：

`git checkout -b feature/your-feature-name`
这里的 feature/your-feature-name 可以根据你所要开发的功能或任务进行命名。这样可以让团队成员一眼看出该分支的目的。

## 开发和提交代码
在新分支上进行开发，完成代码修改后，通过以下命令添加和提交改动：

`git add .`

`git commit -m "描述你的改动"`

确保你的提交信息清晰、简洁地描述了改动的目的和内容，这有助于代码审核和后续维护。

定期同步远程更新
如果开发周期较长，建议定期将主分支上的最新改动合并到你的分支上，以避免日后合并时出现较大的冲突：

`git pull origin main  # 拉取主分支最新代码`(这里main 可能是master,具体需要看看git branch）

`git merge main       # 将主分支合并到当前分支`

## 推送分支并创建 Pull Request
开发完成后，将你的分支推送到远程仓库：
`git push -u origin feature/your-feature-name`
然后在 GitHub 上创建 Pull Request，让团队成员进行代码审核、讨论和确认合并。
