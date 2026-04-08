# Ottie Server — 项目状态

> 最后更新：2026-04-08 21:10

## 当前进度

| 任务 | 状态 |
|------|------|
| docker-compose.yml | ✅ 完成 |
| tuwunel.toml | ✅ 完成（localhost 模式） |
| Caddyfile | ✅ 完成（生产模板） |
| setup.sh | ✅ 完成 |
| 本地验证 | ✅ 两用户互发消息 |
| 桌面端连接 | ✅ 登录 + 收发 + LLM 改写 |

## 当前配置

```
server_name: localhost
端口: 8008
注册 token: ottie-dev-token
联邦: 关闭
数据: Docker volume server_tuwunel-data
```

## 已有用户

| 用户名 | 密码 | Matrix ID | 说明 |
|--------|------|-----------|------|
| alice | alice123 | @alice:localhost | 主测试用户 |
| bob | bob123 | @bob:localhost | 测试对话方 |
| testa_xxxx | testpass123 | @testa_xxxx:localhost | 自动测试创建 |

## 启动命令

```bash
cd ~/Developer/ottie/server
docker compose up -d tuwunel
curl http://localhost:8008/_matrix/client/versions  # 验证
```

## 下一步

### 近期
- 无（服务器稳定运行中，支持开发测试）

### 中期（公网部署）
- [ ] 买域名
- [ ] 租 VPS（2C4G 够用）
- [ ] DNS 指向 VPS
- [ ] tuwunel.toml：server_name 改为域名
- [ ] 启用 Caddy（docker compose up -d）
- [ ] 开启联邦（allow_federation = true）
- [ ] 配置 Google OIDC

### 运维
- [ ] 数据备份
- [ ] 日志监控
- [ ] 自动重启已配置（unless-stopped）

## 如何继续开发

```bash
cd ~/Developer/ottie/server
claude
> 读 STATUS.md 和 CLAUDE.md，准备部署到公网
```
