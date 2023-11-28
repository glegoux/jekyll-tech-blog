#!/usr/bin/env bash
#
# See the latest available version of each gem according the version constraints of the project

cd "$(git rev-parse --show-toplevel)" || exit 1

bundle exec gem outdated
