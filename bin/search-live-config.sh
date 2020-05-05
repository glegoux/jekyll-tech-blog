#!/usr/bin/env bash
#
# Get config file for debugging

cd "$(git rev-parse --show-toplevel)" || exit 1

option="${1:-"--keys"}"
input_file="${2:-".jekyll-config-debug.json"}"

if [[ "${option}" == "--keys" ]]; then
  echo >&2 "INFO: Show the keys of the config, do '$(basename "$0") <key>' to see the value of this related config"
  jq keys <"${input_file}"
else
  echo >&2 "INFO: Show the config related to this key ${option} if it exists"
  jq ".${option}" <"${input_file}"
fi
