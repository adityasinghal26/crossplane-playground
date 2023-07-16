#!/bin/bash

# Login to Azure via CLI using device code
# This is because we are using Codespace container
# which upon successful login, redirects to localhost:port 
# az login --use-device-code

# Set Azure Subscription ID from above command as env variable
set AZ_SUBSCRIPTION_ID=<your-subscription-id>

# Create an Azure Service Principal and authentication file
# Save the output as azure-credentials.json
az ad sp create-for-rbac \
--sdk-auth \
--role Owner \
--scopes /subscriptions/${AZ_SUBSCRIPTION_ID} > azure/azure-credentials.json

# Create Kubernetes secret with Azure credentials 
# stored in the file azure-credentials.json in last step
kubectl create secret \
generic azure-secret \
-n crossplane-system \
--from-file=creds=./azure/azure-credentials.json