#!/bin/sh
telegraf &
# rc-service influxdb start
/usr/sbin/influxd & sleep 3
tail -f /dev/null
# influx -execute "CREATE DATABASE grafana"
# influx -execute "CREATE USER graf_admin WITH PASSWORD 'admin'"
# influx -execute "GRANT ALL ON grafana TO graf_admin"
# sleep 2

# while true;
# do
# 	if ! pgrep influx ; then
# 		exit 1
# 	fi
# 	if ! pgrep telegraf ; then
# 		exit 1
# 	fi
# 	sleep 2
# done
