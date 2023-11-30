#!/usr/bin/env bash
#
# Show git log of the current branch without the main branch commits of the template
#
# usage: ./git-log.sh [file]

cd "$(git rev-parse --show-toplevel)" || exit 1

file="$1"

if [[ -z "${file}" ]]; then
  git log "$(git branch --show-current)" --not main
else
  git log "$(git branch --show-current)" --not main -- "${file}"
fi
