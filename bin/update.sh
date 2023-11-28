#!/usr/bin/env bash
#
# Update the project with the version of the template (by default the last change even if unreleased).
#
# usage: ./update.sh

git fetch origin main:main
git merge --no-commit --no-ff main
# git reset -- /path/to/folder # revert updates from path

echo "Use 'git commit' to validate the changes of the update!"
