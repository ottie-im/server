# Ottie Server

[简体中文](./README.zh-CN.md)

`server` is the communication backbone for Ottie.

If Ottie is the interface for future communication between humans and AI, this repository provides the self-hosted Matrix foundation that makes that communication transportable, interoperable, and eventually federated.

Today, this repository is centered around Tuwunel for local development and future self-hosted deployment.

## What This Repository Is For

Use this repository if you want to:

- run Ottie locally against your own Matrix backend
- test desktop and agent flows without external infrastructure
- prepare for future public deployment and federation
- understand the communication layer Ottie is built on

This repository does not contain the desktop app, mobile app, or the default agent UI logic.

## Current Stage

This repository already supports:

- local development startup
- Tuwunel configuration for development
- local Matrix registration and message testing
- a production-oriented reverse proxy template with Caddy

For detailed progress, see [STATUS.md](./STATUS.md).

## Requirements

- Docker
- curl (recommended for verification)

## Local Development

Clone the repository:

```bash
git clone https://github.com/ottie-im/server
cd server
```

Start in local development mode:

```bash
./setup.sh localhost local
```

Verify the Matrix API is available:

```bash
curl http://localhost:8008/_matrix/client/versions
```

## Production Deployment

Start in production mode:

```bash
./setup.sh ottie.app production
```

Production mode is intended to:

- set the Matrix `server_name` to your domain
- enable federation
- prepare Caddy-based reverse proxying

You should still review the generated configuration before using it in a real deployment.

## Default Development Configuration

Current default development settings:

- `server_name = localhost`
- `port = 8008`
- `registration_token = ottie-dev-token`
- `allow_federation = false`

## Repository Files

- `docker-compose.yml`: service definition
- `tuwunel.toml`: Tuwunel configuration
- `Caddyfile`: production reverse proxy template
- `setup.sh`: helper for local / production startup

## Related Repositories

Ottie is organized as three repositories:

- `ottie`: main application repository
- `ottie-agent`: default agent implementation repository
- `server`: Matrix / deployment repository

## License

MIT
