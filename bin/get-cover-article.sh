#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

declare -r RATIO=2
declare -r WIDTH=1080
declare -r HEIGHT=$((WIDTH / RATIO))

cover_article=${1}

w="$(identify -format '%w' "${cover_article}")"
h="$(identify -format '%h' "${cover_article}")"

echo "INFO: Initial image format is $w x $h"

if ((w > h * RATIO)); then
  echo "INFO: Crop image in width with ratio ${RATIO}:1"
  convert "${cover_article}" -crop $((h * RATIO))x${h}+0+0 output.jpg
elif ((w < h * RATIO)); then
  echo "INFO: Crop image in height with ratio ${RATIO}:1"
  convert "${cover_article}" -crop ${w}x$((w * 1 / RATIO))+0+0 output.jpg
else
  echo "INFO: Format image is well with ratio ${RATIO}:1"
  convert "${cover_article}" output.jpg
fi

echo "INFO: Resize image in ${WIDTH}x${HEIGHT} with JPEG format and .jpg extension"
convert output.jpg -resize ${WIDTH}x${HEIGHT}! output.jpg
