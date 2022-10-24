targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ServiceHealthIncidentAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
  params: {
      name: 'deploy-activitylog-ServiceHealth-Incident'
      displayName: '[DINE] Deploy Service Health Incident Alert'
      description: 'DINE policy to Deploy Service Health Incident Alert'
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
                      equals: 'microsoft.insights/activityLogAlerts'
                  }
              ]
          }
          then: {
              effect: 'deployIfNotExists'
              details: {
                  roleDefinitionIds: deploymentRoleDefinitionIds
                  type: 'Microsoft.Insights/activityLogAlerts'
                  existenceCondition: {
                      allOf: [
                          {
                              field: 'Microsoft.Insights/activityLogAlerts/category'
                              equals: 'ServiceHealth'
                          }
                          {
                              field: 'Microsoft.Insights/activityLogAlerts/properties,incidentType'
                              equals: 'Incident'
                          }
                          {
                              field: 'Microsoft.Insights/activityLogAlerts/scopes[*]'
                              equals: '[concat(\'/subscriptions/\',subscription().id )]'
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
                              {
                                      type: 'microsoft.insights/activityLogAlerts'
                                      apiVersion: '2020-10-01'
                                      name: '[concat(subscription().name, \'-ServiceHealthIncident\')]'
                                      location: 'global'
                                      properties: {
                                          description: ' Service Health Incident Alert'
                                          enabled: true
                                          scopes: [
                                              '[concat(\'/subscriptions/\',subscription().id )]'
                                          ]
                                          condition: {
                                          allOf: [
                                              {
                                                field:'category'
                                                equals: 'ServiceHealth'
                                              }
                                              {
                                                field: 'properties.incidentType'
                                                equals: 'Incident'
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
