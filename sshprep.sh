#!/bin/bash

usage() {
  local name=$(basename $0)
  name=${name%.sh}
  cat <<EOM
  Usage: ${name} ipAddress
EOM
  exit 0
}

if [ $# -eq 0 ]; then
  usage;
fi

files() {
  local local_path=$([ -n "$SSHPREP_LOCAL_FILES_PATH" ] && echo "$SSHPREP_LOCAL_FILES_PATH" || echo "$HOME")

  if [ ! -d "$local_path" ]; then
    echo "Directory does not exist: $local_path"
    exit 1
  fi
}

