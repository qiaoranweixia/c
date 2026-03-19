#!/bin/bash
# 🐷 GitHub 保活自动提交脚本
# 随机提交 3-5 次，检查今天是否已提交

cd "$(dirname "$0")"

# 设置时区为中国时区
export TZ="Asia/Shanghai"

# 检查是否在 Git 仓库中
if [ ! -d ".git" ]; then
    echo "❌ 错误：不在 Git 仓库中"
    exit 1
fi

# 检查是否有远程仓库
if ! git remote -v | grep -q origin; then
    echo "❌ 错误：未配置远程仓库"
    echo "请运行：git remote add origin https://github.com/用户名/仓库名.git"
    exit 1
fi

# 检查今天是否已提交（根据本地时区）
TODAY=$(date '+%Y-%m-%d')
LAST_COMMIT_DATE=$(cat .last_commit 2>/dev/null | tail -1 | cut -d' ' -f1)

if [ "$LAST_COMMIT_DATE" = "$TODAY" ]; then
    echo "✅ 今天已经提交过了 ($LAST_COMMIT_DATE)"
    echo "🎉 今天也是绿意盎然的一天 🟩"
    exit 0
fi

# 生成随机提交次数 (3-5 次)
COMMIT_COUNT=$((RANDOM % 3 + 3))
echo "🎲 随机生成提交次数：$COMMIT_COUNT 次 (时区：Asia/Shanghai)"
echo ""

# 循环提交
for i in $(seq 1 $COMMIT_COUNT); do
    echo "🔄 执行第 $i/$COMMIT_COUNT 次提交..."
    
    # 更新时间戳
    echo "$(date '+%Y-%m-%d %H:%M:%S')" >> .last_commit
    
    # Git 提交（使用本地时区）
    git add .last_commit
    GIT_AUTHOR_DATE="$(date -Iseconds)" GIT_COMMITTER_DATE="$(date -Iseconds)" \
        git commit -m "chore: 每日保活 #$i/$COMMIT_COUNT $(date '+%Y-%m-%d %H:%M:%S')"
    
    # 推送
    if git push origin main 2>/dev/null; then
        echo "✅ 第 $i 次提交成功"
    else
        echo "⚠️ 第 $i 次提交失败（可能是网络问题）"
    fi
    
    # 等待 2-4 秒随机间隔
    WAIT_TIME=$((RANDOM % 3 + 2))
    if [ $i -lt $COMMIT_COUNT ]; then
        echo "⏳ 等待 $WAIT_TIME 秒..."
        sleep $WAIT_TIME
    fi
done

echo ""
echo "🎉 GitHub 保活完成！今日提交 $COMMIT_COUNT 次 🟩🟩🟩"
echo "📊 继续保持你的贡献绿格子吧！"
echo "🕐 时区：Asia/Shanghai (UTC+8)"
