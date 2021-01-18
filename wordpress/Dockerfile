FROM	alpine:3.12

RUN 	apk add wget nginx openssl openrc php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-fpm mysql-client

# RUN		mkdir /run/nginx /www && \
# 		chown -R nginx:nginx /www

# RUN		mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Lyon/L=Lyon/O=42, Inc./OU=IT/CN=ft_services"
RUN		mkdir /run/nginx /www && \
		chown -R nginx:nginx /www && \
	 	openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:4096 \
		 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

RUN		rm etc/nginx/nginx.conf
ADD		srcs/nginx.conf /etc/nginx/
# ADD		srcs/sshd_conf etc/ssh/
ADD		srcs/setup.sh .
RUN		chmod +x setup.sh
RUN 	wget -q https://wordpress.org/latest.tar.gz
RUN		tar xzf latest.tar.gz -C /www/
ADD		srcs/wp-config.php /www/wordpress/.
# RUN wget -O wordpress.zip https://wordpress.org/latest.zip \
# 	&& unzip /wordpress.zip -d /usr/share/ 1> /dev/null  \
# 	&& rm wordpress.zip \
# 	&& rm -rf /usr/share/wordpress/wp-config.php \
# 	&& rm -rf /var/cache/apk/*

EXPOSE	5050

CMD		./setup.sh
