FROM	alpine:3.12

RUN apk update ; \
	apk add openrc ; \
	update openrc ; \
	apk add mysql mysql-client ; \
	rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /run/mysqld ; \
	chown -R mysql:mysql /run/mysqld /var/lib/mysql ; \
	chmod 777 /var/run/mysqld /var/lib/mysql

ADD		srcs/setup.sh .
ADD		srcs/creatdb.sql /creatdb.sql
ADD		srcs/my.cnf /etc/my.cnf
ADD		srcs/wordpress.sql .
RUN		chmod 777 setup.sh

EXPOSE 3306

CMD		[ "/bin/ash", "/setup.sh" ]
