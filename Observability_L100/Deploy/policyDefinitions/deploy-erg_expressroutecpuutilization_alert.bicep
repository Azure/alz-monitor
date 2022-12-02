// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

module ErgExpressRouteCPUUtilizationAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-ergergcpuua-policyDefinitions'
    params: {
        name: 'Deploy_ERGw_ExpressRouteCpuUtil_Alert'
        displayName: '[DINE] Deploy ERG ExpressRoute CPU Utilization Alert'
        description: 'DINE policy to audit/deploy ER Gateway Express Route CPU Utilization Alert'
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
                        equals: 'Microsoft.Network/expressroutegateways'
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
                                equals: 'Microsoft.Network/expressroutegateways'
                            }
                            {
                                field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
                                equals: 'ExpressRouteGatewayCpuUtilization'
                            }
                            {
                                field: 'Microsoft.Insights/metricalerts/scopes[*]'
                                equals: '[concat(subscription().id, \'/resourceGroups/\', resourceGroup().name, \'/providers/Microsoft.Network/expressroutegateways/\', field(\'fullName\'))]'
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
                                        name: '[concat(parameters(\'resourceName\'), \'-GatewayERCPUAlert\')]'
                                        location: 'global'
                                        properties: {
                                            description: 'Metric Alert for ER Gateway Express Route CPU Utilization'
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
                                                        name: 'ExpressRouteGatewayCpuUtilization'
                                                        metricNamespace: 'Microsoft.Network/expressroutegateways'
                                                        metricName: 'ExpressRouteGatewayCpuUtilization'
                                                        operator: 'GreaterThan'
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
