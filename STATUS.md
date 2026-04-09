# Ottie Server — 项目状态

> 最后更新：2026-04-09

## 当前部署

| 项目 | 状态 |
|------|------|
| 域名 | ✅ ottie.claws.company（临时，最终改为 ottie 品牌域名） |
| Cloudflare Named Tunnel | ✅ 永久 ID: 59e84c5a |
| Tuwunel | ✅ 运行中 |
| 联邦 | ✅ allow_federation = true |
| Google OIDC | ✅ 已启用 |
| .well-known | ✅ Element 自动发现 |
| 注册 | ✅ token: ottie-dev-token |

## 登录方式

1. **用户名 + 密码** — 注册时设置
2. **Google 账号** — SSO 一键登录

## 启动命令

```bash
cd ~/Developer/ottie/server
docker compose up -d tuwunel
cloudflared tunnel run ottie-matrix
```

## ⚠️ 临时域名

当前域名 ottie.claws.company 是临时的。迁移到正式域名需要重建数据库。

## 如何继续

```bash
cd ~/Developer/ottie/server
claude
> 读 STATUS.md
```
