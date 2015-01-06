#! /bin/bash

set -u
set -e

for i in $(ls *.mts)
do echo "${i}"
	ffmpeg -i "${i}" -s 640x360 -ar 22050 -b:v 1M "${i}".flv; \rm "${i}" 
done;

