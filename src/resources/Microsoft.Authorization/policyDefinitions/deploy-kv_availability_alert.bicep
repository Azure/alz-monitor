// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

@allowed([
    '0'
    '1'
    '2'
    '3'
    '4'
])
param parAlertSeverity string = '1'

@allowed([
    'PT1M'
    'PT5M'
    'PT15M'
    'PT30M'
    'PT1H'
    'PT6H'
    'PT12H'
    'P1D'
])
param parWindowSize string = 'PT5M'

@allowed([
    'PT1M'
    'PT5M'
    'PT15M'
    'PT30M'
    'PT1H'
])
param parEvaluationFrequency string = 'PT1M'

@allowed([
    'deployIfNotExists'
    'disabled'
])
param parPolicyEffect string = 'disabled'

param parThreshold string = '90'

module AvailabilityAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-kva-policyDefinitions'
    params: {
        name: 'Deploy_KeyVault_Availability_Alert'
        displayName: '[DINE] Deploy KeyVault Availability Alert'
        description: 'DINE policy to audit/deploy KeyVault Availability Alert'
        location: policyLocation
        metadata: {
            version: '1.0.0'
            Category: 'Key Vault'
            source: 'https://github.com/Azure/ALZ-Monitor/'
        }
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'microsoft.keyvault/vaults'
                    }
                ]
            }
            then: {
                effect: parPolicyEffect
                details: {
                    roleDefinitionIds: deploymentRoleDefinitionIds
                    type: 'Microsoft.Insights/metricAlerts'
                    existenceCondition: {
                        allOf: [
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
                                equals: 'microsoft.keyvault/vaults'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'Availability'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/microsoft.keyvault/vaults/\', field(\'fullName\'))]'
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
                                        name: '[concat(parameters(\'resourceName\'), \'-Availability\')]'
                                        location: 'global'
                                        properties: {
                                            description: 'Metric Alert for KeyVault Availability'
                                            severity: parAlertSeverity
                                            enabled: true
                                            scopes: [
                                                '[parameters(\'resourceId\')]'
                                            ]
                                            evaluationFrequency: parEvaluationFrequency
                                            windowSize: parWindowSize
                                            criteria: {
                                                allOf: [
                                                    {
                                                        name: 'Availability'
                                                        metricNamespace: 'microsoft.keyvault/vaults'
                                                        metricName: 'Availability'
                                                        operator: 'LessThan'
                                                        threshold: parThreshold
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
