targetScope = 'subscription'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = ['/subscriptions/c7a405fc-3d07-4fac-b4ab-8254c690fad1/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c']

module TransactionsAlert '../../arm/Microsoft.Authorization/policyDefinitions/subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-sata-policyDefinitions'
    params: {
        name: 'policy-sa-${environment()}-${policyLocation}-001'
        displayName: '[DINE] Deploy SA Transaction Alert'
        description: 'DINE policy to audit/deploy SA Transaction Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Storage/storageAccounts'
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
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
                                equals: 'Microsoft.Storage/storageAccounts'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'Transactions'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Storage/storageAccounts/\', field(\'fullName\'))]'
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
                                resources: [{
                                    type: 'Microsoft.Insights/metricAlerts'
                                    apiVersion: '2018-03-01'
                                    name: '[concat(parameters(\'resourceName\'), \'-Transactions\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Storage Account Transactions'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'Transactions'
                                                    metricNamespace: 'Microsoft.Storage/storageAccounts'
                                                    metricName: 'Transactions'
                                                    operator: 'GreaterThan'
                                                    threshold: 1000
                                                    timeAggregation: 'Total'
                                                    criterionType: 'StaticThresholdCriterion'
                                                }
                                            ]
                                            'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
                                        }
                                    }
                                }]
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

module LatencyAlert '../../arm/Microsoft.Authorization/policyDefinitions/subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-sassla-policyDefinitions'
    params: {
        name: 'policy-sa-${environment()}-${policyLocation}-002'
        displayName: '[DINE] Deploy SA Latency Alert'
        description: 'DINE policy to audit/deploy SA Latency Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Storage/storageAccounts'
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
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
                                equals: 'Microsoft.Storage/storageAccounts'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'SuccessServerLatency'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Storage/storageAccounts/\', field(\'fullName\'))]'
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
                                resources: [{
                                    type: 'Microsoft.Insights/metricAlerts'
                                    apiVersion: '2018-03-01'
                                    name: '[concat(parameters(\'resourceName\'), \'-LatencyAlert\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Storage Account Success Server Latency'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'SuccessServerLatency'
                                                    metricNamespace: 'Microsoft.Storage/storageAccounts'
                                                    metricName: 'SuccessServerLatency'
                                                    operator: 'GreaterThan'
                                                    threshold: 5000
                                                    timeAggregation: 'Average'
                                                    criterionType: 'StaticThresholdCriterion'
                                                }
                                            ]
                                            'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
                                        }
                                    }

                                }]
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

module AvailabilityAlert '../../arm/Microsoft.Authorization/policyDefinitions//subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-saaa-policyDefinitions'
    params: {
        name: 'policy-sa-${environment()}-${policyLocation}-003'
        displayName: '[DINE] Deploy SA Availability Alert'
        description: 'DINE policy to audit/deploy SA Availability Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Storage/storageAccounts'
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
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
                                equals: 'Microsoft.Storage/storageAccounts'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'Availability'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Storage/storageAccounts/\', field(\'fullName\'))]'
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
                                resources: [{
                                    type: 'Microsoft.Insights/metricAlerts'
                                    apiVersion: '2018-03-01'
                                    name: '[concat(parameters(\'resourceName\'), \'-AvailabilityAlert\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Storage Account Availability'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'Availability'
                                                    metricNamespace: 'Microsoft.Storage/storageAccounts'
                                                    metricName: 'Availability'
                                                    operator: 'LessThan'
                                                    threshold: 99
                                                    timeAggregation: 'Average'
                                                    criterionType: 'StaticThresholdCriterion'
                                                }
                                            ]
                                            'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
                                        }
                                    }

                                }]
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

module E2ELatencyAlert '../../arm/Microsoft.Authorization/policyDefinitions//subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-sae2ela-policyDefinitions'
    params: {
        name: 'policy-sa-${environment()}-${policyLocation}-004'
        displayName: '[DINE] Deploy SA E2E Latency Alert'
        description: 'DINE policy to audit/deploy SA E2E Latency Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Storage/storageAccounts'
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
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
                                equals: 'Microsoft.Storage/storageAccounts'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'AverageE2ELatency'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Storage/storageAccounts/\', field(\'fullName\'))]'
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
                                resources: [{
                                    type: 'Microsoft.Insights/metricAlerts'
                                    apiVersion: '2018-03-01'
                                    name: '[concat(parameters(\'resourceName\'), \'-E2ELatencyAlert\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Storage Account End to End Latency'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'AverageE2ELatency'
                                                    metricNamespace: 'Microsoft.Storage/storageAccounts'
                                                    metricName: 'AverageE2ELatency'
                                                    operator: 'LessThan'
                                                    threshold: 5000
                                                    timeAggregation: 'Average'
                                                    criterionType: 'StaticThresholdCriterion'
                                                }
                                            ]
                                            'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
                                        }
                                    }

                                }]
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
