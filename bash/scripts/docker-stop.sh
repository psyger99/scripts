#!/bin/bash

source ~/colors/colors.sh

services=("docker.service" "docker.socket" "containerd")

echo -e "${CYAN}Checking Docker-related services... ${NC}"

for svc in "${services[@]}"; do
  if systemctl list-unit-files | grep -q "^${svc}"; then

    # Check status
    state=$(systemctl is-active "$svc")

    if [ "$state" = "inactive" ] || [ "$state" = "failed" ]; then
      echo -e "${GREEN} - $svc is already stopped. ${NC}"
    else
      echo -e "${CYAN}Stopping $svc... ${NC}"
      sudo systemctl stop "$svc"
    fi
  else
    echo -e "${RED} - $svc does not exist on this system. ${NC}"
  fi

done

echo -e "${GREEN}Done. ${NC}"
