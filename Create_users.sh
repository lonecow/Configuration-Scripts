#!/bin/sh

if [ "`whoami`" != "root" ]; then
   echo "You do not have permission to run this script"
   exit 255
fi

addgroup --system linserve-backup
useradd --system --shell /bin/false --uid 999 -g linserve-backup linserve-backup
usermod -a -G transmission-users linserve-backup
usermod -a -G linserve-users linserve-backup

exit 0
