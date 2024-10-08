# Troubleshooting

Common operations

## Restart MetalLB pods

```sh
kubectl delete pods -l app.kubernetes.io/name=metallb -n metallb-system
```

The deployments will automatically create them.

Verify the logs:

```sh
kubectl logs -l app.kubernetes.io/name=metallb -n metallb-system
```

## Restart ingress-nginx pods

```sh
kubectl delete pods -l app.kubernetes.io/name=ingress-nginx -n ingress-nginx
```

View the logs:

```sh
kubectl logs -l app.kubernetes.io/name=ingress-nginx -n ingress-nginx
```

## Restart cloudflared pods

```sh
kubectl delete pod -l app=cloudflared -n cloudflare
```

View the logs:

```sh
kubectl logs -l app=cloudflared -n cloudflare
```

## Home Assistant 

Restart the deployment/pods:

```sh
kubectl rollout restart deployment home-assistant -n home-assistant
```

View the logs:

```sh
kubectl logs -l app=home-assistant -n home-assistant
```

## Portainer

Restart the deployment/pods:

```sh
kubectl rollout restart deployment portainer -n portainer
```

View the logs:

```sh
kubectl logs -l app.kubernetes.io/name=portainer -n portainer
```