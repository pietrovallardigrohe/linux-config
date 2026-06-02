#! /bin/bash

start_script_logging() {
  local caller_path="${1:-${BASH_SOURCE[1]:-$0}}"
  local caller_base
  caller_base="$(basename "$caller_path")"

  mkdir -p logs

  local log_file="logs/${caller_base%.*}.log"

  exec > >(tee "$log_file") 2>&1
  echo "Starting script $caller_base"
  echo "Logging to $log_file"
}

log() {
  log_info "$@"
}

log_info() {
  local timestamp
  timestamp="$(date +"%Y-%m-%d %H:%M:%S")"

  local color=""
  local reset=""
  local enabled=0

  if [[ "${LOG_COLOR:-}" == "1" ]]; then
    enabled=1
  elif [[ "${LOG_COLOR:-}" == "0" ]]; then
    enabled=0
  elif [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
    enabled=1
  fi

  if [[ "$enabled" == "1" ]]; then
    color="\033[34m"
    reset="\033[0m"
  fi

  echo "[$timestamp] [${color}INFO${reset}] $*"
}

log_warn() {
  local timestamp
  timestamp="$(date +"%Y-%m-%d %H:%M:%S")"

  local color=""
  local reset=""
  local enabled=0

  if [[ "${LOG_COLOR:-}" == "1" ]]; then
    enabled=1
  elif [[ "${LOG_COLOR:-}" == "0" ]]; then
    enabled=0
  elif [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
    enabled=1
  fi

  if [[ "$enabled" == "1" ]]; then
    color="\033[33m"
    reset="\033[0m"
  fi

  echo "[$timestamp] [${color}WARN${reset}] $*"
}

log_error() {
  local timestamp
  timestamp="$(date +"%Y-%m-%d %H:%M:%S")"

  local color=""
  local reset=""
  local enabled=0

  if [[ "${LOG_COLOR:-}" == "1" ]]; then
    enabled=1
  elif [[ "${LOG_COLOR:-}" == "0" ]]; then
    enabled=0
  elif [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
    enabled=1
  fi

  if [[ "$enabled" == "1" ]]; then
    color="\033[31m"
    reset="\033[0m"
  fi

  echo "[$timestamp] [${color}ERROR${reset}] $*"
}

log_success() {
  local timestamp
  timestamp="$(date +"%Y-%m-%d %H:%M:%S")"

  local color=""
  local reset=""
  local enabled=0

  if [[ "${LOG_COLOR:-}" == "1" ]]; then
    enabled=1
  elif [[ "${LOG_COLOR:-}" == "0" ]]; then
    enabled=0
  elif [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
    enabled=1
  fi

  if [[ "$enabled" == "1" ]]; then
    color="\033[32m"
    reset="\033[0m"
  fi

  echo "[$timestamp] [${color}OK${reset}] $*"
}
