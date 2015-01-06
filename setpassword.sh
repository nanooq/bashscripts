#! /bin/bash

set -u
set -e

myaccount="${1}"
myuser="${2}"
mypassword="${3}"

echo python -c "import keyring; keyring.set_password(\'${myaccount}\', \'${myuser}\', \'${mypassword}\')"
