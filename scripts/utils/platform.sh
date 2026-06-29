#!/bin/bash

source ./log.sh

get_platform() {
  case "$(uname -s)" in
    "Darwin") echo "MacOS" ;;
    "Linux") echo "Linux" ;;
    *) log_error "Invalid operating system: " + $(uname -s) ;;
  esac
}
