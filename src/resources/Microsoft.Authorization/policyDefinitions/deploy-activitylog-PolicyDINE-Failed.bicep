targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param parResourceGroupName string = 'AlzMonitoring-rg'
param deploymentRoleDefinitionIds array = [
  '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ActivityLogPolicyDINEfailedAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
  params: {
    name: 'Deploy_activitylog_PolicyDINE_failed'
    displayName: '[DINE] Deploy Activity Log Policy DeployIfNotExists failed alert'
    description: 'DINE policy to Deploy Activity Log Policy DeployIfNotExists failed alert'
    location: policyLocation
    metadata: {
      version: '1.0.0'
      Category: 'ActivityLog'
      source: 'https://github.com/Azure/ALZ-Monitor/'
    }
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Resources/subscriptions'
          }
        ]
      }
      then: {
        effect: 'deployIfNotExists'
        details: {
          roleDefinitionIds: deploymentRoleDefinitionIds
          type: 'Microsoft.Insights/activityLogAlerts'
          name: 'ActivityPolicyDINEFailed'
          existenceScope: 'resourcegroup'
          resourceGroupName: parResourceGroupName
          deploymentScope: 'subscription'
          existenceCondition: {
            allOf: [

              {
                field: 'Microsoft.Insights/ActivityLogAlerts/enabled'
                equals: 'true'
              }
              {
                count: {
                  field: 'Microsoft.Insights/ActivityLogAlerts/condition.allOf[*]'
                  where: {
                    anyOf: [
                      {
                        allOf: [
                          {
                            field: 'Microsoft.Insights/ActivityLogAlerts/condition.allOf[*].field'
                            equals: 'category'
                          }
                          {
                            field: 'Microsoft.Insights/ActivityLogAlerts/condition.allOf[*].equals'
                            equals: 'Policy'
                          }
                        ]
                      }
                      {
                        allOf: [
                          {
                            field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].field'
                            equals: 'operationName'
                          }
                          {
                            field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].equals'
                            equals: 'Microsoft.Authorization/policies/deployIfNotExists/action'
                          }
                        ]
                      }
                    ]
                  }
                }
                equals: 2
              }
            ]
          }
          deployment: {
            location: policyLocation
            properties: {
              mode: 'incremental'
              template: {
                '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                contentVersion: '1.0.0.0'
                parameters: {
                  parResourceGroupName: {
                    type: 'string'
                    defaultValue: parResourceGroupName
                  }
                  policyLocation: {
                    type: 'string'
                    defaultValue: policyLocation
                  }
                }
                variables: {}
                resources: [

                  {
                    type: 'Microsoft.Resources/resourceGroups'
                    apiVersion: '2021-04-01'
                    name: parResourceGroupName
                    location: policyLocation
                  }
                  {
                    type: 'Microsoft.Resources/deployments'
                    apiVersion: '2019-10-01'
                    //change name
                    name: 'ActivityPolicyDINEFailed'
                    resourceGroup: parResourceGroupName
                    dependsOn: [
                      'Microsoft.Resources/resourceGroups/${parResourceGroupName}'
                    ]
                    properties: {
                      mode: 'Incremental'
                      template: {
                        '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                        contentVersion: '1.0.0.0'
                        parameters: {}
                        variables: {}
                        resources: [
                          {
                            type: 'microsoft.insights/activityLogAlerts'
                            apiVersion: '2020-10-01'
                            //name: '[concat(subscription().subscriptionId, \'-ActivityReGenKey\')]'
                            name: 'ActivityPolicyDINEFailed'
                            location: 'global'
                            properties: {
                              description: 'Activity Log Policy DeployIfNotExists failed'
                              enabled: true
                              scopes: [
                                '[subscription().id]'
                              ]
                              condition: {
                                allOf: [
                                  {
                                    field: 'category'
                                    equals: 'Policy'
                                  }
                                  {
                                    field: 'operationName'
                                    equals: 'Microsoft.Authorization/policies/deployIfNotExists/action'
                                  }
                                  {
                                    field: 'status'
                                    containsAny: [
                                      'Failed'
                                    ]
                                  }

                                ]
                              }
                            }

                          }
                        ]
                      }
                    }
                  }

                ]
              }

            }
          }
        }
      }
    }
  }
}
