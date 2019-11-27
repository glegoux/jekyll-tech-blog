#!/usr/bin/env bash
#
# Generate list of identifiers of my 10 latest public gists

set -e

cd "$(dirname $0)"

gists=$(curl -s -S https://api.github.com/users/glegoux/gists) | jq -r ".[] | .id" | head -n 5)
#| jq -r ".[] | .files" | jq -r 'keys[]' | head -n 5
#| jq -r ".[] | .description" | head -n 5
#| jq -r ".[] | .files" | jq -r ".[] | .language" | head -5
#| jq -s '.[:5]'

echo "all:" > ../_data/gist_ids.yml
for gist_id in $gist_ids; do
  echo " - ${gist_id}" >> ../_data/gist_ids.yml
done
