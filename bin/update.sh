#!/usr/bin/env sh
#
# Update the project with the version of the template (by default the last change even if unreleased).
#
# usage: ./update.sh [version]

version="${1:-main}"

git merge --no-commit --no-ff "${version}"
# git reset -- /path/to/folder # revert updates from path

echo "Use 'git commit' to validate the changes of the update!"
