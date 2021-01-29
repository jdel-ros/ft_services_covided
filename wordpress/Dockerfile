# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/18 13:47:40 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:56:09 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12.3

#Update and install utils
RUN apk update ; \
	apk add wget nginx openssl openrc php7 php7-fpm php7-opcache ; \
	apk add php7-gd php7-mysqli php7-zlib php7-curl ; \
	apk add php7-mbstring php7-json php7-session
ADD	srcs/nginx.conf /etc/nginx/

#Telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir /etc/telegraf 
ADD srcs/telegraf.conf /etc/telegraf/

#Key Generat
RUN	mkdir /run/nginx /www && \
		chown -R nginx:nginx /www && \
		openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:4096 \
		-keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

#Install WordPress
RUN wget -q https://wordpress.org/latest.tar.gz
RUN	tar xzf latest.tar.gz -C /www/

#Add Conf
ADD	srcs/setup.sh .
RUN	chmod 777 setup.sh
ADD	srcs/wp-config.php /www/wordpress/.

EXPOSE	5050

CMD		[ "/bin/ash", "/setup.sh" ]
