#!/bin/bash

helm repo add portainer https://portainer.github.io/k8s/
helm repo update

echo "Installing Portainer..."
helm upgrade --install --create-namespace -n portainer portainer portainer/portainer \
    --set service.type=ClusterIP \
    --set tls.force=true \
    --set image.tag=2.21.2 \
    --set ingress.enabled=true \
    --set ingress.ingressClassName=nginx \
    --set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"=HTTPS \
    --set ingress.hosts[0].host=portainer.mrncloud.com \
    --set ingress.hosts[0].paths[0].path="/"
