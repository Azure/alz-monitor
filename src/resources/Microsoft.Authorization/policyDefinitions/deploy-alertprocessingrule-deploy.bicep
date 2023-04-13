targetScope = 'managementGroup'

param parResourceGroupName string = 'AlzMonitoring-rg'
param parResourceGroupLocation string = 'centralus'
param parActionGroupEmail string = 'action@mail.com'
param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
  '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]
param parResourceGroupTags object = {
  environment: 'test'
}

param parMonitorDisable string = 'MonitorDisable'

module AlertProcessingRule '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
  params: {
    name: 'Deploy_AlertProcessing_Rule'
    displayName: '[DINE] Deploy Alert Processing Rule'
    description: 'DINE policy to Deploy Deploy Alert Processing Rule with Action Group'
    location: policyLocation
    metadata: {
      version: '1.0.0'
      Category: 'Action Groups'
      source: 'https://github.com/Azure/ALZ-Monitor/'
    }
    parameters: {
      ALZMonitorResourceGroupName: {
        type: 'String'
        metadata: {
          displayName: 'Resource Group Name'
          description: 'Resource group the alert is placed in'
        }
        defaultValue: parResourceGroupName
      }
      ALZMonitorResourceGroupTags: {
        type: 'Object'
        metadata: {
          displayName: 'Resource Group Tags'
          description: 'Tags on the Resource group the alert is placed in'
        }
        defaultValue: parResourceGroupTags
      }
      ALZMonitorResourceGroupLocation: {
        type: 'String'
        metadata: {
          displayName: 'Resource Group Location'
          description: 'Location of the Resource group the alert is placed in'
        }
        defaultValue: parResourceGroupLocation
      }
      MonitorDisable: {
        type: 'String'
        metadata: {
            displayName: 'Effect'
            description: 'Tag name to disable monitoring at subscription. Set to true if monitoring process rule should be disabled'
        }
  
        defaultValue: parMonitorDisable
    }
    }
    policyRule: {
      if: {
        allOf: [

          {
            field: 'type'
            equals: 'Microsoft.Resources/subscriptions'
          }
          {
            field: '[concat(\'tags[\', parameters(\'MonitorDisable\'), \']\')]'
            notEquals: 'true'
        }
        ]
      }
      then: {
        effect: 'deployIfNotExists'
        details: {
          roleDefinitionIds: deploymentRoleDefinitionIds
          type: 'Microsoft.AlertsManagement/actionRules'
          existenceScope: 'resourcegroup'
          resourceGroupName: '[parameters(\'ALZMonitorResourceGroupName\')]'
          deploymentScope: 'subscription'
          existenceCondition: {
            allOf: [

              {
                field: 'Microsoft.AlertsManagement/actionRules/description'
                equals: 'Alz Alert Processing Rule for Subscription'
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
                  ALZMonitorResourceGroupName: {
                    type: 'string'
                  }
                  ALZMonitorResourceGroupTags: {
                    type: 'object'
                  }
                  ALZMonitorResourceGroupLocation: {
                    type: 'string'
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
                    name: '[parameters(\'ALZMonitorResourceGroupName\')]'
                    location: '[parameters(\'ALZMonitorResourceGroupLocation\')]'
                    tags: '[parameters(\'ALZMonitorResourceGroupTags\')]'
                  }
                  {
                    type: 'Microsoft.Resources/deployments'
                    apiVersion: '2019-10-01'
                    name: 'ActionGroupDeployment'
                    resourceGroup: '[parameters(\'ALZMonitorResourceGroupName\')]'
                    dependsOn: [
                      '[concat(\'Microsoft.Resources/resourceGroups/\', parameters(\'ALZMonitorResourceGroupName\'))]'
                    ]
                    properties: {
                      mode: 'Incremental'
                      template: {
                        '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                        contentVersion: '1.0.0.0'
                        parameters: {
                          ALZMonitorResourceGroupName: {
                            type: 'string'
                          }
                        }
                        variables: {}
                        resources: [
                          {
                            type: 'Microsoft.Insights/actionGroups'
                            apiVersion: '2022-04-01'
                            name: 'AlzActionGrp'
                            location: 'global'
                            properties: {
                              groupShortName: 'AlzActionGrp'
                              enabled: true
                              emailReceivers: [
                                {
                                  name: 'AlzMail'
                                  emailAddress: parActionGroupEmail
                                  useCommonAlertSchema: true

                                }
                              ]
                            }
                          }
                          {
                            type: 'Microsoft.AlertsManagement/actionRules'
                            apiVersion: '2021-08-08'
                            name: 'Alz Alert Processing Rule'
                            location: 'global'
                             dependsOn: [
                            '[concat(\'Microsoft.Insights/actionGroups/\', \'AlzActionGrp\')]'
                             ]
                            properties: {
                              scopes: [
                                '[subscription().Id]'
                              ]
                              description: 'Alz Alert Processing Rule for Subscription'
                              enabled: true
                              actions: [
                                {
                                  actiongroupIds: [
                                    '''[resourceId('Microsoft.Insights/actionGroups','AlzActionGrp')]'''
                                  ]
                                  actionType: 'AddActionGroups'
                                }
                              ]
                            }
                          }
                        ]
                      }
                      parameters: {
                        ALZMonitorResourceGroupName: {
                          value: '[parameters(\'ALZMonitorResourceGroupName\')]'
                        }
                      }
                    }
                  }
                ]
              }
              parameters: {
                ALZMonitorResourceGroupName: {
                  value: '[parameters(\'ALZMonitorResourceGroupName\')]'
                }
                ALZMonitorResourceGroupTags: {
                  value: '[parameters(\'ALZMonitorResourceGroupTags\')]'
                }
                ALZMonitorResourceGroupLocation: {
                  value: '[parameters(\'ALZMonitorResourceGroupLocation\')]'
                }
              }
            }
          }
        }
      }
    }
  }
}
