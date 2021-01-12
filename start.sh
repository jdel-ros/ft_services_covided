#!/bin/sh
minikube start --driver=docker
eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# kubectl addons enable ingress
docker build -t nginx-image ./nginx
# docker build -t nginx-image ./wordpress
# docker build -t nginx-image ./phpmyadmin
kubectl apply -f ./nginx/nginx.yaml
minikube dashboard