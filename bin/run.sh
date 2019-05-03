#!/bin/bash

BIN_DIR=$(cd `dirname $0` && pwd)
TAP_DIR=$(cd `dirname $0`/.. && pwd)

TAP_CODAT_BIN="${TAP_DIR}/env/bin/tap-codat"
# TARGET_STITCH_BIN="${TAP_DIR}/env/bin/target-stitch"

${BIN_DIR}/get_catalog.py ${TAP_CODAT_BIN} > "${TAP_DIR}/catalog.json"

mkdir -p "$TAP_DIR/logs"

catalog="${TAP_DIR}/catalog.json"
persist="${TAP_DIR}/persist.json"
config="${TAP_DIR}/config.json"

state_file_arg=""
state_file="${TAP_DIR}/state.json"
if [ -e $state_file ]; then
    echo "Using state file $state_file"
    state_file_arg="-s $state_file"
fi

log_state_file="${TAP_DIR}/logs/run_state.log"
log_file="${TAP_DIR}/logs/run.log"

${TAP_CODAT_BIN} $state_file_arg -c "$config" -p "$catalog" 2> >(tee -a "$log_file") 
