#!/bin/sh

#grafana check
if cd usr/share/grafana; then
	if ! /usr/sbin/grafana-server > /dev/null 2>&1; then
		exit 1
	fi
fi

#while grafana don't crash
while true;
do
	if ! pgrep grafana-server >/dev/null 2>&1 ; then
		exit 1
	fi
	sleep 2
done
