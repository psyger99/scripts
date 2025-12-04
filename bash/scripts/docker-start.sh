#!/bin/bash

source ~/colors/colors.sh

# Start docker daemon manually in WSL2

# Check if docker service is masked
if systemctl is-enabled docker.socket | grep -q masked; then
  echo -e "${CYAN}Unmasking docker.socket... ${NC}"
  sudo systemctl unmask docker.socket
fi

# Start docker service
echo -e "${CYAN}Starting Docker service... ${NC}"
sudo systemctl start docker.service

# Check status
if systemctl is-active docker.service | grep -q active; then
  echo -e "${GREEN}✅ Docker started successfully! ${NC}"
else
  echo -e "${RED}❌ Failed to start Docker. Check 'sudo systemctl status docker.service.' or 'sudo systemctl status docker.socket.' ${NC}"
fi
