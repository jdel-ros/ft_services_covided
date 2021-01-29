# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:58:51 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:58:52 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
telegraf &
adduser -D "user42" && echo "user42:bla" | chpasswd
chown -R user42:user42 /home/user42
touch /var/log/vsftpd.log
echo "user42" | tee -a /etc/vsftpd.userlist
mkdir /var/run/vsftpd
mkdir /var/run/vsftpd/empty
service vsftpd restart
tail -f /var/log/vsftpd.log