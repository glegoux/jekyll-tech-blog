#!/usr/bin/env bash
#
# usage: source boostrap.sh

cd "$(git rev-parse --show-toplevel)" || exit 1

ruby_project_version="$(cat .ruby-version | tr -d '\n')"
ruby_local_version="$(which ruby &> /dev/null && ruby --version | cut -f2 -d' ' | cut -f1 -d'p')"

if [[ "${ruby_local_version}" != "${ruby_project_version}" ]]; then
  source ~/.profile
  rvm use "${ruby_project_version}" \
    || { >&2 echo "ERROR: Please install rvm, see https://rvm.io/, then ruby ${ruby_project_version} with that"; return 1; }
else
  >&2 echo "WARNING: You use already ruby ${ruby_project_version}"
fi

if ! echo "${PATH}" | grep -q "${PWD}/bin" &> /dev/null; then
  echo "Add ${PWD}/bin as first entry of your PATH environment variable"
  export PATH="${PWD}/bin:$PATH"
else
  >&2 echo "WARNING: ${PWD}/bin is already in your PATH environment variable"
  return 1
fi
