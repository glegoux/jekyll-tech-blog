#!/usr/bin/env bash
#
# Check live config file from server for debugging
# /!\ Only if JEKYLL_ENV=development set for running the server

cd "$(git rev-parse --show-toplevel)" || exit 1

option="${1:-"--keys"}"
host="${2:-http://localhost:4000}"

if [[ "${option}" == "--keys" ]]; then
  echo >&2 "INFO: Show the keys of the config, do '$0 site.<key>' to see the value of this related config"
  curl -sS -f -X GET "${host}/config.json" | jq .site | jq keys
else
  echo >&2 "INFO: Show the config related to this key ${option} if it exists"
  curl -sS -f -X GET "${host}/config.json" | jq ".${option}"
fi
