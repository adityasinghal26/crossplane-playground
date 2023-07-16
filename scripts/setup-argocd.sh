#!/bin/bash

# Add Helm repo for ArgoCD
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

# Install ArgoCD using Helm in argocd namespace
helm install argocd \
argo/argo-cd \
--namespace argocd \
--create-namespace

# Install ArgoCD CLI and add it to PATH variables
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd 
rm argocd-linux-amd64