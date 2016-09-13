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

Setup: Define the array \$sshprep_files somewhere such as ~/.bashrc -- example:
  declare -a sshprep_files=(
    "$HOME/.bashrc"
    "$HOME/.vimrc"
  )

EOM
  exit 0
}

# Validate param
if [ $# -eq 0 ]; then
  usage;
  exit 1
fi

host=$1

# Validate $sshprepf_files
if [ -z $sshprep_files ]; then
  echo "${TEXT_RED}ERROR: 'sshprep_files' not defined${TEXT_RESET}"
  echo ""
  usage;
  exit 1
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

exit 0
