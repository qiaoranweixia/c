# GitHub Daily Activity 🐷

自动保持 GitHub 贡献绿格子活跃的项目

## 用法

### 手动提交
```bash
./contribute.sh
```

### 自动提交（GitHub Actions）
项目包含 GitHub Actions 工作流，每天自动提交一次。

## 设置步骤

1. 在 GitHub 上创建新仓库（公开或私有均可）
2. 本地推送：
```bash
git remote add origin https://github.com/你的用户名/仓库名.git
git branch -M main
git push -u origin main
```
3. 启用 GitHub Actions（如果仓库默认禁用）

## 说明

- 提交内容：更新时间戳文件
- 提交频率：每日一次
- 时区：UTC+8（中国）

---
_保持你的贡献图绿油油 🟩_
