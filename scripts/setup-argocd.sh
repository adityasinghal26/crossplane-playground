#!/bin/bash

# Add Helm repo for ArgoCD
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

# Install ArgoCD using Helm in argocd namespace
helm install argocd \
argo/argo-cd \
--namespace argocd \
--create-namespace