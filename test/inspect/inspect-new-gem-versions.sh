#!/usr/bin/env bash
#
# See the latest available version of each gem according to the version constraints of the project
# (only for the version not already used)

cd "$(git rev-parse --show-toplevel)" || exit 1

bundle exec gem outdated
