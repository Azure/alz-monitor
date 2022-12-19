targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param parResourceGroupName string = 'AlzMonitoring-rg'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ServiceHealthMaintenanceAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_ServiceHealth_Maintenance'
        displayName: '[DINE] Deploy Service Health Maintenance Alert'
        description: 'DINE policy to Deploy Service Health Maintenance Alert'
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
                    existenceScope: 'resourcegroup'
                    // should be replaced with parameter value
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
                                        equals: 'ServiceHealth'
                                      }
                                    ]
                                  }
                                  {
                                    allOf: [
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].field'
                                        equals: 'properties.incidentType'
                                      }
                                      {
                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].equals'
                                        equals: 'Maintenance'
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
                                variables: {}
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
                                  name: 'ServiceHealthMaintenance'
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
                                  name: 'ServiceHealthPlannedMaintenance'
                                  location: 'global'
                                  properties: {
                                      description: 'ServiceHealthPlannedMaintenance Alert'
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
                                            equals: 'Maintenance'
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
  