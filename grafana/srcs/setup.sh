# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:58:04 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:59:05 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
telegraf &
/usr/sbin/grafana-server --homepath=/usr/share/grafana
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
