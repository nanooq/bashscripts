#!/bin/bash

set -u
set -e

thepwd="${1}"
theformat="${2}"

# the large images are in ./images

for i in $(ls "${thepwd}"/*."${theformat}")
do

# Rotate all images
rotatedimg='rot_'$(basename $i)
$(convert -rotate 270 $i ${rotatedimg})
echo "rotate ${rotatedimg}"

done


