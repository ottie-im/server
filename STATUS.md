# Ottie Server — 项目状态

> 最后更新：2026-04-08 13:52 PDT

## 当前进度

| 任务 | 状态 | 说明 |
|------|------|------|
| `docker-compose.yml` | ✅ 完成 | Tuwunel 服务编排已可用 |
| `tuwunel.toml` | ✅ 完成（localhost 模式） | 当前默认开发配置为 `localhost:8008` |
| `Caddyfile` | ✅ 完成（生产模板） | 仍是模板，尚未代表公网已部署 |
| `setup.sh` | ✅ 完成 | 使用位置参数：`./setup.sh <domain> <local|production>` |
| 本地验证 | ✅ 历史验证完成 | 两用户互发消息已验证过 |
| 桌面端连接 | ✅ 历史验证完成 | 桌面端登录 + 收发 + LLM 改写链路已验证过 |
| 公网部署 | ⏳ 未开始 | 还没有域名 / VPS / 正式联邦 |

## 给后续 AI 的短结论

- **本地开发环境是可用的**
- **公网部署还没做**
- **`Caddyfile` 是模板，不代表已经上线**
- **推荐启动命令是 `./setup.sh localhost local`，不是 README 早期旧写法里的 `--domain` 参数**

## 当前配置

```text
server_name: localhost
端口: 8008
注册 token: ottie-dev-token
联邦: 关闭
数据: Docker volume server_tuwunel-data
```

## 已有用户（历史开发环境）

| 用户名 | 密码 | Matrix ID | 说明 |
|--------|------|-----------|------|
| alice | alice123 | @alice:localhost | 主测试用户 |
| bob | bob123 | @bob:localhost | 测试对话方 |
| testa_xxxx | testpass123 | @testa_xxxx:localhost | 自动测试创建 |

## 启动命令

### 推荐方式

```bash
cd ~/Developer/ottie/server
./setup.sh localhost local
curl http://localhost:8008/_matrix/client/versions
```

### 直接方式

```bash
cd ~/Developer/ottie/server
docker compose up -d tuwunel
curl http://localhost:8008/_matrix/client/versions
```

## 当前真实状态

- 本仓库已经足够支撑主项目的本地开发与联调
- 当前仍然是 **localhost 开发环境**
- federation 仍然关闭
- 生产模式脚本和 Caddy 模板都已存在，但还没有“真实公网已部署”的证据记录在仓库里

## 下一步

### 近期

- [ ] 买域名
- [ ] 租 VPS（2C4G 足够）
- [ ] DNS 指向 VPS
- [ ] 用真实域名跑 `./setup.sh <domain> production`
- [ ] 核对 Caddy / TLS / 防火墙 / 8448 暴露
- [ ] 开启联邦（`allow_federation = true`）

### 中期

- [ ] 配置 Google OIDC
- [ ] 数据备份
- [ ] 日志监控
- [ ] 把上线记录和验收步骤补进 `STATUS.md`

### 现有保障

- [x] Docker volume 持久化
- [x] `restart: unless-stopped`

## 如何继续开发

```bash
cd ~/Developer/ottie/server
claude
> 先读 STATUS.md 和 README.md
> 如果目标是公网部署，再检查 Caddyfile、tuwunel.toml、setup.sh
```
