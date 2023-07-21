# Creating a new Azure Portal

## Registering for Azure services via Azure CLI

To check the complete list of services available with your Azure account
```
az provider list --output table
```

To check the services registered with your Azure account
```
az provider list --query "[?registrationState=='Registered']" --output table
```

Register for a service via Azure CLI, such as Microsoft.Network
```
az provider register --namespace Microsoft.Network
```

