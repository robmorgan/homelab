#!/bin/bash

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

echo "Installing ingress-nginx with ingress-nginx/values.yaml..."
helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-nginx -f ingress-nginx/values.yaml

# verify that the controller is running
kubectl get pods -n ingress-nginx

# waiting for load balancer IP to be available
kubectl get service --namespace ingress-nginx ingress-nginx-controller --output wide --watch
