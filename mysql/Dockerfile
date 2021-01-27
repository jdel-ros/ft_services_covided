FROM	alpine:3.12.3

RUN apk update
RUN apk add openrc
RUN apk add mariadb mariadb-client

RUN rc-status
RUN touch /run/openrc/softlevel
#telegraf
# RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# RUN apk add telegraf
# RUN mkdir /etc/telegraf 
# ADD srcs/telegraf.conf /etc/telegraf/

ADD		srcs/setup.sh .
RUN		chmod 777 setup.sh

EXPOSE 3306

CMD		[ "/bin/ash", "/setup.sh" ]
