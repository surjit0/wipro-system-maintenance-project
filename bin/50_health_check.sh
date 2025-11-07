#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/00_common.sh"

require_cmd top
require_cmd df

CPU_LOAD="$(top -bn1 | awk '/load average/ {print $(NF-2), $(NF-1), $NF}' | tr -d ',')"
DISK="$(df -h | awk 'NR==1 || /^\/dev/ {print $0}')"
MEM="$(awk '/MemTotal:/{t=$2} /MemAvailable:/{a=$2} END{printf("%.1f%% used",(t-a)/t*100)}' /proc/meminfo)"

log "=== Health Check (container) ==="
log "Load averages (1m 5m 15m): $CPU_LOAD"
log "Memory usage: $MEM"
log "Disks:"
printf "%s\n" "$DISK" | tee -a "$LOG_DIR/main.log"
