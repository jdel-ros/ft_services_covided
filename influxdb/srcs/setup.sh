#!/bin/sh
telegraf &
rc-service influxdb start
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
