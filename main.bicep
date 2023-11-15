param location string = resourceGroup().location

resource hostingPlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'minimal-linux-example'
  location: location
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource appService 'Microsoft.Web/sites@2021-03-01' = {
  name: 'minimal-linux-example'
  location: location
  properties: {
    serverFarmId: hostingPlan.id
    httpsOnly: true
    siteConfig: {
      ftpsState: 'Disabled'
      http20Enabled: true
      netFrameworkVersion: 'v8.0'
      linuxFxVersion: 'DOTNETCORE|8.0'
      appCommandLine: 'dotnet WebApi.dll'
      publicNetworkAccess: 'Enabled'
    }
  }
}
