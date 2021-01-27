#!/bin/sh
/usr/sbin/php-fpm7
telegraf &
nginx -g "daemon off;"

# while true;
# do
# 	if ! pgrep telegraf ; then
# 		exit 1
# 	fi
# 	sleep 2
# done

