FROM	alpine:3.12.3

#update and install utils
RUN apk update
RUN apk add openrc
#install MySQL
RUN apk add mariadb mariadb-client

RUN rc-status
RUN touch /run/openrc/softlevel




ADD		srcs/setup.sh .
RUN		chmod 777 setup.sh

EXPOSE 3306

CMD		[ "/bin/ash", "/setup.sh" ]
