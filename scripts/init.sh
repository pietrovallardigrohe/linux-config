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

source ./utils/platform.sh
local platform = "$(get_platform)"

### Initialize Script
log_info "Script initializing"

# setup temporary aliasing
alias yay='sudo -u "$SUDO_USER" yay -S --noconfirm'

###/ Initialize Script

if [ "$platform" = "Linux" ]; then
  # Install updates
  pacman -Syu

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
fi
###/ Initialize Script

### Setup the shell for the system
yay wezterm

pacman -Sy zsh neovim eza bat fd fzf zoxide starship ripgrep tree-sitter-cli yazi glow lazygit

###/ Setup the shell for the system

### Install general applications

# Arch Repository
pacman -Sy zsh moor man man-db

# Flatpack
flatpak install flathub app.zen_browser.zen
flatpak install flathub org.keepassxc.KeePassXC

# AUR
yay librewolf-bin
yay peazip-qt-bin
###/ Install general Applications

### Cleanup Environment
###/ Cleanup Environment
