#!/usr/bin/env bash
#
# usage: get-cover-article.sh <cover_path>
#
# Convert and clean an article cover, the correct cover will be created in the same folder than
# the given <cover_path> with a valid extension: .jpg and ratio of dimension: 1080x540. A backup of
# <cover_path> will created in the same folder with .old suffix.

set -e

cd "$(dirname "$0")"

# arguments
cover_article="${1}"

# constants
declare -r WIDTH=1080
declare -r RATIO=2
HEIGHT=$(echo "${WIDTH} / ${RATIO}" | bc) # here should be 540
declare -r HEIGHT
declare -r EXT="jpg"

# script
cp "${cover_article}" "${cover_article}"
new_cover_article="${cover_article%.*}.${EXT}"
echo "INFO: Transform image from $(basename "${cover_article}") to $(basename "${new_cover_article}")"

w="$(identify -format '%w' "${cover_article}")"
h="$(identify -format '%h' "${cover_article}")"

echo "INFO: Initial image format is $w x $h"

if (($(echo "${w} > ${h} * ${RATIO}" | bc -l))); then
  echo "INFO: Crop image in width with ratio ${RATIO}:1"
  convert "${cover_article}" -crop "$(echo "${h} * ${RATIO}" | bc)x${h}+0+0" "${new_cover_article}"
elif (($(echo "${w} < ${h} * ${RATIO}" | bc -l))); then
  echo "INFO: Crop image in height with ratio ${RATIO}:1"
  convert "${cover_article}" -crop "${w}x$(echo "${w} * 1 / ${RATIO}" | bc)+0+0" "${new_cover_article}"
else
  echo "INFO: Format image is well with ratio ${RATIO}:1"
  convert "${cover_article}" "${new_cover_article}"
fi

echo "INFO: Resize image in ${WIDTH}x${HEIGHT} with .${EXT} extension and format"
convert "${new_cover_article}" -resize "${WIDTH}x${HEIGHT}!" "${new_cover_article}"

echo "INFO: Clean image"
convert -verbose -strip "${new_cover_article}" "${new_cover_article}"
