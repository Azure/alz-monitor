module alz_Actions 'actionGroup.bicep' ={
name: '${uniqueString(deployment().name)}-alz-actiongroup-deploy'
params: {
  deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
  policyLocation: policyLocation
}

}

