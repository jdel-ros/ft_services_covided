# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:57:27 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:57:27 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | admin
echo "user:password = $SSH_USER:$SSH_PASSWORD"
telegraf &
/usr/sbin/sshd
/usr/sbin/nginx -g 'daemon off;'
