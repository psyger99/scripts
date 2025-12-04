#!/bin/bash

source ~/colors/colors.sh

# Cloudflared Installation Script
#
# === USER CONFIGURATION ===
# Optional: Folder to store credentials/config
D_DRIVE_PATH="/mnt/d/n8n/volumes/cloudflared"

# =====================================================
# 1️⃣ Download and install cloudflared
# =====================================================
echo "Downloading latest cloudflared..."
curl -LO https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb

echo "Installing cloudflared..."
sudo dpkg -i cloudflared-linux-amd64.deb
sudo apt-get install -f -y

# Verify installation
cloudflared --version || {
  echo "cloudflared installation failed"
  exit 1
}

# =====================================================
# 2️⃣ Authenticate Cloudflare account
# =====================================================
echo "Logging into Cloudflare..."
cloudflared login

# =====================================================
# 3️⃣ Create a new tunnel
# =====================================================
read -p "Enter a name for your new tunnel: " TUNNEL_NAME
TUNNEL_UUID=$(cloudflared tunnel create "$TUNNEL_NAME" | grep -oP 'ID:\s+\K[0-9a-f-]+')

if [ -z "$TUNNEL_UUID" ]; then
  echo "Failed to create tunnel. Exiting."
  exit 1
fi

echo "Tunnel created with UUID: $TUNNEL_UUID"

# =====================================================
# 4️⃣ Copy credentials JSON to external folder (optional)
# =====================================================
mkdir -p "$D_DRIVE_PATH"
CREDENTIALS_FILE="$HOME/.cloudflared/$TUNNEL_UUID.json"

if [ ! -f "$CREDENTIALS_FILE" ]; then
  echo "Credentials file not found at $CREDENTIALS_FILE"
  exit 1
fi

cp "$CREDENTIALS_FILE" "$D_DRIVE_PATH/"

echo "✅ cloudflared installed, authenticated, and tunnel created!"
echo "Tunnel UUID: $TUNNEL_UUID"
echo "Credentials copied to: $D_DRIVE_PATH/"
