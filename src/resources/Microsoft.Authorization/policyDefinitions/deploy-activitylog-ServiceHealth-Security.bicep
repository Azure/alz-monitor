targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param parResourceGroupName string = 'AlzMonitoring-rg'
param parResourceGroupLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]
param parResourceGroupTags object = {
    environment: 'test'
     _deployed_by_alz_monitor: true
}

param parAlertState string = 'true'

param parMonitorDisable string = 'MonitorDisable'

module ServiceHealthSecurityAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_ServiceHealth_SecurityAdvisory'
        displayName: '[DINE] Deploy Service Health Security Advisory Alert'
        description: 'DINE policy to Deploy Service Health Security Advisory Alert'
        location: policyLocation
        metadata: {
            version: '1.0.1'
            Category: 'ServiceHealth'
            source: 'https://github.com/Azure/ALZ-Monitor/'
            _deployed_by_alz_monitor: 'True'
        }
        parameters: {
            enabled: {
                type: 'String'
                metadata: {
                    displayName: 'Alert State'
                    description: 'Alert state for the alert'
                }
                allowedValues: [
                    'true'
                    'false'
                ]
                defaultValue: parAlertState
            }
            alertResourceGroupName: {
                type: 'String'
                metadata: {
                    displayName: 'Resource Group Name'
                    description: 'Resource group the alert is placed in'
                }
                defaultValue: parResourceGroupName
            }
            alertResourceGroupTags: {
                type: 'Object'
                metadata: {
                    displayName: 'Resource Group Tags'
                    description: 'Tags on the Resource group the alert is placed in'
                }
                defaultValue: parResourceGroupTags
            }
            alertResourceGroupLocation: {
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
                    description: 'Tag name to disable monitoring  Subscription level alerts. Set to true if monitoring should be disabled'
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
                    type: 'Microsoft.Insights/activityLogAlerts'
                    existenceScope: 'resourcegroup'
                    resourceGroupName: '[parameters(\'alertResourceGroupName\')]'
                    deploymentScope: 'subscription'
                    existenceCondition: {
                        allOf: [
                            {
                                field: 'Microsoft.Insights/ActivityLogAlerts/enabled'
                                equals: '[parameters(\'enabled\')]'
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
                                                        equals: 'ServiceHealth'
                                                    }
                                                ]
                                            }
                                            {
                                                allOf: [
                                                    {
                                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].field'
                                                        equals: 'properties.incidentType'
                                                    }
                                                    {
                                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].equals'
                                                        equals: 'Security'
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
                                    alertResourceGroupName: {
                                        type: 'string'
                                    }
                                    alertResourceGroupTags: {
                                        type: 'object'
                                    }
                                    alertResourceGroupLocation: {
                                        type: 'string'
                                    }
                                    policyLocation: {
                                        type: 'string'
                                        defaultValue: policyLocation
                                    }
                                    enabled: {
                                        type: 'string'
                                    }
                                }
                                variables: {}
                                resources: [
                                    {
                                        type: 'Microsoft.Resources/resourceGroups'
                                        apiVersion: '2021-04-01'
                                        name: '[parameters(\'alertResourceGroupName\')]'
                                        location: '[parameters(\'alertResourceGroupLocation\')]'
                                        tags: '[parameters(\'alertResourceGroupTags\')]'
                                    }
                                    {
                                        type: 'Microsoft.Resources/deployments'
                                        apiVersion: '2019-10-01'
                                        name: 'ServiceSecurityIncident'
                                        resourceGroup: '[parameters(\'alertResourceGroupName\')]'
                                        dependsOn: [
                                            '[concat(\'Microsoft.Resources/resourceGroups/\', parameters(\'alertResourceGroupName\'))]'
                                        ]
                                        properties: {
                                            mode: 'Incremental'
                                            template: {
                                                '$schema': 'https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#'
                                                contentVersion: '1.0.0.0'
                                                parameters: {
                                                    enabled: {
                                                        type: 'string'
                                                    }
                                                    alertResourceGroupName: {
                                                        type: 'string'
                                                    }
                                                }
                                                variables: {}
                                                resources: [
                                                    {
                                                        type: 'microsoft.insights/activityLogAlerts'
                                                        apiVersion: '2020-10-01'
                                                        name: 'ServiceHealthSecurityIncident'
                                                        location: 'global'
                                                        tags: {
                                                            _deployed_by_alz_monitor: true
                                                        }
                                                        properties: {
                                                            description: 'Service Health Security Alert'
                                                            enabled: '[parameters(\'enabled\')]'
                                                            scopes: [
                                                                '[subscription().id]'
                                                            ]
                                                            condition: {
                                                                allOf: [
                                                                    {
                                                                        field: 'category'
                                                                        equals: 'ServiceHealth'
                                                                    }
                                                                    {
                                                                        field: 'properties.incidentType'
                                                                        equals: 'Security'
                                                                    }
                                                                ]
                                                            }
                                                            parameters: {
                                                                enabled: {
                                                                    value: '[parameters(\'enabled\')]'
                                                                }
                                                            }
                                                        }
                                                    }
                                                ]
                                            }
                                            parameters: {
                                                enabled: {
                                                    value: '[parameters(\'enabled\')]'
                                                }
                                                alertResourceGroupName: {
                                                    value: '[parameters(\'alertResourceGroupName\')]'
                                                }
                                            }
                                        }
                                    }
                                ]
                            }
                            parameters: {
                                enabled: {
                                    value: '[parameters(\'enabled\')]'
                                }
                                alertResourceGroupName: {
                                    value: '[parameters(\'alertResourceGroupName\')]'
                                }
                                alertResourceGroupTags: {
                                    value: '[parameters(\'alertResourceGroupTags\')]'
                                }
                                alertResourceGroupLocation: {
                                    value: '[parameters(\'alertResourceGroupLocation\')]'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
