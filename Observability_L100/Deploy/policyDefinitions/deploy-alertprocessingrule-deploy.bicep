targetScope = 'managementGroup'

param parResourceGroupName string = 'AlzMonitoring-rg'
param parActionGroupEmail string = 'action@mail.com'
param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
  '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

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
          type: 'Microsoft.AlertsManagement/actionRules'
          // should be replaced with parameter value
          resourceGroupName: parResourceGroupName
          existenceCondition: {
            allOf: [

              {
                field: 'Microsoft.AlertsManagement/actionRules/type'
                equals: 'AddActionGroups'
              }
              {
                field: 'Microsoft.AlertsManagement/actionRules/status'
                equals: 'enabled'
              }
             {
                field: 'Microsoft.AlertsManagement/actionRules/scope.values[*]'
                equals: '[subscription().subscriptionId]'


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
                    type: 'Microsoft.Resources/resourceGroups'
                    apiVersion: '2020-10-01'
                    name: parResourceGroupName
                    location: policyLocation
                    properties: {}
                  }

                  {
                    type: 'Microsoft.Resources/deployments'
                    apiVersion: '2019-10-01'
                    //change name
                    name: 'Action Group Deployment'
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
                            type: 'microsoft.insights/actionGroups'
                            apiVersion: '2020-10-01'
                            //name: '[concat(subscription().subscriptionId, \'-ActivityReGenKey\')]'
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
                            type: 'Microsoft.Resources/deployments'
                            apiVersion: '2019-10-01'
                            //change name
                            name: 'Alert Processing Rule Deployment'
                            resourceGroup: parResourceGroupName
                            dependsOn: [
                              'Microsoft.Resources/resourceGroups/${parResourceGroupName}/providers/microsoft.insights/actiongroups/AlzActionGrp'
                            ]
                            properties:{
                              mode: 'Incremental'
                              template: {
                                '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                                contentVersion: '1.0.0.0'
                                parameters: {}
                                variables: {}
                                resources: [
                                 {
                                  type:'Microsoft.AlertsManagement/actionRules'
                                  apiVersion: '2021-08-08'
                                  name: 'Alz Alert Processing Rule'
                                  location: 'global'
                                  properties: {
                                    scopes:   [
                                      '[subscription().subscriptionId]'

                                    ]
                                    enabled: true
                                    actions:[
                                      {
                                        actiongroupIds:[
                                          'Microsoft.Resources/resourceGroups/${parResourceGroupName}/providers/microsoft.insights/actiongroups/AlzActionGrp'

                                        ]
                                        actionType: 'AddActionGroups'


                                      }


                                    ]



                                  }



                                 } 




                                ]  




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
