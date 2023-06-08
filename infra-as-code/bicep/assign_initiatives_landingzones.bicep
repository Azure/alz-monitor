// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

@description('The management group scope at which the policy definition exists. DEFAULT VALUE = "alz"')
param parPolicyManagementGroupId string = 'alz'

@description('Set Parameter to true to Opt-out of deployment telemetry')
param parTelemetryOptOut bool = false

@description('The base parameters to be passed to the policy definition for resource group name, location and tags.')
param parPolicyAssignmentParameters  object = {}

@description('The LZ parameters to be passed to the policy definition.')
param parPolicyAssignmentParametersLZ  object = {}

// Customer Usage Attribution Id
var varCuaid = '7bcfc615-be78-43da-b81d-98959a9465a5'

var varPolicyAssignmentParametersLZ = union(parPolicyAssignmentParameters, parPolicyAssignmentParametersLZ)

module Deploy_Alerting_Management '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Alerting-LandingZones'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parPolicyManagementGroupId}/providers/Microsoft.Authorization/policySetDefinitions/Alerting-LandingZone'
    parPolicyAssignmentDisplayName: 'ALZ Monitoring Alerts for LandingZones'
    parPolicyAssignmentName: 'ALZ-Monitor_LandingZones'
    parPolicyAssignmentDescription: 'Initiative to deploy alerts relevant to the ALZ LandingZones management group'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentParameters: varPolicyAssignmentParametersLZ
  }
}

module modCustomerUsageAttribution './CRML/customerUsageAttribution/cuaIdManagementGroup.bicep' = if (!parTelemetryOptOut) {
  #disable-next-line no-loc-expr-outside-params //Only to ensure telemetry data is stored in same location as deployment. See https://github.com/Azure/ALZ-Bicep/wiki/FAQ#why-are-some-linter-rules-disabled-via-the-disable-next-line-bicep-function for more information
  name: 'pid-${varCuaid}-${uniqueString(deployment().location)}'
  params: {}
}
