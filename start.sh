# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdel-ros <jdel-ros@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 08:55:28 by jdel-ros          #+#    #+#              #
#    Updated: 2021/01/29 08:56:12 by jdel-ros         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

minikube start --vm-driver=virtualbox --memory=3g 
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
docker build -t nginx-image ./nginx
docker build -t mysql-image ./mysql
docker build -t wordpress-image ./wordpress
docker build -t phpmyadmin-image ./phpmyadmin
docker build -t grafana-image ./grafana
docker build -t influxdb-image ./influxdb
docker build -t ftps-image ./ftps
kubectl apply -k .
minikube dashboard
