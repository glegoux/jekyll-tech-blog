#!/usr/bin/env bash

set -e

cd "$(git rev-parse --show-toplevel)" || exit 1

project_dir="dest/"

echo "** Check:"
echo -n "- CSS files..."
./test/checker/checker_css.sh "${project_dir}" && echo "OK" || echo "Failed"
echo -n "- JSON files..."
./test/checker/checker_json.sh "${project_dir}" && echo "OK" || echo "Failed"
