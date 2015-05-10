#! /bin/bash

set -e
set -v
set -x

COMPRESSFILE="${1}"
MYTMPFILE="$(mktemp)"

ls -lah $COMPRESSFILE

pdf2ps "$COMPRESSFILE" $MYTMPFILE
ps2pdf $MYTMPFILE $COMPRESSFILE

ls -lah $COMPRESSFILE

rm -rf $MYTEMPFILE
