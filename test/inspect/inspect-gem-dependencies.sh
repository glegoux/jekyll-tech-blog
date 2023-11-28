#!/usr/bin/env bash
#
# Generate an DOT file with graph of all the runtime dependencies of the project with its image
#
# usage: ./inspect-gem-dependencies.sh

cd "$(git rev-parse --show-toplevel)" || exit 1

output_folder="./doc/gem-dependencies"

mkdir -pv "${output_folder}"

bash test/inspect/gem-dependencies/show-all-gem-dependencies.sh \
  $(bundle exec gem list | cut -f1 -d" ") \
  > ${output_folder}/all-gem-dependencies.dot

dot -Tpng -o ${output_folder}/all-gem-dependencies.png < "${output_folder}/all-gem-dependencies.dot"
