# Minimal Linux Web App Project to Run and Deploy to Azure

## Get SP
```bash
az ad sp create-for-rbac --name "sp-minmal-linux-example" --role contributor --scopes rg-id
```


# Run project locally

### Build
```shell
dotnet build WebApi\WebApi.csproj -o Build
```
### Run
```shell
dotnet Build\WebApi.dll
```

# Deploy to Azure
### Login to Azure
```shell
az login
```

### Set Subscription where you will deploy it
```shell
az account set --subscription <subscription-id>
```

### Create Resouce Group
```shell
az group create --location westeurope --name minimal-linux-example
```

### Deploy Bicep
```shell
az deployment group create --resource-group minimal-linux-example --template-file main.bicep 
```

### Build App
```shell
dotnet build WebApi\WebApi.csproj -o Build
```

### Zip App
You can use any method to zip the Build folder.

```shell
zip -vr Build.zip Build
```

### Upload App
```shell
az webapp deployment source config-zip --subscription <subscription-id> --resource-group minimal-linux-example --name minimal-linux-example --src Build.zip
```
