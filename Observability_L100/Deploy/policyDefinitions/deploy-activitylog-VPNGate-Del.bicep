targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param parResourceGroupName string = 'AlzMonitoring-rg'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ActivityLogVPNGatewayDeleteAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_VPNGateway_Delete'
        displayName: '[DINE] Deploy Activity Log VPN Gateway Delete Alert'
        description: 'DINE policy to Deploy Activity Log VPN Gateway Delete Alert'
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
                        equals: 'Microsoft.Network/vpnGateways'
                    }
                ]
            }
            then: {
                effect: 'deployIfNotExists'
                details: {
                    roleDefinitionIds: deploymentRoleDefinitionIds
                    type: 'Microsoft.Insights/activityLogAlerts'
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
                                        equals: 'Administrative'
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
                                        equals: 'Microsoft.Network/vpnGateways/delete'
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
                                  name: 'ActivityVPNGatewayDelete'
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
                                  name: 'ActivityVPNGatewayDelete'
                                  location: 'global'
                                  properties: {
                                      description: 'Activity Log VPN Gateway Delete'
                                      enabled: true
                                      scopes: [
                                          '[subscription().id]'
                                      ]
                                      condition: {
                                      allOf: [
                                          {
                                            field:'category'
                                            equals: 'Administrative'
                                          }
                                          {
                                            field: 'operationName'
                                            equals: 'Microsoft.Network/vpnGateways/delete'
                                          }
                                          {
                                            field: 'status'
                                            containsAny: ['succeeded']
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
  