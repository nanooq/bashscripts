#! /bin/bash

#
# This script overwrites /etc/hosts with 
# its vanilla version. 
# Dependencies: nscd
#

cd ~/Sync/hosts
printf "In a hurry? Do not update the sources, then.\n
python updateHostsFile.py
