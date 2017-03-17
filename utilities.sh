#!/bin/bash

require_command () {
  command -v "$1" > /dev/null || {
    echo "Couldn't find '$1'; please install before continuing"
    exit 2
  }
}

demand_root () {
  # HT: https://www.cyberciti.biz/tips/shell-root-user-check-script.html
  if [[ $EUID -ne 0 ]]; then
     echo "This script must be run as root" 1>&2
     exit 1
  fi
}

demand_sudo () {
  if [[ -z ${SUDO_USER} ]]; then
    echo "This script must be run under sudo" 1>&2
    exit 1
  fi
}
