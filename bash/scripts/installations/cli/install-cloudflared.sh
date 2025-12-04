#!/bin/bash

source ~/colors/colors.sh

# Cloudflared installation and login script
echo -e "${CYAN}--- 1. Installing cloudflared via Cloudflare APT Repository --- ${NC}"

# Install necessary dependencies for adding a new repository
sudo apt update
sudo apt install -y curl lsb-release

# Add Cloudflare's official GPG key
echo -e "${CYAN}Adding Cloudflare's GPG key... ${NC}"
curl -fsSL https://pkg.cloudflare.com/cloudflare-release-latest.deb | sudo dpkg -i -

echo -e "${CYAN}Updating package list... ${NC}"
sudo apt update

echo -e "${CYAN}Installing cloudflared... ${NC}"
sudo apt install -y cloudflared

# Verify installation.
if command -v cloudflared &>/dev/null; then
  echo -e "${GREEN}cloudflared installed successfully: $(cloudflared --version) ${NC}"
else
  echo -e "${RED}ERROR: cloudflared installation failed. ${NC}"
  exit 1
fi

echo -e "${CYAN}--- 2. Authenticating Cloudflare Account --- ${NC}"

# Open browser for Cloudflare login and authentication.
echo -e "${YELLOW}Running 'cloudflared login'. Please follow the browser instructions in the browser window that opens. ${NC}"
cloudflared login

# Setup complete.
echo -e "${GREEN}Cloudflared is installed and authenticated. ${NC}"
