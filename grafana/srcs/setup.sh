#!/bin/sh

#grafana check
if cd usr/share/grafana; then
	if ! /usr/sbin/grafana-server ; then
		exit 1
	fi
fi

#while grafana don't crash
while true;
do
	if ! pgrep grafana-server ; then
		exit 1
	fi
	sleep 2
done
