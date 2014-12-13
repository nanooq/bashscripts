#! /bin/bash

# Command to be executed
rsynccommand="${1}"

# SSH-key to start 
sshkey="${2}"

# Successful exit returns 0 
notdoneyet=1

ssh-agent
ssh-add "${sshkey}"
while [ "${notdoneyet}"=1 ]; do
  "${rsynccommand}"
  notdoneyet="$?"
done
ssh-agent -k
