#! /bin/bash


function apt-history(){ # grepp
  local grp="${1}"
  case "${grp}" in
    help)
      print "install, upgrade, remove, tollback or nothing.\n"
      ;;
    install|upgrade|remove)
      < /var/log/dpkg.log grep "${grp} "
      ;;
    rollback)
      < /var/log/dpkg.log grep upgrade | \
      grep "$2" -A10000000 | \
      grep "$3" -B10000000 | \
      awk '{print $4"="$5}'
      ;;
    *)
      < /var/log/dpkg.log
      ;;
  esac
}

apt-history "${1}"
