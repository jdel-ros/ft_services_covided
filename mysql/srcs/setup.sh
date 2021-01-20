#!/bin/sh

# start the MariaDB daemon with:
mysql_install_db --datadir=/var/lib/mysql
service mariadb restart

mysql -u root mysql < ./creatdb.sql
mysql -u root wordpress < ./wordpress.sql

service mariadb stop
mysqld --user=root
