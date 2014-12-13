#! /bin/bash

#
# This script returns openssl capabilities of a passed
# host on a given port or 443
#

ahost="${1}"
aport="${2}"

if [ -z ${ahost} ]
then 
  ahost='cassiopeia.uberspace.de'
fi

if [ -z ${aport} ] 
then 
  aport=443
fi

openssl s_client -host "${ahost}" -port "${aport}"
