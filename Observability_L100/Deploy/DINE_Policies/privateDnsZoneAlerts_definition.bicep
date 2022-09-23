targetScope = 'subscription'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = ['/subscriptions/c7a405fc-3d07-4fac-b4ab-8254c690fad1/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c']

module RecordSetCapacityAlert '../../arm/Microsoft.Authorization/policyDefinitions/subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-pdnsrsc-policyDefinitions'
    params: {
        name: 'policy-pdnsz-${environment()}-${policyLocation}-001'
        displayName: '[DINE] Deploy PDNSZ Record Set Capacity Alert'
        description: 'DINE policy to audit/deploy Private DNS Zone Record Set Capacity Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/privateDnsZones'
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
                                equals: 'Microsoft.Network/privateDnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'RecordSetCapacityUtilization'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/privateDnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-RecordSet_Capacity_Utilization\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Private DNS Zone Record Set Capacity Utilization'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'RecordSetCapacityUtilization'
                                                    metricNamespace: 'Microsoft.Network/privateDnsZones'
                                                    metricName: 'RecordSetCapacityUtilization'
                                                    operator: 'GreaterThanOrEqual'
                                                    threshold: 75
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

module CapacityUtilizationAlert '../../arm/Microsoft.Authorization/policyDefinitions/subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-pdnsvnlcu-policyDefinitions'
    params: {
        name: 'policy-pdnsz-${environment()}-${policyLocation}-002'
        displayName: '[DINE] Deploy PDNSZ Capacity Utilization Alert'
        description: 'DINE policy to audit/deploy Private DNS Zone Capacity Utilization Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/privateDnsZones'
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
                                equals: 'Microsoft.Network/privateDnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'VirtualNetworkLinkCapacityUtilization'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/privateDnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-CapacityUtilizationAlert\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Private DNS Zone Virtual Network Link Capacity Utilization'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'VirtualNetworkLinkCapacityUtilization'
                                                    metricNamespace: 'Microsoft.Network/privateDnsZones'
                                                    metricName: 'VirtualNetworkLinkCapacityUtilization'
                                                    operator: 'GreaterThanOrEqual'
                                                    threshold: 80
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

module QueryVolumeAlert '../../arm/Microsoft.Authorization/policyDefinitions//subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-pdnszqv-policyDefinitions'
    params: {
        name: 'policy-pdnsz-${environment()}-${policyLocation}-003'
        displayName: '[DINE] Deploy PDNSZ Query Volume Alert'
        description: 'DINE policy to audit/deploy Private DNS Zone Query Volume Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/privateDnsZones'
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
                                equals: 'Microsoft.Network/privateDnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'QueryVolume'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/privateDnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-QueryVolumeAlert\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for Private DNS Query Volume'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'QueryVolume'
                                                    metricNamespace: 'Microsoft.Network/privateDnsZones'
                                                    metricName: 'QueryVolume'
                                                    operator: 'GreaterThanEqualTo'
                                                    threshold: 500
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

module RegistrationCapacityUtilizationAlert '../../arm/Microsoft.Authorization/policyDefinitions//subscription/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-pdnszvnrcu-policyDefinitions'
    params: {
        name: 'policy-pdnsz-${environment()}-${policyLocation}-004'
        displayName: '[DINE] Deploy PDNSZ Registration Capacity Utilization Alert'
        description: 'DINE policy to audit/deploy Private DNS Zone Registration Capacity Utilization Alert'
        location: policyLocation
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/privateDnsZones'
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
                                equals: 'Microsoft.Network/privateDnsZones'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'VirtualNetworkWithRegistrationCapacityUtilization'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/privateDnsZones/\', field(\'fullName\'))]'
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
                                    name: '[concat(parameters(\'resourceName\'), \'-RequestsAlert\')]'
                                    location: 'global'
                                    properties: {
                                        description: 'Metric Alert for KeyVault Requests'
                                        severity: 3
                                        enabled: true
                                        scopes: ['[parameters(\'resourceId\')]']
                                        evaluationFrequency: 'PT5M'
                                        windowSize: 'PT5M'
                                        criteria: {
                                            allOf: [
                                                {
                                                    name: 'VirtualNetworkWithRegistrationCapacityUtilization'
                                                    metricNamespace: 'Microsoft.Network/privateDnsZones'
                                                    metricName: 'VirtualNetworkWithRegistrationCapacityUtilization'
                                                    operator: 'GreaterThan'
                                                    threshold: 90
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
