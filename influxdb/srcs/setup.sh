# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:57:55 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 10:19:44 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# !/bin/sh
rc-service influxdb start
telegraf &
sleep 2

while true;
do
	if ! pgrep influx ; then
		exit 1
	fi
	if ! pgrep telegraf ; then
		exit 1
	fi
	sleep 2
done


#!/bin/sh

# echo "Starting telegraf .."
# telegraf &

# echo "Starting InfluxDB .."
# rc-service influxdb 
# sleep 2

# while true;
# do
# 	if ! pgrep influx >/dev/null 2>&1 ; then
# 		exit 1
# 	fi
# 	if ! pgrep telegraf >/dev/null 2>&1 ; then
# 		exit 1
# 	fi
# 	sleep 2
# done

# done