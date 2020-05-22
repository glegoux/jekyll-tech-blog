#!/usr/bin/env bash

project_dir="$(readlink -f "$1")"

while IFS= read -r -d '' file; do
  jq empty <"${file}"
done < <(find "${project_dir}" -name '*.json' -print0)
