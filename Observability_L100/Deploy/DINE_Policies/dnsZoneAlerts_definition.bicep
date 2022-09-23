targetScope = 'subscription'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = ['/subscriptions/c7a405fc-3d07-4fac-b4ab-8254c690fad1/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c']

module QueryVolumeAlert '../../arm/Microsoft.Authorization/policyDefinitions/subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-qva-policyDefinitions'
    params: {
        name: 'policy-dnsz-${environment()}-${policyLocation}-001'
        displayName: '[DINE] Deploy DNSZ Query Volume Alert'
        description: 'DINE policy to audit/deploy DNS Zone Query Volume Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/dnsZones'
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
                                equals: 'Microsoft.Network/dnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'QueryVolume'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/dnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-QueryVolume\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for DNS Zone Query Volume'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'QueryVolume'
                                                    metricNamespace: 'Microsoft.Network/dnsZones'
                                                    metricName: 'QueryVolume'
                                                    operator: 'GreaterThanEqualTo'
                                                    threshold: 90
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

module RecordSetCountAlert '../../arm/Microsoft.Authorization/policyDefinitions/subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-rsca-policyDefinitions'
    params: {
        name: 'policy-dnsz-${environment()}-${policyLocation}-002'
        displayName: ''
        description: 'DINE policy to audit/deploy DNS Zone Record Set Count Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/dnsZones'
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
                                equals: 'Microsoft.Network/dnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'RecordSetCount'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/dnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-RecordSetCount\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for DNS Zone Record Set Count'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'RecordSetCount'
                                                    metricNamespace: 'Microsoft.Network/dnsZones'
                                                    metricName: 'RecordSetCount'
                                                    operator: 'GreaterThanEqualTo'
                                                    threshold: 2000
                                                    timeAggregation: 'Maximum'
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

module RecordSetCapacityUtilizationAlert '../../arm/Microsoft.Authorization/policyDefinitions//subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-rscua-policyDefinitions'
    params: {
        name: 'policy-dnsz-${environment()}-${policyLocation}-003'
        displayName: ''
        description: 'DINE policy to audit/deploy DNS Zone Record Set Capacity Utilization Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/dnsZones'
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
                                equals: 'Microsoft.Network/dnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'RecordSetCapacityUtilization'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/dnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-RecordSetCapacityUtilization\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for DNS Zone Record Set Count'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'RecordSetCapacityUtilization'
                                                    metricNamespace: 'Microsoft.Network/dnsZones'
                                                    metricName: 'RecordSetCapacityUtilization'
                                                    operator: 'GreaterThanEqualTo'
                                                    threshold: 2000
                                                    timeAggregation: 'Maximum'
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
