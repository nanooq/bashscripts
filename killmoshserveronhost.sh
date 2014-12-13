#! /bin/bash

#
# This script kills the mosh-server on a given host, 
# which has to be entered into the ssh-config
#

set -e;
set -u;

ahost="${1}"

ssh ${ahost} 'killall mosh-server && exit' 
