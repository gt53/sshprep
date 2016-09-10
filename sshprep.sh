#!/bin/bash

TEXT_GREEN=$(tput setaf 2)
TEXT_YELLOW=$(tput setaf 3)
TEXT_RED=$(tput setaf 1)
TEXT_RESET=$(tput sgr0)

usage() {
  local name=$(basename $0)
  name=${name%.sh}
  cat <<EOM
  Usage: ${name} host-name-or-ip
EOM
  exit 0
}

# Validate param
if [ $# -eq 0 ]; then
  usage;
  exit 1
fi

host=$1

# Would be defined in .bashrc
declare -a sshprep_files=(
  "$HOME/.bashrc"
  "$HOME/.vimrc"
)

# Validate $sshprepf_files
if [ -z $sshprep_files ]; then
  echo "${TEXT_RED}ERROR: 'sshprep_files' not defined${TEXT_RESET}"
  exit 1
fi

# Validate all files exist
for file in "${sshprep_files[@]}"; do
  if [ ! -f "${file}" ]; then
    echo "${TEXT_RED}ERROR: File ${file} not found${TEXT_RESET}"
    exit 1
  fi
done

# TODO: scp and ssh
