#!/usr/bin/env bash
#
# Open generated image with xdg-open all-gem-dependencies.png

cd $(git rev-parse --show-toplevel)

output_folder="./test/inspect/gem-dependencies"

${output_folder}/show-all-gem-dependencies.sh \
  $(bundle exec gem list | cut -f1 -d" ") \
  > ${output_folder}/all-gem-dependencies.dot

cat ${output_folder}/all-gem-dependencies.dot \
  | dot -Tpng -o ${output_folder}/all-gem-dependencies.png 
