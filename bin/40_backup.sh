#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/00_common.sh"

CONF="$ROOT_DIR/config/backup.conf"
source "$CONF"

mkdir -p "$DEST_DIR"
STAMP="$(date '+%Y%m%d_%H%M%S')"
ARCHIVE="$DEST_DIR/backup_$STAMP.tar.gz"

log "Creating backup: $ARCHIVE"
tar -czf "$ARCHIVE" $INCLUDE_PATHS 2>>"$LOG_DIR/backup.err" || true
log "Backup created."

log "Applying retention (keep $RETENTION)…"
ls -1t "$DEST_DIR"/backup_*.tar.gz 2>/dev/null | tail -n +$((RETENTION+1)) | xargs -r rm -f
log "Backup retention done."
