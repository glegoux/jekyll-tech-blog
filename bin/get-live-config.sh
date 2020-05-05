#!/usr/bin/env bash
#
# Get config file for debugging

cd "$(git rev-parse --show-toplevel)" || exit 1

host="${1:-http://localhost:4000}"
output_file="${2:-.jekyll-config-debug.json}"

echo "GET ${host}/config.json to ${output_file}"
curl -sS -X GET "${host}/config.json" > "${output_file}"
