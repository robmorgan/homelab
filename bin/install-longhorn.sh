#!/bin/bash

# Add Longhorn Helm repository
helm repo add longhorn https://charts.longhorn.io
helm repo update

# Create namespace for Longhorn
kubectl create namespace longhorn-system

# Install Longhorn using Helm
helm install longhorn longhorn/longhorn --namespace longhorn-system

# Wait for Longhorn pods to be running (use ctrl+c when all pods are running!)
kubectl get pods -n longhorn-system --watch

# Optional: Set Longhorn as the default storage class
kubectl patch storageclass longhorn -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# Access Longhorn UI (using port-forward)
kubectl port-forward -n longhorn-system svc/longhorn-frontend 8000:80
