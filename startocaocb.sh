#! /bin/bash

param="${1}"

set -e
set -u

printf "start etherpad\n"
/home/lora/Sync/etherpad-lite/bin/run.sh &

printf "start ocaocb\n"

cd /home/lora/Sync/ocaocb

if [ -z "${param}" ]
then
  flags=''
else
  flags='--log-level=debug --log-request  --log-response --log-web --log-sql --osv-memory-count-limit=0 --osv-memory-age-limit=0'
fi

./odoo.py ${flags} --config=debian/openerp-server.conf
