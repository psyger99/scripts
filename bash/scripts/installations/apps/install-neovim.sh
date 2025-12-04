#!/bin/bash

source ~/colors/colors.sh

# Neovim Installation Script (Unstable PPA v0.12.0)

# Function to remove old Neovim installations
cleanup_old_nvim() {
    echo -e "${CYAN}Removing any old Neovim installations... ${NC}"

    # Remove apt version
    sudo apt purge -y neovim
    sudo apt autoremove -y

    # Remove manual binaries
    sudo rm -f /usr/local/bin/nvim
    rm -f ~/nvim.appimage

    # Remove old PPAs if they exist
    sudo add-apt-repository -r ppa:neovim-ppa/stable 2>/dev/null || true
    sudo add-apt-repository -r ppa:neovim-ppa/unstable 2>/dev/null || true

    echo -e "${GREEN}Cleanup completed. ${NC}"
}

# Cleanup first
cleanup_old_nvim

# Add Neovim Unstable PPA
echo -e "${CYAN}Adding Neovim Unstable PPA... ${NC}"
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update

# Install Neovim
echo -e "${CYAN}Installing Neovim from Unstable PPA... ${NC}"
sudo apt install -y neovim

# Verify installation
if command -v nvim &> /dev/null
then
    INSTALLED_VER=$(nvim --version | head -n1 | awk '{print $2}')
    echo -e "${GREEN}Neovim installation successful! Version: ${INSTALLED_VER} ${NC}"
else
    echo -e "${RED}Neovim installation failed! ${NC}"
    exit 1
fi

exit 0
