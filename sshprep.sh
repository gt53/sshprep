#!/bin/bash

usage() {
  local name=$(basename $0)
  name=${name%.sh}
  cat <<EOM
  Usage: ${name} ipAddress
EOM
  exit 0
}

# Validate param
if [[ $# -eq 0 ]]; then
  usage;
  exit 1
fi

host=$1

# Would be defined in .bashrc
declare -a sshprep_files=(
  "$HOME/.bashrc"
  "$HOME/.vimrc"
);

# Validate $sshprepf_files
if [[ -z $sshprep_files ]]; then
  echo "ERROR: 'sshprep_files' not defined"
  exit 1
fi

# Validate all files exist
for file in "${sshprep_files[@]}"; do
  if [[ ! -f "${file}" ]]; then
    echo "ERROR: ${file} not found"
    exit 1
  fi
done

# TODO: scp and ssh
