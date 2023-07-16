#!/bin/bash

# Setup a Kubernetes cluster with kind
kind create cluster --image kindest/node:v1.26.6 --wait 5m --name crossplane-test

# Add Helm repo for Crossplane
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

# Install crossplane using Helm in crossplane-system namespace
helm install crossplane \
crossplane-stable/crossplane \
--namespace crossplane-system \
--create-namespace

# Install kubectl-crossplane CLI and add it to PATH variables
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
sudo mv kubectl-crossplane /usr/local/bin



