#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/00_common.sh"

log "Cleaning /tmp and rotating suite logs (inside container)…"
rm -rf /tmp/* 2>/dev/null || true

TARGET="$LOG_DIR/main.log"; MAX=5
if [[ -f "$TARGET" ]]; then
  for i in $(seq $((MAX-1)) -1 1); do
    [[ -f "$TARGET.$i" ]] && mv "$TARGET.$i" "$TARGET.$((i+1))"
  done
  cp "$TARGET" "$TARGET.1"
  : > "$TARGET"
fi
log "Cleanup complete."
