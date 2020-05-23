#!/usr/bin/env bash

project_dir="$(readlink -f "$1")"

cd "$(dirname "$0")" || exit 1
config_file="$(readlink -f ../resources/.stylelintrc.json)"

cd "${project_dir}" || exit 1
npx stylelint "**/*.css" "!_static/site/libs/**" \
  --allow-empty-input --config "${config_file}"
