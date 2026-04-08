#!/usr/bin/env bash
set -euo pipefail

DOMAIN="${1:-localhost}"
MODE="${2:-local}"

echo "=== Ottie Server Setup ==="
echo "Domain: $DOMAIN"
echo "Mode:   $MODE"
echo ""

# 检查 Docker
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed"
    exit 1
fi

if [ "$MODE" = "local" ]; then
    echo "Starting in local mode (no Caddy, no TLS)..."

    # 更新 tuwunel.toml 的 server_name
    sed -i.bak "s/server_name = .*/server_name = \"$DOMAIN\"/" tuwunel.toml
    rm -f tuwunel.toml.bak

    # 只启动 tuwunel
    docker compose up -d tuwunel

    echo ""
    echo "Waiting for Tuwunel to start..."
    sleep 3

    # 验证
    if curl -sf http://localhost:8008/_matrix/client/versions > /dev/null 2>&1; then
        echo "Tuwunel is running!"
        echo "Matrix API: http://localhost:8008"
        echo ""
        echo "To create a test user, register via Element Web or use the API:"
        echo "  curl -X POST http://localhost:8008/_matrix/client/v3/register \\"
        echo "    -H 'Content-Type: application/json' \\"
        echo "    -d '{\"username\":\"test\",\"password\":\"testpass\",\"auth\":{\"type\":\"m.login.dummy\"}}'"
    else
        echo "Tuwunel may still be starting. Check: docker compose logs tuwunel"
    fi

elif [ "$MODE" = "production" ]; then
    echo "Starting in production mode with Caddy..."

    sed -i.bak "s/server_name = .*/server_name = \"$DOMAIN\"/" tuwunel.toml
    sed -i.bak "s/ottie\.app/$DOMAIN/g" Caddyfile
    rm -f tuwunel.toml.bak Caddyfile.bak

    sed -i.bak 's/allow_federation = false/allow_federation = true/' tuwunel.toml
    rm -f tuwunel.toml.bak

    docker compose up -d

    echo "Production server starting at https://$DOMAIN"
else
    echo "Usage: ./setup.sh [domain] [local|production]"
    echo "  ./setup.sh                    # localhost, local mode"
    echo "  ./setup.sh ottie.app production  # production with Caddy + TLS"
    exit 1
fi
