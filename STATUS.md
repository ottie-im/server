# Ottie Server — 项目状态

> 最后更新：2026-04-08

## 当前进度

| 任务 | 状态 |
|------|------|
| docker-compose.yml | ✅ 完成 |
| tuwunel.toml | ✅ 完成（localhost 模式） |
| Caddyfile | ✅ 完成（生产模板，未启用） |
| setup.sh | ✅ 完成（local/production 两种模式） |
| 本地验证 | ✅ 两用户互发消息通过 |
| 桌面端连接 | ✅ 真实登录 + 收发消息 |

## 当前配置

- server_name: `localhost`
- 端口: `8008`
- 注册 token: `ottie-dev-token`
- 联邦: 关闭
- 数据: Docker volume `server_tuwunel-data`（重启不丢数据）
- 注意：需要 `-c /etc/tuwunel/tuwunel.toml` 参数（docker-compose.yml 已配置）

## 已有用户

| 用户名 | 密码 | Matrix ID |
|--------|------|-----------|
| alice | alice123 | @alice:localhost |
| bob | bob123 | @bob:localhost |
| 测试用户 | 各 test run 自动创建 | @testa_xxxx:localhost |

## 启动命令

```bash
cd ~/Developer/ottie/server
docker compose up -d tuwunel
```

验证：
```bash
curl http://localhost:8008/_matrix/client/versions
```

注册新用户：
```bash
# Step 1: 获取 session
curl -X POST http://localhost:8008/_matrix/client/v3/register \
  -H 'Content-Type: application/json' \
  -d '{"username":"NEW_USER","password":"PASSWORD","auth":{"type":"m.login.dummy"}}'

# Step 2: 用 session 和 token 注册
curl -X POST http://localhost:8008/_matrix/client/v3/register \
  -H 'Content-Type: application/json' \
  -d '{"username":"NEW_USER","password":"PASSWORD","auth":{"type":"m.login.registration_token","token":"ottie-dev-token","session":"SESSION_FROM_STEP1"}}'
```

## 下一步

### 上线必须
- [ ] 买域名（如 ottie.app）
- [ ] 租 VPS（推荐 2C4G，Tuwunel 很轻量）
- [ ] 配置 DNS 指向 VPS
- [ ] 修改 tuwunel.toml：server_name 改为域名
- [ ] 启用 Caddy（自动 TLS）
- [ ] 开启联邦（allow_federation = true）
- [ ] 配置 Google OIDC 登录

### 运维相关
- [ ] 数据备份策略
- [ ] 日志监控
- [ ] 自动重启（docker restart policy 已配置 unless-stopped）

## 如何继续开发

```bash
cd ~/Developer/ottie/server
claude
> 读 STATUS.md 和 CLAUDE.md，准备部署到公网
```
