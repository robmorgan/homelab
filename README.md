# homelab
My HomeLab Setup

mrncloud.com

## Components

 * Kubernetes Cluster running k3s.
 * MetalLB: https://metallb.universe.tf/. Use your home network IP space for load balancing and map multiple services to the same IP.
 * helm
 * portainer:ce
 * home-assistant
 * Persistent storage: Longhorn.
 * S3 Layer: Minio

## Prerequisites

### Hardware

My Home Lab currently consists of the following components:

* 1 x Raspberry Pi 5 w/PCIE Hat + Fan (8 GB, 1 TB SSD)

### Local Machine

Your local machine should have the following installed:

 * kubectl
 * helm

## Getting Started

### Bootstrapping the Cluster

First you'll need a Raspberry Pi with a Ubuntu derived installed connected to your home network. Run the following
script on the device to update and install the necessary packages.

```sh
./bin/bootstrap-pi.sh
```

Next ensure the Pi is available under the following hostname: `pi.mrncloud.com` and run the following to install K3s:

```sh
./bin/bootstrap-remote-k3s-cluster.sh
```

That should install K3s and write a `kubeconfig` file to your local machine. We can test K3s was installed successfully
by running the following:

```sh
./bin/configure-kubectl.sh
```

### Install MetalLB

### Install Nginx Ingress Controller

```sh
./bin/install-nginx-ingress.sh
```

### Install and Configure Cert Manager

```sh
./bin/install-cert-manager.sh
kubectl apply -f cert-manager/certificate.yaml
kubectl apply -f cert-manager/config.yaml
kubectl apply -f cert-manager/ingress.yaml
```

### Configure Cloudflared for Secure Remote Access

```sh
# First on your local machine, create a new tunnel
cloudflared tunnel create PER_CASANOEMI_001

# then upload the secret to k8s
kubectl create secret generic tunnel-credentials -n cloudflare \
    --from-file=credentials.json=/Users/<USER>/.cloudflared/<TUNNEL ID>.json

# create the namespace
kubectl create namespace cloudflare

# create the deployment
kubectl apply -f cloudflare-daemon/deployment.yaml

# wait for pods
kubectl get pods -n cloudflare --watch

# examine pod status
kubectl logs -n cloudflare $(kubectl get pod -l app=cloudflared -n cloudflare -o jsonpath="{.items[0].metadata.name}")

# setup routes
cloudflared tunnel route dns b93b64c6-418d-404c-b6c6-79e12300d7b8 tunnel.mrncloud.com
```

### Install Home Assistant

```sh
kubectl apply -f home-assistant/configmap_updated.yaml
kubectl apply -f home-assistant/pvc.yaml
kubectl apply -f home-assistant/deployment.yaml
```

## Open Questions

 * Should I disable traefik?
 * How should I handle persistent storage?

## TODO

- [ ] Remote access via Tailscale / Cloudflare

## References

 * https://cert-manager.io/v1.15-docs/configuration/acme/
 * https://github.com/jaygould/home-assistant/
 * https://github.com/mysticrenji/home-assistant-on-kubernetes
 * https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/
 * https://github.com/ChristianLempa/homelab
