#! /bin/bash

#
# This script finds duplicates by filesize and hash
#


set -e
set -u

afolder="${1}"
sfolder="${2}"
stati="${sfolder}/stati"

mkdir -p "${sfolder}"

local tmp_file=''

function get_files() { # folder name

  local input="${1}"  

  printf "\nFind all files.\n"
  local file0="${sfolder}/file0_file"
  find "${input}" -not -empty -type f > "${file1}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"
}

function duplicates_filesize() { # file holding files to check

  local input="${1}"

  printf "\nList all files' size: files1\n"
  local file1="${sfolder}/file1_filesize"
  cat "${input}" | -printf "%s\n" > "${file1}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"

  printf "Sort files' size: files2\n"
  local file2="${sfolder}/file2_filesize_sorted"
  cat "${file1}" | sort --reverse --numeric-sort > "${file2}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"

  printf "Delete unique file sizes: files3\n"
  tmp_file="${sfolder}/file3_filesize_duplicates"
  cat "${file2}" | uniq --repeated > "${tmp_file}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"
}

function duplicates_filehash() { # file holding files to check

  local input="${1}"
  
  printf "Add file name to size: files4\n"
  local file4="${sfolder}/file4"
  cat "${input}" | xargs -I{} -n1 find -type f -size {}c -print0 > "${file4}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"

  printf "Create md5sum: files5\n"
  local file5="${sfolder}/file5"
  cat "${file4}" | xargs -0 md5sum > "${file5}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"

  printf "Sort md5sum: files6\n"
  local file6="${sfolder}/file6"
  cat "${file5}" | sort > "${file6}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"

  printf "List duplicates: files7\n"
  local file7="${sfolder}/file7"
  cat "${file6}" | uniq --check-chars=32 --all-repeated=separate > "${file7}"
  printf "$(date --rfc-3339='seconds')" > "${stati}"
}

get_files() "${afolder}"
duplicates_filesize() "${tmp_file}"
duplicates_filehash() "${tmp_file}"
