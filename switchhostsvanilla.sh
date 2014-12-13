#! /bin/bash

#
# Make a backup of the vanilla host first!
# sudo cp /etc/hosts/ host.vanilla
# 
# This script overwrites /etc/hosts with 
# its vanilla version. 
# Dependencies: nscd
#

sudo cp /etc/hosts.vanilla /etc/hosts
sudo service nscd restart
