#!/bin/bash

helm repo add metallb https://metallb.github.io/metallb
helm repo update
helm install metallb metallb/metallb --namespace metallb-system --create-namespace

# Create a secret for encrypted speaker communications
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f MetalLB/config.yaml
kubectl get pods -n metallb-system
