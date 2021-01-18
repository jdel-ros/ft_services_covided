FROM	alpine:3.12

RUN 	apk update && apk add nginx \
&& apk add openrc openssl openssh
RUN apk update \
	&& apk add php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session mysql-client

RUN		mkdir /run/nginx /www && \
		chown -R nginx:nginx /www

RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Lyon/L=Lyon/O=42, Inc./OU=IT/CN=ft_services"

RUN		rm etc/nginx/nginx.conf
ADD		srcs/nginx.conf /etc/nginx/
ADD		srcs/index.html	/www/
ADD		srcs/sshd_conf etc/ssh/
ADD		srcs/setup.sh .
RUN		chmod +x setup.sh
RUN 	wget -q https://wordpress.org/latest.tar.gz && \
		tar xzf latest.tar.gz -C /www/
ADD		srcs/wp-config.php /www/wordpress/.

CMD		./setup.sh
