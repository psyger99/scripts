#!/bin/bash

source ~/colors/colors.sh

# Cloudflared installation and login script
echo "--- 1. Installing cloudflared via Cloudflare APT Repository ---"

# Install necessary dependencies for adding a new repository
sudo apt update
sudo apt install -y curl lsb-release

# Add Cloudflare's official GPG key
echo "Adding Cloudflare's GPG key..."
curl -fsSL https://pkg.cloudflare.com/cloudflare-release-latest.deb | sudo dpkg -i -

echo "Updating package list..."
sudo apt update

echo "Installing cloudflared..."
sudo apt install -y cloudflared

# Verify installation.
if command -v cloudflared &>/dev/null; then
  echo "✅ cloudflared installed successfully: $(cloudflared --version)"
else
  echo "❌ ERROR: cloudflared installation failed."
  exit 1
fi

echo "--- 2. Authenticating Cloudflare Account ---"

# Open browser for Cloudflare login and authentication.
echo "Running 'cloudflared login'. Please follow the browser instructions in the browser window that opens."
cloudflared login

# Setup complete.
echo "cloudflared is installed and authenticated."
