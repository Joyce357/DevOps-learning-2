#!/bin/zsh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
WEB_PORT=5500
API_PORT=8000

cleanup() {
  if [[ -n "${WEB_PID:-}" ]]; then
    kill "$WEB_PID" >/dev/null 2>&1 || true
  fi

  if [[ -n "${API_PID:-}" ]]; then
    kill "$API_PID" >/dev/null 2>&1 || true
  fi
}

trap cleanup EXIT INT TERM

python3 "$ROOT_DIR/api_server.py" &
API_PID=$!

python3 -m http.server "$WEB_PORT" --directory "$ROOT_DIR/web" &
WEB_PID=$!

cat <<INFO

CORS demo is running.

Frontend: http://localhost:${WEB_PORT}
API:      http://localhost:${API_PORT}

Press Ctrl+C to stop both servers.
INFO

wait
