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


def render(rows):
    days = list(rows)
    first, last = days[0], days[-1]
    total = sum(count for count, _ in rows.values())
    running = 0
    path = []
    previous = None
    for day, (count, _) in rows.items():
        running += count
        x = 60 + 610 * (day - first).days / max(1, (last - first).days)
        y = 155 - 100 * running / max(1, total)
        consecutive = previous and (day - previous).days == 1
        path.append(f"H{x:.2f} V{y:.2f}" if consecutive else f"M{x:.2f},{y:.2f} h0.1")
        previous = day
    missing = (last - first).days + 1 - len(days)
    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 720 200" role="img">
  <title>{total} recorded clones from {first} through {last} UTC</title>
  <rect width="720" height="200" rx="8" fill="#ffffff"/>
  <g font-family="sans-serif" fill="#172f46">
    <text x="24" y="30" font-size="20">Recorded clones: {total}</text>
    <text x="688" y="30" text-anchor="end" font-size="14">Unobserved days: {missing}</text>
    <path d="M60 55 V155 H670" fill="none" stroke="#a1afbc"/>
    <text x="51" y="160" text-anchor="end">0</text>
    <text x="51" y="60" text-anchor="end">{max(total, 1)}</text>
    <path d="{' '.join(path)}" fill="none" stroke="#096b73" stroke-width="3" stroke-linecap="round"/>
    <text x="60" y="183">{first}</text>
    <text x="670" y="183" text-anchor="end">{last} UTC</text>
  </g>
</svg>
'''
    return {CSV_PATH: daily_csv(rows, "clones", "unique_cloners"), CHART_PATH: svg}


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

    files = render(merge_window(read_file(CSV_PATH), clones, today))
    views_path = f"{DIRECTORY}/views.csv"
    visits = merge_window(read_file(views_path), views, today, "views", "unique_visitors")
    files[views_path] = daily_csv(visits, "views", "unique_visitors")
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
