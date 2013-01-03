#!/bin/sh

if [ "`whoami`" != "root" ]; then
   echo "You do not have permission to run this script"
   exit 255
fi

addgroup --system --gid 999 linserve-users
addgroup --system --gid 998 transmission-users
useradd --system --shell /bin/false --uid 999 --gid 999 linserve-backup
usermod -a -G transmission-users linserve-backup

exit 0
