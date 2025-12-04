#!/bin/bash

source ~/colors/colors.sh

# LazyVim Dependencies Installer

echo -e "${CYAN}Installing C-compiler and build tools for nvim-treesitter... ${NC}"
sudo apt update
sudo apt install -y build-essential

echo -e "${CYAN}Installing Node.js and npm for LSPs... ${NC}"
sudo apt update
sudo apt install -y nodejs npm

echo -e "${CYAN}Installing Python LSP support... ${NC}"
sudo apt update
sudo apt install -y python3-pip
pip3 install --user pynvim

echo -e "${GREEN}Installation done. ${NC}"
