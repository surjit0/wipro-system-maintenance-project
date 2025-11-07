#!/usr/bin/env bash
set -euo pipefail

menu() {
  cat <<'M'
=== System Maintenance Suite (Dockerized) ===
1) Update packages (container)
2) Disk cleanup   (container)
3) Backup (choose ANY Windows path)
4) Health check   (container)
5) Clean ALL logs
q) Quit
Select an option:
M
}

while true; do
  menu
  read -r choice
  case "$choice" in
    1) bash ./bin/10_pkg_update.sh ;;
    2) bash ./bin/20_disk_cleanup.sh ;;
    3) bash ./bin/41_backup_prompt.sh ;;
    4) bash ./bin/50_health_check.sh ;;
    5) bash ./bin/90_clean_logs.sh ;;
    q|Q) echo "Bye!"; exit 0 ;;
    *) echo "Invalid option" ;;
  esac
done
