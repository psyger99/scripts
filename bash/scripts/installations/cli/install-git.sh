#!/bin/bash

source ~/colors/colors.sh

# Git Installation Script

# Checks if git is already installed
if command -v git &> /dev/null
then
    echo -e "${GREEN}Git is ALREADY installed. ${NC}"
    git --version
else
    echo -e "${CYAN}Git is NOT installed yet. Installing Git PPA & Git now... ${NC}"

    # Install software-properties common if not already installed (needed for add-apt-repository
    sudo apt-get update
    sudo apt-get install software-properties-common -y

    # Add the Git PPA
    sudo add-apt-repository ppa:git-core/ppa -y

    # Update package lists and install Git
    sudo apt-get update
    sudo apt-get install git -y
    
    # Check if installation succeeded
    if command -v git &> /dev/null
    then
        echo -e "${GREEN}Git installation successful! ${NC}"
    else
        echo -e "${RED}Git installation failed! ${NC}"
        exit 1   
    fi
fi

exit 0
