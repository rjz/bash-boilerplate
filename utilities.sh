#!/bin/bash

# Indicate a dependency
# Usage: require_command COMMAND [HINT]
require_command () {
  local cmd=$1
  shift
  command -v "$cmd" > /dev/null || {
    echo "Couldn't find '$cmd'; please install before continuing."
    [[ $# -lt 1 ]] || echo "(hint: $@)"
    exit 2
  }
}

# Require root access
# Usage: demand_root
demand_root () {
  # HT: https://www.cyberciti.biz/tips/shell-root-user-check-script.html
  if [[ $EUID -ne 0 ]]; then
     echo "This script must be run as root" 1>&2
     exit 1
  fi
}

# Require sudo access
# Usage: demand_sudo
demand_sudo () {
  if [[ -z ${SUDO_USER} ]]; then
    echo "This script must be run under sudo" 1>&2
    exit 1
  fi
}
