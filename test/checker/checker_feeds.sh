#!/usr/bin/env bash
#
# Check the syntax of RSS and Atom feeds (already deployed)

cd "$(git rev-parse --show-toplevel)" || exit 1

[[ -n "${WEBSITE_URL}" ]] || exit 1

source ./test/test_reports.sh

for feed in rss atom; do
  url_encoding=$(printf %s "${WEBSITE_URL}/${feed}.xml" | jq -sRr @uri)
  wget -O "${TEST_REPORTS_DIR}/validation-${feed}-feeds.html" -k "https://validator.w3.org/feed/check.cgi?url=${url_encoding}"
done

