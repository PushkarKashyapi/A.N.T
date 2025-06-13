!/bin/bash

 Thresholds
THRESHOLD_CPU=1
THRESHOLD_MEM=1  


RED="\033[1;31m"
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
NC="\033[0m"   No Color

echo -e "${GREEN} Running system health check at $(date)${NC}"


ps -eo pid,comm,%cpu,%mem,rss --sort=-%cpu | head -n 10 | while read pid comm cpu mem rss; do

  if [[ "$pid" == "PID" ]]; then
    continue
  fi

  
  if (( $(echo "$cpu > $THRESHOLD_CPU" | bc -l) )) || [[ "$rss" -gt "$THRESHOLD_MEM" ]]; then
    USAGE_TYPE=""





    if (( $(echo "$cpu > $THRESHOLD_CPU" | bc -l) )); then
      USAGE_TYPE="CPU"

 MESSAGE="${RED} High ${USAGE_TYPE} usage detected:${NC} ${YELLOW}$comm (PID $pid | CPU $cpu% | MEM ${rss}KB)${NC}"
notify-send "System-alert "$MESSAGE""

    fi

    if [[ "$rss" -gt "$THRESHOLD_MEM" ]]; then
      if [[ "$USAGE_TYPE" == "CPU" ]]; then
        USAGE_TYPE="CPU & Memory"
      else
        USAGE_TYPE="Memory"
      fi
 MESSAGE="${RED}High ${USAGE_TYPE} usage detected:${NC} ${YELLOW}$comm (PID $pid | CPU $cpu% | MEM ${rss}KB)${NC}"
notify-send "System-alert "$MESSAGE""

    fi

    echo -e "${RED} High ${USAGE_TYPE} usage detected:${NC} ${YELLOW}$comm (PID $pid | CPU $cpu% | MEM ${rss}KB)${NC}"

    
    SERVICE=$(ps -p "$pid" -o unit=)

if [[ "$SERVICE" == "init.scope" || -z "$SERVICE" ]]; then
  continue

    if [[ -n "$SERVICE" ]]; then
echo -e "${YELLOW} Attempting to restart service: ${SERVICE}${NC}"
      systemctl restart "$SERVICE"
      echo -e "${GREEN} Service $SERVICE restarted successfully due to high $USAGE_TYPE usage.${NC}"
    else
      echo -e "${RED} Could not determine service for PID $pid. Manual investigation needed.${NC}"
    fi
  fi
fi
done
