#!/bin/sh
openrc
touch /run/openrc/softlevel
sed -i "s|max_execution_time =.*|max_execution_time = 0|" /etc/php7/php.ini
sed -i "s|max_input_time =.*|max_input_time = -1|" /etc/php7/php.ini
sed -i "s|memory_limit =.*|memory_limit = 2G|" /etc/php7/php.ini
service php-fpm7 start
service nginx start
tail -F /var/log/nginx/access.log
