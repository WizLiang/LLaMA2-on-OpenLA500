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
