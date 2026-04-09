# Ottie Server — 项目状态

> 最后更新：2026-04-09

## 当前进度

| 任务 | 状态 | 说明 |
|------|------|------|
| docker-compose.yml | ✅ | tuwunel + caddy (production profile) |
| tuwunel.toml | ✅ | server_name = ottie.claws.company |
| Caddyfile | ✅ | ottie.claws.company 反向代理 |
| setup.sh | ✅ | local/production 模式 |
| Cloudflare Named Tunnel | ✅ | 永久 ID: 59e84c5a，不会变 |
| 公网可达 | ✅ | https://ottie.claws.company |
| 联邦 | ✅ 已开启 | allow_federation = true |
| 注册 | ✅ | token: ottie-dev-token |

## ⚠️ 临时域名警告

```
当前域名：ottie.claws.company（临时）
最终域名：ottie.app 或其他 ottie 品牌域名
迁移影响：所有用户 ID（@user:ottie.claws.company）需要重新注册
server_name 一旦设定不可更改，迁移 = 重建数据库
```

## 启动命令

```bash
# 1. 启动 Tuwunel
cd ~/Developer/ottie/server && docker compose up -d tuwunel

# 2. 启动固定 Tunnel（每次开机运行）
cloudflared tunnel run ottie-matrix
```

## 已有用户

| 用户名 | Matrix ID |
|--------|-----------|
| alice | @alice:ottie.claws.company |
| bob | @bob:ottie.claws.company |

## 如何继续

```bash
cd ~/Developer/ottie/server
claude
> 读 STATUS.md 和 README.md
```
