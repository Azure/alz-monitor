// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

@description('The management group scope at which the policy definition exists. DEFAULT VALUE = "alz"')
param parPolicyManagementGroupId string = 'alz'

@description('Set Parameter to true to Opt-out of deployment telemetry')
param parTelemetryOptOut bool = false

// Customer Usage Attribution Id
var varCuaid = '8d257c20-97bf-4d14-acb3-38dd1436d13a'

module Deploy_Alerting_Identity '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Alerting-Identity'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parPolicyManagementGroupId}/providers/Microsoft.Authorization/policySetDefinitions/Alerting-Identity'
    parPolicyAssignmentDisplayName: 'ALZ Monitoring Alerts for Identity'
    parPolicyAssignmentName: 'ALZ-Monitor_Identity'
    parPolicyAssignmentDescription: 'Initiative to deploy alerts relevant to the ALZ Identity Management group'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
  }
}

module Deploy_AlertProcessing_rule '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-AlertProcessing_rule'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parPolicyManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_AlertProcessing_Rule'
    parPolicyAssignmentDisplayName: 'ALZ Monitoring Alert Processing rule'
    parPolicyAssignmentName: 'ALZ-AlertProcessing_rule'
    parPolicyAssignmentDescription: 'Initiative to deploy alert processing rule and action group in each subscription'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
  }
}


module modCustomerUsageAttribution './CRML/customerUsageAttribution/cuaIdManagementGroup.bicep' = if (!parTelemetryOptOut) {
  #disable-next-line no-loc-expr-outside-params //Only to ensure telemetry data is stored in same location as deployment. See https://github.com/Azure/ALZ-Bicep/wiki/FAQ#why-are-some-linter-rules-disabled-via-the-disable-next-line-bicep-function for more information
  name: 'pid-${varCuaid}-${uniqueString(deployment().location)}'
  params: {}
}
