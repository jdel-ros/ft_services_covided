# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/18 13:47:40 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/18 15:40:32 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN apk update  \
	&& apk add wget nginx openssl openrc php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session
ADD		srcs/nginx.conf /etc/nginx/

RUN		mkdir /run/nginx /www && \
		chown -R nginx:nginx /www && \
	 	openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:4096 \
		 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

RUN 	wget -q https://wordpress.org/latest.tar.gz
RUN		tar xzf latest.tar.gz -C /www/

ADD		srcs/setup.sh .
ADD		srcs/wp-config.php /www/wordpress/.

EXPOSE	5050

CMD		[ "/bin/ash", "/setup.sh" ]
