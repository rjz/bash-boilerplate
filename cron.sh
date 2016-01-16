#!/bin/bash

set -e

BASENAME=$(basename $0)

# Utility functions
log () {
  echo "[`date -u +"%Y-%m-%dT%H:%M:%SZ"`] - $1"
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

  log "Starting $BASENAME at `date -u`"

  # Some long-running task
  sleep 3

  log "Finished in $(($(current_timestamp) - $start_time))s."
}

(
  flock -xn 9 || fatal 'Failed acquiring lock'
  job
) 9> "/var/lock/$BASENAME.lock"

