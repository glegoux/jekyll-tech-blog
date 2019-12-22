#!/usr/bin/env bash

cd "$(git rev-parse --show-toplevel)" || exit 1

imgs=$(find . -type f \( -name \*.jpg -o -name \*.png \))
for img in ${imgs}; do
    # remove metadata
    convert -verbose -strip "${img}" "${img}"
    identify -verbose "${img}"
done
