#!/bin/bash

export KUBECONFIG=$(go env GOPATH)/src/github.com/robmorgan/homelab/kubeconfig
kubectl config use-context default
kubectl get node -o wide
