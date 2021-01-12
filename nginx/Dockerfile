FROM	alpine:latest

RUN 	apk update && apk add nginx \
&& apk add nginx openrc openssl openssh

RUN		mkdir /run/nginx /www && \
		chown -R nginx:nginx /www 

RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/services.key -out /etc/nginx/ssl/services.pem -subj "/C=FR/ST=Lyon/L=Lyon/O=42, Inc./OU=IT/CN=ft_services"

RUN		rm etc/nginx/nginx.conf
ADD		srcs/nginx.conf /etc/nginx/
ADD		srcs/index.html	/www/
ADD		srcs/sshd_conf etc/ssh/
ADD		srcs/setup.sh .
RUN		chmod +x setup.sh

EXPOSE	80 443 22

CMD		./setup.sh
