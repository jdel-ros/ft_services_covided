# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/26 08:27:38 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/26 10:05:46 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3
# VOLUME [ "/sys/fs/cgroup" ]

#update and install utils
RUN apk update
RUN apk add influxdb
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel


#add the community repo for the repositories packages file reference, telegraf exists in that repo
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf 
#edit config file for file to link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "influxdb"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://127.0.0.1:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

#install InfluxDB
RUN mkdir /etc/influxdb
ADD ./srcs/influxdb.conf /etc/influxdb/influxdb.conf

ADD ./srcs/setup.sh . 
RUN chmod 777 setup.sh

EXPOSE 8086

CMD		[ "/bin/ash", "setup.sh" ]
