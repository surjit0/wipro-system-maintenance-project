#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/00_common.sh"
require_cmd apk
log "Updating apk index & upgrading packages (inside container)…"
apk update | tee -a "$LOG_DIR/apk.log"
apk upgrade --no-cache | tee -a "$LOG_DIR/apk.log"
log "Packages are up to date."
