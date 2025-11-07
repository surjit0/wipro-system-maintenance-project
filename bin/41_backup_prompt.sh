#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/00_common.sh"

DEST_DIR="/suite/logs/backups"
mkdir -p "$DEST_DIR"

echo "Enter full Windows path to back up (e.g. C:\\Users\\SURJEET\\Desktop or C:\\Users\\SURJEET\\Downloads\\test-src):"
read -r SRC_WIN

# Convert Windows path (C:\Users\SURJEET\...) → /host equivalent
SRC=$(echo "$SRC_WIN" | sed -E 's|^[Cc]:\\Users\\SURJEET(.*)|/host\1|' | tr '\\' '/')

if [[ -z "${SRC:-}" ]]; then
  log "No path entered. Aborting."
  exit 0
fi

if [[ ! -e "$SRC" ]]; then
  log "Converted path does not exist inside container: $SRC"
  log "Tip: Run with -v \"C:\\Users\\SURJEET:/host:ro\" so files are visible."
  exit 0
fi

ADDED_SOMETHING=0
if [[ -d "$SRC" ]]; then
  if find "$SRC" -mindepth 1 -print -quit | grep -q .; then
    ADDED_SOMETHING=1
  fi
elif [[ -f "$SRC" ]]; then
  ADDED_SOMETHING=1
fi

if [[ $ADDED_SOMETHING -eq 0 ]]; then
  log "Nothing to back up at $SRC. Aborting."
  exit 0
fi

STAMP="$(date '+%Y%m%d_%H%M%S')"
ARCHIVE="$DEST_DIR/backup_$STAMP.tar.gz"

log "Backing up $SRC_WIN → $ARCHIVE"
tar -czvf "$ARCHIVE" "$SRC" 2>>"$LOG_DIR/backup.err" | tee -a "$LOG_DIR/backup.list"
log "Backup created successfully."
