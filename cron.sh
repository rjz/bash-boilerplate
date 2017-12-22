#!/bin/bash

# Enable 'strict mode'
set -euo pipefail
IFS=$'\n\t'

BASENAME=$(basename "$0")
LOCK_TIMEOUT=30 # seconds

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

  log "Starting $BASENAME"

  # Some long-running task
  sleep 3

  log "Finished in $(($(current_timestamp) - start_time))s."
}

(
  flock --exclusive --timeout $LOCK_TIMEOUT 9 || fatal 'Failed acquiring lock'
  job
) 9> "/var/lock/$BASENAME.lock"

