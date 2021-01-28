#!/bin/sh
# minikube start
# minikube start --vm-driver=virtualbox \
#         --cpus 3 --disk-size=19080mb --memory=1908mb \
#         --extra-config=apiserver.service-node-port-range=1-32767
minikube start --vm-driver=virtualbox --memory=3g 
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# kubectl addons enable ingress
docker build -t nginx-image ./nginx
docker build -t mysql-image ./mysql
docker build -t wordpress-image ./wordpress
docker build -t phpmyadmin-image ./phpmyadmin
docker build -t grafana-image ./grafana
docker build -t influxdb-image ./influxdb
docker build -t ftps-image ./ftps
# kubectl apply -f ./nginx/nginx.yaml
# kubectl apply -f ./wordpress/wordpress.yaml
# kubectl apply -f ./kustomization.yaml
# kubectl apply -f ./metallb.yaml
# kubectl apply -f ./secret.yaml
kubectl apply -k .
minikube dashboard
