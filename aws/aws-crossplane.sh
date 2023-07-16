#!/bin/bash

# Create Kubernetes secret for AWS Access Key
kubectl create secret \
generic aws-secret \
-n crossplane-system \
--from-file=creds=./aws/aws-credentials.txt

# Create crossplane AWS provider
kubectl apply -f ./aws/provider.yaml