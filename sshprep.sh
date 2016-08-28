#!/bin/bash

usage() {
  cat <<EOM
  Usage: $(basename $0) ipAddress
EOM
  exit 0
}

if [ $# -eq 0 ]; then
  usage;
fi
