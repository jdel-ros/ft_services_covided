#!/bin/sh

touch /run/openrc/softlevel

echo "Starting telegraf .."
telegraf &

echo "Starting InfluxDB .."
rc-service influxdb start
sleep 2

while true;
do
	if ! pgrep influx >/dev/null 2>&1 ; then
		exit 1
	fi
	if ! pgrep telegraf >/dev/null 2>&1 ; then
		exit 1
	fi
	sleep 2
done

done
