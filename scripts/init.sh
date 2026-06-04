#!/bin/bash

# Check if its running as root
if [ -z "$SUDO_USER" ]; then
    echo "This script must be executed as root"
    exit 1
fi

# help
help() {
    echo "Use of the script with the parameters as follows"
    echo
    echo "Syntax: sudo bash init.sh {username} "
}

# Load logging script
source ./log.sh
start_script_logging

### Initialize Script
log_info "Script initializing"

# Setup the AUR repository yay
log_info "Setting up yay"

if command -v yay >/dev/null 2>&1; then
    log_info "yay is already installed"
else
    sudo pacman -Sy --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit 1
    makepkg -si
    cd ..
    rm -r yay
fi

# Setup the shell for the system
sudo -u "$SUDO_USER" yay -Ss --noconfirm wezterm

# Install general applications

### Cleanup Environment
