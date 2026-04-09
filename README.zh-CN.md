# Ottie Server

[English](./README.md)

`server` 是 Ottie 的通信骨干仓库。

如果说 Ottie 想成为未来人类与 AI 通信的入口，那么这个仓库提供的就是底层自部署 Matrix 基础设施，让这种通信具备可传输、可互通、未来可联邦的能力。

当前这个仓库主要围绕 Tuwunel 展开，用于本地开发联调和未来的自部署上线。

## 这个仓库是做什么的

如果你想做下面这些事，就会用到这个仓库：

- 在本地运行 Ottie 对接自己的 Matrix 后端
- 在不依赖外部基础设施的情况下联调桌面端和 Agent 流程
- 为未来公网部署和联邦互通做准备
- 理解 Ottie 所依赖的通信层

这个仓库不包含桌面端、移动端，也不包含默认 Agent 的界面逻辑。

## 当前阶段

这个仓库已经支持：

- 本地开发模式启动
- 面向开发环境的 Tuwunel 配置
- 本地 Matrix 注册与消息联调
- 基于 Caddy 的生产代理模板

详细进度见 [STATUS.md](./STATUS.md)。

## 环境要求

- Docker
- curl（推荐用于验证）

## 本地开发

先 clone 仓库：

```bash
git clone https://github.com/ottie-im/server
cd server
```

以本地开发模式启动：

```bash
./setup.sh localhost local
```

验证 Matrix API 是否可用：

```bash
curl http://localhost:8008/_matrix/client/versions
```

## 生产部署

以生产模式启动：

```bash
./setup.sh ottie.app production
```

生产模式的目标是：

- 把 Matrix `server_name` 设置成你的域名
- 打开 federation
- 准备好基于 Caddy 的反向代理配置

在真正用于公网部署之前，你仍然应该手动检查生成后的配置。

## 当前默认开发配置

当前默认开发配置包括：

- `server_name = localhost`
- `port = 8008`
- `registration_token = ottie-dev-token`
- `allow_federation = false`

## 仓库文件

- `docker-compose.yml`：服务编排定义
- `tuwunel.toml`：Tuwunel 配置
- `Caddyfile`：生产反向代理模板
- `setup.sh`：本地 / 生产启动辅助脚本

## 相关仓库

Ottie 当前由三个仓库组成：

- `ottie`：主应用仓库
- `ottie-agent`：默认 Agent 实现仓库
- `server`：Matrix / 部署仓库

## License

MIT
