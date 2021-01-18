#!/bin/sh
openrc
service php-fpm7 start
service nginx start
tail -F /var/log/nginx/access.log
php -S 0.0.0.0:5050 -t www/wordpress
