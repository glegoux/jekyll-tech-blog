#!/usr/bin/env bash
#
# Update the project with the version of the template (by default the last change even if unreleased).
#
# usage: ./update.sh

cd "$(git rev-parse --show-toplevel)" || exit 1

[[ -n "$(git status -s | cut -c4-)" ]] && \
  >&2 echo "ERROR: cannot update due to local changes, stash or commit them!" \
  && exit 1

git fetch origin main:main
# without committing it automatically if no conflict exists in the merge results
git merge --no-commit --no-ff main
# ignore these changes
core_project_resources="$(find src/_core/* -maxdepth 1 -name 'project' -type d)"
project_resources="$(find src/* -maxdepth 0 ! \( -name "_core" -type d \))"
other_resources=".github/ resources/ README.md"
for change in $(git status -s | cut -c4-); do
  for resource in ${core_project_resources} ${project_resources} ${other_resources}; do
    if [[ $change =~ ^$resource ]]; then
        echo "INFO: Ignore this change: ${change}"
        git add "${change}" &> /dev/null && \
        git reset "${change}" &> /dev/null && \
        git checkout "${change}" &> /dev/null
        continue
    fi
  done
done

if [[ -n $(git status -s | cut -c4-) ]]; then
  echo "INFO: Fix potential conflicts and run 'git commit' to validate the changes of the update!"
else
  git merge --abort &> /dev/null
  echo "INFO: No change, already up to date from the template!"
fi
