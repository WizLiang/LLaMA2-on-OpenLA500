# 仓库访问与克隆统计

![累计克隆次数和页面浏览量，以及近七日每日新增](cumulative.svg)

两条曲线分别累加已有记录的完整 UTC 日，每个日期只计一次。图下方列出最近七天的每日增量，缺失日用破折号表示，累计曲线在缺口处断开。[每日克隆数据](daily.csv) · [每日浏览数据](views.csv)

## 最近 14 天

<!-- traffic:start -->

最近 14 天（GitHub 滚动窗口，2026-11-25 UTC 采集）

| 活动 | 次数 | 窗口内去重数 |
| --- | ---: | ---: |
| 克隆仓库 | 115 | 65 位克隆者 |
| 浏览仓库页面 | 34 | 4 位访客 |

热门页面按浏览次数排列，最多展示五项。

<table><tr><th>页面</th><th>浏览次数</th><th>独立访客</th></tr>
<tr><td><code>/WizLiang/LLaMA2-on-OpenLA500</code></td><td>12</td><td>4</td></tr>
<tr><td><code>/WizLiang/LLaMA2-on-OpenLA500/actions/workflows/clone-history.yml</code></td><td>4</td><td>1</td></tr>
<tr><td><code>/WizLiang/LLaMA2-on-OpenLA500/actions/runs/44917700070</code></td><td>3</td><td>1</td></tr>
<tr><td><code>/WizLiang/LLaMA2-on-OpenLA500/forks</code></td><td>3</td><td>1</td></tr>
<tr><td><code>/WizLiang/LLaMA2-on-OpenLA500/graphs/contributors</code></td><td>2</td><td>1</td></tr>
</table>

<!-- traffic:end -->

上表来自 GitHub 的滚动窗口，包含当日已上报的活动。独立访客和克隆者采用 GitHub 对整个窗口的去重结果；逐日去重数相加会重复计算跨天访问的人。

任务每天北京时间 13:37 定时运行，合并 GitHub 近 14 天窗口中最近 13 个完整 UTC 日的数据。同一天重复采集时更新该行。超出窗口且没有采集过的日期会在曲线上留空。归档通过 API 更新，采集过程本身无需 clone 仓库。

## 启用

1. 在 GitHub 创建仅授权本仓库的 fine-grained personal access token，设置仓库权限 **Administration → Read-only**。
2. 打开仓库 **Settings → Secrets and variables → Actions**，将令牌存为 repository secret `TRAFFIC_TOKEN`。
3. 在 **Actions → Archive clone history → Run workflow** 选择默认分支，运行首次采集。任务用 GitHub Actions 自带的令牌提交 CSV 和曲线，需要允许该工作流写入默认分支。

数据来源见 [GitHub Traffic API](https://docs.github.com/en/rest/metrics/traffic#get-repository-clones)。
