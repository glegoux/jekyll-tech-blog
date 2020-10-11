#!/usr/bin/env bash

set -e

url="${1}"
encryption="${2:-sha256}"

_type="${url##*.}"
if [[ "${_type}" != 'css' ]] && [[ "${_type}" != 'js' ]]; then
  >&2 echo "ERROR: only urls to css and js content are authorized!"
  exit 1
fi

content="$(curl -sS --fail "${url}")"
integrity="$(echo -n "${content}" | openssl dgst "-${encryption}" -binary | openssl base64 -A)"

if [[ "${_type}" = 'css' ]] ; then
  echo "<link href=\"${url}\" rel=\"stylesheet\" type=\"text/css\" integrity=\"${encryption}-${integrity}\" crossorigin=\"anonymous\">"
elif [[ "${_type}" = 'js' ]] ; then
  echo "<script src=\"${url}\" type=\"text/javascript\" integrity=\"${encryption}-${integrity}\" crossorigin=\"anonymous\"></script>"
fi
