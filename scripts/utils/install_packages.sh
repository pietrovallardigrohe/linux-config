# Load logging script
source ./log.sh
start_script_logging

# Load platform
source ./utils/platform.sh
local platform="$(get_platform)"

# Prepare the package repositories
if [[ "$platform" = "Linux" ]]; then
  # setup temporary aliasing
  alias yay='sudo -u "$SUDO_USER" yay -S --noconfirm'

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

elif [[ "$platform" = "MacOs" ]]; then
  # Setup Brew package manager
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

install_packages() {
  local source=$1
  shift # Shift the arguments, removing the first one, leaving only the packages

  # Verify they are not trying to run yay on MacOs
  if (( "$platform" == "MacOs" && "$source" == "yay" )); then
    log_error "Attempted to run yay "
    exit -1
  fi

  # Verify  

  if (( "$platform" == "Linux" )); then

  elif (( "$platform" == "MacOs" )); then

  fi
}
