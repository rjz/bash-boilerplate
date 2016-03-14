#!/bin/bash

# Configurable variables
SALUTATION="Top o' the morning to ye"
VALEDICTION="Fare thee well"

EXPECTEDARGC=2

# Environmental variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Utility functions
usage () {
  echo "$0 greet|dismiss name"
  exit 2
}

log () {
  echo "[`date -u +"%Y-%m-%dT%H:%M:%SZ"`] - $1"
}

fatal () {
  log "FATAL: '$1'" 1>&2;
  exit 1
}

# User-defined functions
say () {
  log "So then I says, '$1'"
}

# Command line parsing
if [ $# -lt $EXPECTEDARGC ]; then
  usage
fi

case "$1" in

  greet)
    say "$SALUTATION, $2!"
  ;;

  dismiss)
    say "$VALEDICTION, $2!"
  ;;

  fail)
    fatal "I don't feel so well...."
  ;;

  *)
    usage
esac

