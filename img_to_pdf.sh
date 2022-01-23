#!/bin/bash
width=$(identify -format "%[w]" "$1")
height=$((99 * $width / 70))
filename=$(basename "$1")
filebase=${filename%.*}
extension=${1##*.}
convert "$1" -background white -alpha remove -alpha off -crop "$width"x"$height" "$filebase"_%d."$extension"
convert $(ls -1v "$filebase"_*."$extension") "$filebase".pdf
rm "$filebase"_*."$extension"
