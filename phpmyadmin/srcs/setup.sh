#!/bin/sh
/usr/sbin/php-fpm7
telegraf &
nginx -g "daemon off;"
