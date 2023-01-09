// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module TotalJobAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-aatotaljob-policyDefinitions'
  params: {
      name: 'Deploy_AA_TotalJob_Alert'
      displayName: '[DINE] Deploy Automation Account TotalJob Alert'
      description: 'DINE policy to audit/deploy Automation Account TotalJob Alert'
      location: policyLocation
      metadata: {
          version: '1.0.0'
          Category: 'Networking'
          source: 'https://github.com/Azure/ALZ-Monitor/'
      }
      policyRule: {
          if: {
              allOf: [
                  {
                      field: 'type'
                      equals: 'Microsoft.Automation/automationAccounts'
                  }
              ]
          }
          then: {
              effect: 'deployIfNotExists'
              details: {
                  roleDefinitionIds: deploymentRoleDefinitionIds
                  type: 'Microsoft.Insights/metricAlerts'
                  existenceCondition: {
                      allOf: [
                          {
                              field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft-Azure-Monitor-SingleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
                              equals: 'Microsoft.Automation/automationAccounts'
                          }
                          {
                              field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft-Azure-Monitor-SingleResourceMultipleMetricCriteria.allOf[*].metricName'
                              equals: 'TotalJob'
                          }
                          {
                              field: 'Microsoft.Insights/metricalerts/scopes[*]'
                              equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Automation/automationAccounts/\', field(\'fullName\'))]'
                          }
                      ]
                  }
                  deployment: {
                      properties: {
                          mode: 'incremental'
                          template: {
                              '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                              contentVersion: '1.0.0.0'
                              parameters: {
                                  resourceName: {
                                      type: 'String'
                                      metadata: {
                                          displayName: 'resourceName'
                                          description: 'Name of the resource'
                                      }
                                  }
                                  resourceId: {
                                      type: 'String'
                                      metadata: {
                                          displayName: 'resourceId'
                                          description: 'Resource ID of the resource emitting the metric that will be used for the comparison'
                                      }
                                  }
                              }
                              variables: {}
                              resources: [ 
                              {
                                      type: 'Microsoft.Insights/metricAlerts'
                                      apiVersion: '2018-03-01'
                                      name: '[concat(parameters(\'resourceName\'), \'-TotalJob\')]'
                                      location: 'global'
                                      properties: {
                                          description: 'Metric Alert for Automation Account TotalJob Alert'
                                          severity: 3
                                          enabled: true
                                          scopes: [
                                              '[parameters(\'resourceId\')]'
                                          ]
                                          evaluationFrequency: 'PT5M'
                                          windowSize: 'PT5M'
                                          criteria: {
                                              allOf: [
                                                  {
                                                      name: 'TotalJob'
                                                      metricNamespace: 'Microsoft.Automation/automationAccounts'
                                                      metricName: 'TotalJob'
                                                      dimensions: [
                                                        {
                                                            name: 'Status'
                                                            operator: 'Exclude'
                                                            values: [
                                                                'Completed'
                                                            ]
                                                        }
                                                    ]
                                                      operator: 'GreaterThanOrEqual'
                                                      threshold: 90
                                                      timeAggregation: 'Average'
                                                      criterionType: 'StaticThresholdCriterion'
                                                  }
                                              ]
                                              'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
                                          }
                                      }

                                  }
                              ]
                          }
                          parameters: {
                              resourceName: {
                                  value: '[field(\'name\')]'
                              }
                              resourceId: {
                                  value: '[field(\'id\')]'
                              }
                          }
                      }
                  }
              }
          }
      }
  }
}
