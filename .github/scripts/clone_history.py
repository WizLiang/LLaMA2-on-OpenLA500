"""Merge GitHub's rolling traffic window and publish the CSV and chart together."""

import csv
import io
import json
import os
import subprocess
import sys
from base64 import b64decode
from datetime import date, datetime, timedelta, timezone
from html import escape
from pathlib import Path


DIRECTORY = "doc/traffic"
CSV_PATH = f"{DIRECTORY}/daily.csv"
CHART_PATH = f"{DIRECTORY}/cumulative.svg"


def merge_window(previous, snapshot, today, metric="clones", unique_column="unique_cloners"):
    rows = {}
    for row in csv.DictReader(io.StringIO(previous)):
        rows[date.fromisoformat(row["date_utc"])] = (int(row[metric]), int(row[unique_column]))

    # The current UTC day and the oldest edge of a rolling window can be partial.
    first = today - timedelta(days=13)
    for offset in range(13):
        rows[first + timedelta(days=offset)] = (0, 0)
    for item in snapshot[metric]:
        day = date.fromisoformat(item["timestamp"][:10])
        if first <= day < today:
            count, uniques = item["count"], item["uniques"]
            if not 0 <= uniques <= count:
                raise ValueError(f"Invalid counts for {day}")
            rows[day] = (count, uniques)
    return dict(sorted(rows.items()))


def daily_csv(rows, metric, unique_column):
    output = io.StringIO()
    writer = csv.writer(output, lineterminator="\n")
    writer.writerow(["date_utc", metric, unique_column])
    for day, (count, uniques) in rows.items():
        writer.writerow([day, count, uniques])
    return output.getvalue()


def metric_panel(rows, title, color, offset, first, last):
    total = sum(count for count, _ in rows.values())
    week = [rows.get(last - timedelta(days=n)) for n in reversed(range(7))]
    weekly = sum(item[0] for item in week if item)
    week_label = f"近 7 日新增 {weekly:,}" if all(week) else "近 7 日记录不完整"
    parts = [f'''<g transform="translate({offset},0)">
      <rect x="1" y="1" width="438" height="326" rx="14" fill="white" stroke="#d5dee7"/>
      <rect x="23" y="24" width="5" height="18" rx="2" fill="{color}"/>
      <text x="38" y="39" class="label">{title}</text>
      <text x="24" y="91" class="total">{total:,}</text>
      <text x="413" y="85" text-anchor="end" class="label" fill="{color}">{week_label}</text>''']
    # Calendar coordinates preserve gaps if collection ever stops for more than 14 days.
    left, right, bottom, height = 46, 408, 212, 93
    scale = max(total, 1)
    for tick in sorted({0, scale // 2, scale}):
        y = bottom - height * tick / scale
        parts.append(f'<path d="M{left} {y} H{right}" stroke="#e4e9ed"/><text x="36" y="{y+4}" text-anchor="end" class="tick">{tick}</text>')
    running = 0
    previous = None
    for day, (count, _) in rows.items():
        running += count
        x = left + (right-left) * (day-first).days / max(1, (last-first).days)
        y = bottom - height * running / scale
        if previous and day - previous == timedelta(days=1):
            parts.append(f'<path d="M{prev_x:.2f} {prev_y:.2f} H{x:.2f} V{y:.2f}" fill="none" stroke="{color}" stroke-width="3" stroke-linejoin="round"/>')
        else:
            parts.append(f'<circle cx="{x:.2f}" cy="{y:.2f}" r="2.5" fill="{color}"/>')
        previous, prev_x, prev_y = day, x, y
    parts.append(f'<circle cx="{x:.2f}" cy="{y:.2f}" r="4" fill="{color}" stroke="white" stroke-width="1.5"/>')
    parts.append(f'<text x="{left}" y="235" class="tick">{first}</text><text x="{right}" y="235" text-anchor="end" class="tick">{last}</text>')
    parts.append('<path d="M24 251 H414" stroke="#e4e9ed"/><text x="24" y="276" class="tick">每日新增</text>')
    for index, item in enumerate(week):
        day = last - timedelta(days=6-index)
        x = 110 + 48 * index
        count = item[0] if item else "–"
        parts.append(f'<text x="{x}" y="276" text-anchor="middle" class="tick">{day:%m/%d}</text><text x="{x}" y="303" text-anchor="middle" font-size="18" font-weight="600" fill="{color}">{count}</text>')
    return "".join(parts) + "</g>"


def traffic_chart(clones, views):
    first = min(min(clones), min(views))
    last = max(max(clones), max(views))
    panels = metric_panel(clones, "累计克隆次数", "#007b70", 0, first, last)
    panels += metric_panel(views, "累计页面浏览量", "#465db2", 456, first, last)
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 896 328" role="img">
<title>已记录的克隆次数与浏览量，{first} 至 {last} UTC</title>
<style>text{{font-family:Inter,"Noto Sans CJK SC","Microsoft YaHei",sans-serif}} .label{{font-size:17px;font-weight:600}} .total{{font-size:50px;font-weight:700}} .tick{{font-size:13px;fill:#516276}}</style>
<g fill="#192f45">{panels}</g>
</svg>
'''


def summary(clones, views, paths, today):
    lines = [
        f"最近 14 天（GitHub 滚动窗口，{today} UTC 采集）",
        "",
        "| 活动 | 次数 | 窗口内去重数 |",
        "| --- | ---: | ---: |",
        f"| 克隆仓库 | {clones['count']} | {clones['uniques']} 位克隆者 |",
        f"| 浏览仓库页面 | {views['count']} | {views['uniques']} 位访客 |",
        "",
        "热门页面按浏览次数排列，最多展示五项。",
        "",
    ]
    if paths:
        lines.append("<table><tr><th>页面</th><th>浏览次数</th><th>独立访客</th></tr>")
        for item in sorted(paths, key=lambda p: p["count"], reverse=True)[:5]:
            path = escape(item["path"])
            lines.append(f"<tr><td><code>{path}</code></td><td>{int(item['count'])}</td><td>{int(item['uniques'])}</td></tr>")
        lines.append("</table>")
    else:
        lines.append("本次采集时 GitHub 尚无热门页面记录。")
    return "\n".join(lines)


def api(path, payload=None, method=None):
    command = ["gh", "api", f"repos/{os.environ['GITHUB_REPOSITORY']}/{path}"]
    if method:
        command.extend(["--method", method])
    if payload is not None:
        command.extend(["--input", "-"])
    response = subprocess.check_output(command, input=json.dumps(payload), text=True)
    return json.loads(response)


def publish(clones, views, paths, today):
    branch = os.environ["GITHUB_REF_NAME"]
    head = api(f"git/ref/heads/{branch}")["object"]["sha"]
    tree = api(f"git/commits/{head}")["tree"]["sha"]
    entries = api(f"contents/{DIRECTORY}?ref={head}")
    def read_file(path):
        if any(entry["path"] == path for entry in entries):
            return b64decode(api(f"contents/{path}?ref={head}")["content"]).decode()
        return ""

    clone_rows = merge_window(read_file(CSV_PATH), clones, today)
    views_path = f"{DIRECTORY}/views.csv"
    visits = merge_window(read_file(views_path), views, today, "views", "unique_visitors")
    files = {
        CSV_PATH: daily_csv(clone_rows, "clones", "unique_cloners"),
        views_path: daily_csv(visits, "views", "unique_visitors"),
        CHART_PATH: traffic_chart(clone_rows, visits),
    }
    readme = f"{DIRECTORY}/README.md"
    start = "<!-- traffic:start -->"
    end = "<!-- traffic:end -->"
    before, rest = read_file(readme).split(start)
    _, after = rest.split(end)
    files[readme] = before + start + "\n\n" + summary(clones, views, paths, today) + "\n\n" + end + after
    changes = [dict(path=path, mode="100644", type="blob", content=data) for path, data in files.items()]
    updated = api("git/trees", {"base_tree": tree, "tree": changes})["sha"]
    if updated == tree:
        return
    commit = api("git/commits", {"message": "Archive daily clone counts", "tree": updated, "parents": [head]})
    # A concurrent push fails safely. The next run re-reads the branch and window.
    api(f"git/refs/heads/{branch}", {"sha": commit["sha"], "force": False}, "PATCH")


if __name__ == "__main__":
    clones, views, paths = (json.loads(Path(arg).read_text()) for arg in sys.argv[1:])
    publish(clones, views, paths, datetime.now(timezone.utc).date())
