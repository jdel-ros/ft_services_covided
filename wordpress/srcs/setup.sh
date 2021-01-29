# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:56:31 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:56:32 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
/usr/sbin/php-fpm7
telegraf &
nginx -g "daemon off;"

# while true;
# do
# 	if ! pgrep telegraf ; then
# 		exit 1
# 	fi
# 	sleep 2
# done

