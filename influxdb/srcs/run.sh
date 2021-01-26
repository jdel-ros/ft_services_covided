#!/bin/sh

echo "Starting telegraf .."
telegraf &


echo "Starting InfluxDB .."
rc-service influxdb start 1>/dev/null
sleep 2

while true;
do
	if ! pgrep influx >/dev/null 2>&1 ; then
		echo "InfluxDB is down !"
		echo "Quitting.."
		exit 1
	else
		echo "InfluxDB is up!"
	fi
	if ! pgrep telegraf >/dev/null 2>&1 ; then
		echo "telegraf is down !"
		echo "Quitting.."
		exit 1
	else
		echo "telegraf is up!"
	fi
	sleep 2
done

done
