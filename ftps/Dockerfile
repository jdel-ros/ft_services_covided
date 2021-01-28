FROM alpine:3.12.3

#update and install utils
RUN apk update
RUN apk add openrc
RUN apk add vsftpd
RUN apk add openssl openssh
RUN rc-status
RUN touch /run/openrc/softlevel

#Telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir /etc/telegraf
ADD srcs/telegraf.conf /etc/telegraf/

#Key Generate
RUN	openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/private/vsftpd.key.pem -out /etc/ssl/certs/vsftpd.cert.pem
RUN ssh-keygen -A

#Add Conf
ADD ./srcs/vsftpd.conf /etc/vsftpd/

ADD ./srcs/setup.sh .
RUN chmod 777 setup.sh

EXPOSE 21

CMD		[ "/bin/ash", "setup.sh" ]
