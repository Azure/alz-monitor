targetScope = 'managementGroup'
// **Parameters**
// Generic Parameters - Used in multiple modules
@description('The region to deploy all resources into. DEFAULTS TO deployment().location')
param policyLocation string = deployment().location

module dnsZoneAlerts 'DINE_Policies/dnsZoneAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-qva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}

module keyVaultAlerts 'DINE_Policies/keyVaultAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-kva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module privateDnsZoneAlerts 'DINE_Policies/privateDnsZoneAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-pdva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module publicIPAddressAlerts 'DINE_Policies/publicIPAddressAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-pipva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module recoveryVaultAlerts 'DINE_Policies/recoveryVaultAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-rvva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module storageAccountAlerts 'DINE_Policies/storageAccountAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-sava-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module virtualMachineAlerts 'DINE_Policies/virtualMachineAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-vmva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module virtualNetworkAlerts 'DINE_Policies/virtualNetworkAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-vnva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module virtualNetworkGatewayAlerts 'DINE_Policies/virtualNetworkGatewayAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-vngva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
module vpnGatewayAlerts 'DINE_Policies/vpnGatewayAlerts_definition.bicep' = {
    name: '${uniqueString(deployment().name)}-vpnva-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
