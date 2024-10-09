#!/bin/bash

helm repo add portainer https://portainer.github.io/k8s/
helm repo update

# Note: we don't enable an ingress here as it will be handled by nginx-ingress in portainer/ingress.yaml.
echo "Installing Portainer..."
helm upgrade --install --create-namespace -n portainer portainer portainer/portainer \
    --set service.type=ClusterIP \
    --set image.tag=2.21.3

# TODO - if I can find a way to get this to work with cert-manager, then we can use it, instead of manually applying
# the ingress.yaml file.
# helm upgrade --install --create-namespace -n portainer portainer portainer/portainer \
#     --set service.type=ClusterIP \
#     --set tls.force=true \
#     --set image.tag=2.21.3 \
#     --set ingress.enabled=true \
#     --set ingress.ingressClassName=nginx \
#     --set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod \
#     --set ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"=HTTPS \
#     --set ingress.hosts[0].host=portainer.mrncloud.com \
#     --set ingress.hosts[0].paths[0].path="/"
