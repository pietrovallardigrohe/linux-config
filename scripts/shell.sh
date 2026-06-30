#!/bin/bash

# Check if its running as root
if [ -z "$SUDO_USER" ]; then
  echo "This script must be executed as root"
  exit 1
fi

# Load logging script
source ./utils/log.sh

log_info "Starting up shell configuration script"

source ./utils/platform.sh
local platform="$(get_platform)"
