#!/bin/sh
service php-fpm7 start
service nginx start
php -S 0.0.0.0:5050 -t /usr/share/wordpress
