#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="/suite"
LOG_DIR="$ROOT_DIR/logs"
mkdir -p "$LOG_DIR"
log() { printf "[%s] %s\n" "$(date '+%F %T')" "$*" | tee -a "$LOG_DIR/main.log"; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || { log "Missing command: $1"; exit 1; }; }
