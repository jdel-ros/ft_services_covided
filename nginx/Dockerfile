# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:50:47 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:57:29 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.3

#Update and install utils
RUN apk update && apk add nginx \
&& apk add openrc openssl openssh

#Telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir /etc/telegraf 
ADD srcs/telegraf.conf /etc/telegraf/

#Key Generate
RUN	mkdir /run/nginx /www && \
		chown -R nginx:nginx /www
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Lyon/L=Lyon/O=42, Inc./OU=IT/CN=ft_services"

#Add Conf
RUN	rm etc/nginx/nginx.conf
ADD	srcs/nginx.conf /etc/nginx/
ADD	srcs/index.html	/www/
ADD	srcs/sshd_conf etc/ssh/
ADD	srcs/setup.sh .
RUN	chmod 777 setup.sh

EXPOSE	80 443 22

CMD		./setup.sh
