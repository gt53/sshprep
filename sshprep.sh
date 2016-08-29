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
