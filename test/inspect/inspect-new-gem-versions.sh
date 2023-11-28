#!/usr/bin/env bash
#
# Open generated image with xdg-open all-gem-dependencies.png

cd "$(git rev-parse --show-toplevel)"

bundle exec gem outdated
