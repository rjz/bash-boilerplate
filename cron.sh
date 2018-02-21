#!/bin/bash

# Enable 'strict mode'
set -euo pipefail
IFS=$'\n\t'

my_name=$(basename "$0")
lock_timeout=30 # seconds

# Utility functions
log () {
  echo "[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] - $1"
}

fatal () {
  log "FATAL: '$1'" 1>&2;
  exit 1
}

current_timestamp () {
  date +%s
}

job () {

  start_time=$(current_timestamp)

  log "Starting ${my_name}"

  # Some long-running task
  sleep 3

  log "Finished in $(($(current_timestamp) - start_time))s."
}

(
  flock --exclusive --timeout $lock_timeout 9 || fatal 'Failed acquiring lock'
  job
) 9> "/var/lock/${my_name}.lock"

