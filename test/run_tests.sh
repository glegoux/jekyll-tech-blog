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

echo "Check:"
run_test  "CSS files" "./test/checker/checker_css.sh \"${project_dir}\""
run_test  "JSON files" "./test/checker/checker_json.sh \"${project_dir}\""

