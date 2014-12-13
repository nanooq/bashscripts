#! /bin/bash
file="${1}"
while read aline; do
  rm "${aline}"
done < $HOME/"${file}"
