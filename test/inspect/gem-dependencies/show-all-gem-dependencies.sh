#!/usr/bin/env bash
#
# Build DOT graph output for all the runtime dependencies of the given gems
# format: see https://graphviz.org/doc/info/lang.html
#
# Store the output in a fle: file.dot, then use to visualize the graph:
#   cat file.dot | dot -Tpng -o file.png | xdg-open file.png
#
# usage:
#   ./show-all-gem-dependencies.sh jekyll
#   ./show-all-gem-dependencies.sh jekyll jekyll-sitemap
#   ./show-all-gem-dependencies.sh $(bundle exec gem list | cut -f1 -d" ")


# helper

direct_runtime_dependencies() {
  local gem_name="$1"
  local direct_dependencies="$(bundle exec gem dep "^${gem_name}\$")"
  echo "${direct_dependencies}" \
    | grep -v "^Gem" | grep -v "development)" \
    | cut -f3 -d" " | sed '/^$/d'
}

version() {
  local gem_name="$1"
  local direct_dependencies="$(bundle exec gem dep "^${gem_name}\$")"
  echo "${direct_dependencies}" | grep -E "^Gem" | rev | cut -f1 -d"-" | rev 
}

# main

if [[ "$BASH_SOURCE" != "$0" ]]; then
  return 0
fi
	
set -e

cd "$(git rev-parse --show-toplevel)"

gem_names="$@"

for gem_name in ${gem_names}; do
  if ! bundle exec gem list -i "^${gem_name}\$" > /dev/null; then
    >&2 echo "ERROR: gem '${gem_name}' does not exist!"	   
    exit 1
  fi	   
done	  

dependencies=(${gem_names})
cache=()
output=""
while [[ ${#dependencies[@]} != 0 ]]; do
  dependency="${dependencies[0]}"
  for d in $(direct_runtime_dependencies "${dependency}"); do
    output="${output}\\n  \"${dependency} $(version ${dependency})\" -> \"${d} $(version ${d})\";"
    if [[ ! ${cache[@]} =~ ${dependency} ]]; then
      dependencies+=("${d}")
    fi
  done
  dependencies=("${dependencies[@]:1}")
  if [[ ! ${cache[@]} =~ ${dependency} ]]; then
    cache+=("${dependency}")
  fi
done

echo "digraph gems {"
echo -e "${output}" | sed '/^$/d' | sort | uniq
echo "}"
