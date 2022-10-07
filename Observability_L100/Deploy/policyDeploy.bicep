targetScope = 'managementGroup'
// **Parameters**
// Generic Parameters - Used in multiple modules
@description('The region to deploy all resources into. DEFAULTS TO deployment().location')
param policyLocation string = deployment().location

module dinePolicies 'deploy_dine_policies.bicep' = {
  name: '${uniqueString(deployment().name)}-policyDefinitions'
  params: {
    policyLocation: policyLocation
  }
}
