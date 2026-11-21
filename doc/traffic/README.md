# Clone 记录

![累计 clone 次数](cumulative.svg)

这里保存本仓库自开始记录以来的 clone 次数。首次采集成功后，上图会显示累计次数，本目录会出现按 UTC 日期排序的 `daily.csv`。每行记录当天的 clone 次数和当天去重的克隆者数；曲线只累加次数。同一人跨天 clone 会出现在多个日期的去重统计中。

任务每天北京时间 13:37 定时运行，合并 GitHub 近 14 天窗口中最近 13 个完整 UTC 日的数据。同一天重复采集时更新该行。超出窗口且没有采集过的日期会在曲线上留空。归档通过 API 更新，采集过程本身无需 clone 仓库。

## 启用

1. 在 GitHub 创建仅授权本仓库的 fine-grained personal access token，设置仓库权限 **Administration → Read-only**。
2. 打开仓库 **Settings → Secrets and variables → Actions**，将令牌存为 repository secret `TRAFFIC_TOKEN`。
3. 在 **Actions → Archive clone history → Run workflow** 选择默认分支，运行首次采集。任务用 GitHub Actions 自带的令牌提交 CSV 和曲线，需要允许该工作流写入默认分支。

数据来源见 [GitHub Traffic API](https://docs.github.com/en/rest/metrics/traffic#get-repository-clones)。
