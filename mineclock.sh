#!/bin/bash

trap 'stop' SIGINT SIGTERM

stop() {
  echo "Exiting"
  exit 1
}

function createImage() {
  convert -size 1366x768 xc:black \
    -gravity center \
    -weight 500 \
    -pointsize 480 \
    -fill "#FFD454" \
    -font FreeMono \
    -annotate 0 "`date +%I:%M`" \
    ~/projects/mineclock/image.png
}

echo "Press esc to exit the image. Press ctrl + c to exit the process."
createImage
feh -Z -F -R 2 -Y ~/projects/mineclock &

while true; do
  createImage
  sleep 5s
done
