FROM alpine:3.12.3

EXPOSE 8086

VOLUME [ "/sys/fs/cgroup" ]

#update and install utils
RUN apk update 1>/dev/null
RUN apk add openrc 1>/dev/null

RUN rc-status 1>/dev/null
RUN touch /run/openrc/softlevel

#add the community repo for the repositories packages file reference, telegraf exists in that repo
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf 1>/dev/null
#edit config file for file to link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "influxdb"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://127.0.0.1:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

#install InfluxDB
RUN apk add influxdb 1>/dev/null
# RUN mkdir /etc/influxdb
ADD ./srcs/influxdb.conf /etc/influxdb.conf

#copy the necessary files
ADD ./srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh
