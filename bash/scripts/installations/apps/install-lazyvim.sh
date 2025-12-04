#!/bin/bash

source ~/colors/colors.sh

# Backup existing Neovim config
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# Clone LazyVim starter template
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo -e "${CYAN}Opening LazyVim now... ${NC}"
nvim
