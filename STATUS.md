# Ottie Server — 项目状态

> 最后更新：2026-04-08

## 当前进度

| 任务 | 状态 |
|------|------|
| docker-compose.yml | ✅ 完成 |
| tuwunel.toml | ✅ 完成 |
| Caddyfile | ✅ 完成（生产环境用） |
| setup.sh | ✅ 完成 |
| 本地验证：两用户互发消息 | ✅ 通过 |

## 当前配置

- server_name: localhost
- 端口: 8008
- 注册 token: `ottie-dev-token`
- 联邦: 关闭（本地开发不需要）
- 数据持久化: Docker volume `server_tuwunel-data`

## 重要：启动命令

```bash
cd ~/Developer/ottie/server
docker compose up -d tuwunel
```

验证：
```bash
curl http://localhost:8008/_matrix/client/versions
```

## 下一步

Phase 3+ 之后再做：
- [ ] 部署到云服务器
- [ ] 买域名，配置 Caddy TLS
- [ ] 开启联邦
- [ ] Google OIDC 登录

## 测试用户

在 Phase 1 测试中创建的用户（alice/bob）仍然存在。
注册新用户需要 token `ottie-dev-token`。
