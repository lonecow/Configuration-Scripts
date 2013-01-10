#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

apt-get install mysql-server

if [ -d /etc/mysql ]; then
   cp -v `dirname $0`/mysql/* /etc/mysql/
else
   echo "mysql doesnt seem to exist"
   exit 255
fi

mysql -u root -p mysql < `dirname $0`/mysql-dbs/mysql.db
`dirname $0`/RestoreDatabases.sh

service mysql restart
