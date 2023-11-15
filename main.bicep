param location string = resourceGroup().location
@allowed([ 'DOTNETCORE|7.0', 'DOTNETCORE|8.0' ])
param linuxFxVersion string
@allowed([ 'v7.0', 'v8.0' ])
param netFrameworkVersion string
param name string

resource hostingPlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: '${name}-hosting-plan'
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
  name: '${name}-app'
  location: location
  properties: {
    serverFarmId: hostingPlan.id
    httpsOnly: true
    siteConfig: {
      ftpsState: 'Disabled'
      http20Enabled: true
      netFrameworkVersion: netFrameworkVersion
      linuxFxVersion: linuxFxVersion
      appCommandLine: 'dotnet WebApi.dll'
      publicNetworkAccess: 'Enabled'
    }
  }
}
