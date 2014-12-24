#! /bin/bash

#
# This script creates animated gifs from images
#
# turnpngtogif.sh /abs/path/srcfolder /abs/path/destforanigif/

# Where images to be used are located. Absolute path.
sourcefolder="${1}"

# Where animated gif is to be saved. Absolute path.
targetfolder="${2}"

# No changes below this line required.

set -u
set -e

strdate=''
filetype='.png'
tempfile="$(tempfile)"
mydate=''
folderlabeled='label/'
folderresized='resize/'
filename=''

#
# Remove eventually existing resize folder

if [ -d ${folderlabeled} ] 
  then
    rm -rf ${folderlabeled}
  fi

if [ -d ${folderresized} ]
  then
    rm -rf ${folderresized}
  fi

#
# Get date string that is in file name
# TODO: This is not very elegant 
printf "\nGetting date... "
$(find . *${filetype} -maxdepth 0 -type f > "${tempfile}")

mydate="$(cat ${tempfile} | tail --lines=1)"
mydate="${mydate:0:10}"

printf "${mydate}."

#
# Add date as label
printf "\nAppending label... "
mkdir ${folderlabeled}
for i in $(ls *${filetype})
  do
    convert ${i} -background White -pointsize 150 label:${mydate} -gravity Center -append ${folderlabeled}${i}
  done
printf "done."

#
# Resize images
printf "\nResizing images... "
mkdir ${folderresized}
for i in $(ls ${folderlabeled}*)
  do
    filename="${i##*/}"
    convert -resize 20% ${i} ${folderresized}${filename}
  done
printf "done."

#
# Converting images to animated gif
printf "\nConverting images to animated ${mydate}.gif.\n"

convert -delay 3 -loop 0 ${folderresized}*${filetype} ${mydate}.gif

#
#Moving animated gif

mv ${mydate}.gif ${targetfolder}

#
# Clean up
printf "\nCleaning up.\n"
rm "${tempfile}"

rm -rf ${folderlabeled}
rm -rf ${folderresized}

exit
