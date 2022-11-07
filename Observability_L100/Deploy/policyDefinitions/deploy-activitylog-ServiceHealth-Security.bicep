targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ServiceHealthIncidentAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_ServiceHealth_SecurityAdvisory'
        displayName: '[DINE] Deploy Service Health Security Advisory Alert'
        description: 'DINE policy to Deploy Service Health Security Advisory Alert'
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
                                        equals: 'ServiceHealth'
                                      }
                                    ]
                                  }
                                  {
                                    allOf: [
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].field'
                                        equals: 'properties.incidentType'
                                      }
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].anyOf[*].equals'
                                        equals: 'Security'
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
                                        //name: '[concat(subscription().subscriptionId, \'-ServiceHealthIncident\')]'
                                        name: 'ServiceHealthSecurityAdvisory'
                                        location: 'global'
                                        properties: {
                                            description: 'Service Health Security Advisory'
                                            enabled: true
                                            scopes: [
                                                '[subscription().id]'
                                            ]
                                            condition: {
                                            allOf: [
                                                {
                                                  field:'category'
                                                  equals: 'ServiceHealth'
                                                }
                                                {
                                                  field: 'properties.incidentType'
                                                  equals: 'Security'
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
  