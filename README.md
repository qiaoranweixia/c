# GitHub 保活脚本 🐷

自动保持 GitHub 贡献绿格子活跃的本地脚本。

## 用法

```bash
./contribute.sh
```

## 功能

- 检查今天是否已提交，避免重复
- 随机提交 3-5 次，间隔 2-4 秒
- 自动推送到 GitHub 远程仓库
- 使用北京时间 (UTC+8)

## 设置

1. 在 GitHub 创建仓库
2. 配置远程仓库：
```bash
git remote add origin git@github.com:用户名/仓库名.git
git branch -M main
git push -u origin main
```

3. 需要配置 SSH 密钥或 HTTPS 认证

## 定时执行（可选）

添加到 crontab 每天自动运行：
```bash
crontab -e
# 添加：0 9 * * * /path/to/github-activity/contribute.sh
```

---
保持你的贡献图绿油油 🟩
