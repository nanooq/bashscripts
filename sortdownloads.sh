#! /bin/bash

cd $HOME/Downloads

printf "\nPictures\n"
folder="$HOME/Pictures/Pictures_Unsorted"
mkdir -p "${folder}"
find . -maxdepth 1 -iname "*.jpg" -exec mv {} "${folder}" \;
find . -maxdepth 1 -iname "*.png" -exec mv {} "${folder}" \;
find . -maxdepth 1 -iname "*.gif" -exec mv {} "${folder}" \;

printf "\nBooks\n"
folder="$HOME/Books/Books_Unsorted"
mkdir -p "${folder}"
find . -maxdepth 1 -iname "*.pdf" -exec mv {} "${folder}" \;
find . -maxdepth 1 -iname "*.txt" -exec mv {} "${folder}" \;

printf "\nMusic\n"
folder="$HOME/Music/Music_Unsorted"
mkdir -p "${folder}"
find . -maxdepth 1 -iname "*.mp3" -exec mv {} "${folder}" \;
find . -maxdepth 1 -iname "*.m4a" -exec mv {} "${folder}" \;

printf "\nVideos\n"
folder="$HOME/Videos/Videos_Unsorted"
mkdir -p "${folder}"
find . -maxdepth 1 -iname "*.mp4" -exec mv {} "${folder}" \;
