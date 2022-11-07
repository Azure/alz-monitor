targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ResourceHealthUnhealthyAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_ResourceHealth_Unhealthy_Alert'
        displayName: '[DINE] Deploy Resource Health Unhealthy Alert'
        description: 'DINE policy to Deploy Resource Health Unhealthy Alert'
        location: policyLocation
        metadata: {
            version: '1.0.0'
            Category: 'ServiceHealth'
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
                    // should be replaced with parameter value
                    resourceGroupName: 'networkWatcherRG'
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
                                        equals: 'ResourceHealth'
                                      }
                                    ]
                                  }
                                  {
                                    allOf: [
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].field'
                                        equals: 'properties.cause'
                                      }
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].equals'
                                        equals: 'PlatformInitiated'
                                      }
                                    ]
                                  }
                                  {
                                    allOf: [
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].field'
                                        equals: 'properties.currentHealthStatus'
                                      }
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].equals'
                                        equals: 'Degraded'
                                      }
                                    ]
                                  }
                                  {
                                    allOf: [
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].field'
                                        equals: 'properties.currentHealthStatus'
                                      }
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].equals'
                                        equals: 'Unavailable'
                                      }
                                    ]
                                  }
                                  
                                ]
                              }
                            }
                            equals: 4
                          }
                        ]
                    }
                    deployment: {
                        properties: {
                            mode: 'incremental'
                            template: {
                                '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                                contentVersion: '1.0.0.0'
                                variables: {}
                                resources: [ 
                                //should deploy resource group as well
                                {
                                        type: 'microsoft.insights/activityLogAlerts'
                                        apiVersion: '2020-10-01'
                                        //name: '[concat(subscription().subscriptionId, \'-ResourceHealthAlert\')]'
                                        name: 'ResourceHealthUnhealthyAlert'
                                        location: 'global'
                                        properties: {
                                            description: 'Resource Health Unhealthy Alert'
                                            enabled: true
                                            scopes: [
                                                '[subscription().id]'
                                            ]
                                            condition: {
                                            allOf: [
                                                {
                                                  field:'category'
                                                  equals: 'ResourceHealth'
                                                }
                                                {
                                                  anyOf: [
                                                      {
                                                          field: 'properties.cause'
                                                          equals: 'PlatformInitiated'
                                                      }
                                                      {
                                                          field: 'properties.cause'
                                                          equals: 'UserInitiated'
                                                      }
                                                  ]
                                              }
                                              {
                                                anyOf: [
                                                    {
                                                        field: 'properties.currentHealthStatus'
                                                        equals: 'Degraded'
                                                    }
                                                    {
                                                        field: 'properties.currentHealthStatus'
                                                        equals: 'Unavailable'
                                                    }
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
                }
            }
        }
    }
  }
  