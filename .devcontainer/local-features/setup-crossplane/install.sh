#!/usr/bin/env bash
set -e

USERNAME="${USERNAME:-"${_REMOTE_USER}"}"

# Setup a Kubernetes cluster with kind
kind create cluster --image kindest/node:v1.26.6 --wait 1m --name crossplane-test

# Add Helm repo for Crossplane
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

# Install crossplane using Helm in crossplane-system namespace
helm install crossplane \
crossplane-stable/crossplane \
--namespace crossplane-system \
--create-namespace
