#!/bin/bash

helm repo add metallb https://metallb.github.io/metallb
helm repo update
helm install metallb metallb/metallb --namespace metallb-system --create-namespace

kubectl apply -f MetalLB/config.yaml
kubectl get pods -n metallb-system
