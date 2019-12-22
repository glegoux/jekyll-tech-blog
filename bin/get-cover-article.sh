#!/usr/bin/env bash

set -e

cd "$(dirname $0)"

cover_article=${1}
ratio=${2:-2}

w="$(identify -format '%w' "${cover_article}")"
h="$(identify -format '%h' "${cover_article}")"

echo "INFO: Initial image format is $w x $h"

if ((w > h * ratio)); then
    echo "INFO: Crop image in width with ratio ${ratio}:1"
  convert "${cover_article}" -crop $((h * ratio))x${h}+0+0 output.jpg
elif ((w < h * ratio)); then
  echo "INFO: Crop image in height with ratio ${ratio}:1"
  convert "${cover_article}" -crop ${w}x$((w * 1/ratio))+0+0 output.jpg
else
  echo "INFO: Format image is well with ratio ${ratio}:1"
  convert "${cover_article}" output.jpg
fi

echo "INFO: Resize image in 1080x540 with JPEG format and .jpg extension"
convert output.jpg -resize 1080x540! output.jpg
