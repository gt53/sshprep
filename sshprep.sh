#!/bin/bash

sshprep_usage() {
  cat <<EOM
Usage: sshprep host-name-or-ip

Setup: Define the array \$sshprep_files somewhere such as ~/.bashrc. Example:
  declare -a sshprep_files=(
    "$HOME/.bashrc"
    "$HOME/.vimrc"
  )

EOM
  return 0
}

sshprep() {
  local TEXT_YELLOW=$(tput setaf 3)
  local TEXT_RED=$(tput setaf 1)
  local TEXT_RESET=$(tput sgr0)

  # Validate host param
  if [ $# -eq 0 ]; then
    sshprep_usage;
    return 1
  fi

  local host=$1

  # Validate $sshprepf_files
  if [ -z $sshprep_files ]; then
    echo "${TEXT_RED}ERROR: 'sshprep_files' not defined${TEXT_RESET}"
    echo ""
    sshprep_usage;
    return 1
  fi

  # Warn about files that don't exist
  for file in "${sshprep_files[@]}"; do
    if [ ! -f "${file}" ]; then
      echo "${TEXT_YELLOW}Warning: File ${TEXT_RESET}${file}${TEXT_YELLOW} not found. Skipping ...${TEXT_RESET}"
    fi
  done

  # Copy files
  scp ${sshprep_files[*]} $host:~

  # Connect
  ssh -o ServerAliveInterval=60 $host
}
