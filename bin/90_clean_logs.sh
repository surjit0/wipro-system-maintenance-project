#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/00_common.sh"

log "Cleaning all logs in /suite/logs ..."
# Remove everything in logs, but recreate backups folder
rm -rf "$LOG_DIR"/*
mkdir -p "$LOG_DIR/backups"
log "Logs cleaned. Kept empty backups/ folder."
