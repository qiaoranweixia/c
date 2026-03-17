#!/bin/bash
# GitHub 每日贡献脚本

DATE=$(date +"%Y-%m-%d %H:%M:%S")
TIMESTAMP_FILE=".last_commit"

echo "$DATE" > "$TIMESTAMP_FILE"
git add "$TIMESTAMP_FILE"
git commit -m "chore: daily activity check-in [$DATE]"
git push origin main

echo "✅ 今日贡献已提交！"
