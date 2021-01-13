#!/bin/sh
adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | admin
echo "user:password = $SSH_USER:$SSH_PASSWORD"
/usr/sbin/sshd
/usr/sbin/nginx -g 'daemon off;'
