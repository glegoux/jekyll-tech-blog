#!/usr/bin/env bash

set -e

cd "$(git rev-parse --show-toplevel)" || exit 1

run_test() {
  local message="$1"
  local execute="$2"
  echo -n "- ${message}..."
  if eval "${execute}"; then
    echo "OK"
  else
    echo "Failed"
    exit 1
  fi
}

project_dir="./build/static-files"

# Disable the npm progress spinner, it clears the current line of the test output
export npm_config_progress=false

echo "Check:"
run_test  "HTML files" "./test/checker/checker_html.sh \"${project_dir}\""
run_test  "CSS files" "./test/checker/checker_css.sh \"${project_dir}\""
run_test  "JSON files" "./test/checker/checker_json.sh \"${project_dir}\""

