#!/usr/bin/env bash
#
# usage: get-cover-article.sh <cover_path>
#
# Convert and clean an article cover. The correct cover will be created in the same folder than
# the given <cover_path> with a valid format JPEG and extension: .jpg and ratio of dimension: 1080x540 (2:1). 
# A backup of <cover_path> will created in the same folder with .old suffix.

set -e

cd "$(git rev-parse --show-toplevel)" || exit 1

# arguments
cover_article_path="${1}"

# constants
declare -r WIDTH=1080
declare -r RATIO=2
HEIGHT=$(echo "${WIDTH} / ${RATIO}" | bc) # here should be 540
declare -r HEIGHT
declare -r EXT="jpg"

# script
cp "${cover_article_path}" "${cover_article_path}.old"
new_cover_article_path="${cover_article_path%.*}.${EXT}"
echo "INFO: Transform image from $(basename "${cover_article_path}") to $(basename "${new_cover_article_path}")"

w="$(identify -format '%w' "${cover_article_path}")"
h="$(identify -format '%h' "${cover_article_path}")"

echo "INFO: Initial image format is $w x $h"

if (($(echo "${w} > ${h} * ${RATIO}" | bc -l))); then
  echo "INFO: Crop image in width with ratio ${RATIO}:1"
  convert "${cover_article_path}" -crop "$(echo "${h} * ${RATIO}" | bc)x${h}+0+0" "${new_cover_article_path}"
elif (($(echo "${w} < ${h} * ${RATIO}" | bc -l))); then
  echo "INFO: Crop image in height with ratio ${RATIO}:1"
  convert "${cover_article_path}" -crop "${w}x$(echo "${w} * 1 / ${RATIO}" | bc)+0+0" "${new_cover_article_path}"
else
  echo "INFO: Format image is well with ratio ${RATIO}:1"
  convert "${cover_article_path}" "${new_cover_article_path}"
fi

echo "INFO: Resize image in ${WIDTH}x${HEIGHT} with .${EXT} extension and format"
convert "${new_cover_article_path}" -resize "${WIDTH}x${HEIGHT}!" "${new_cover_article_path}"

echo "INFO: Clean image"
convert -verbose -strip "${new_cover_article_path}" "${new_cover_article_path}"
