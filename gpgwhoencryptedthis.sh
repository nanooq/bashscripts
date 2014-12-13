#! /bin/bash

#
# This oneliner is taken from http://stackoverflow.com/questions/5877969/how-do-i-list-information-for-a-gnupg-encrypted-message. Thanks kylehuff
#

set -u
set -e

encryptedfile=${1}

gpg --no-default-keyring --secret-keyring /dev/null --armor --list-only ${encryptedfile}
