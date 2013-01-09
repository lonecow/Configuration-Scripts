#!/bin/bash
mysqldump --flush-privileges --opt mysql -u root -p > `dirname $0`/mysql-dbs/mysql.db 
