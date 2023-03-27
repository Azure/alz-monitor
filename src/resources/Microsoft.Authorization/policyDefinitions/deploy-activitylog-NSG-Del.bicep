targetScope = 'managementGroup'

param parResourceGroupName string = 'AlzMonitoring-rg'
param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

param parResourceGroupTags object = {
    environment: 'test'
     _deployed_by_alz_monitor: true
}

param parAlertState string = 'true'

param parMonitorDisable string = 'MonitorDisable'

module ActivityLogNSGDeleteAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_NSG_Delete'
        displayName: '[DINE] Deploy Activity Log NSG Delete Alert'
        description: 'DINE policy to Deploy Activity Log NSG Delete Alert'
        location: policyLocation
        metadata: {
            version: '1.0.0'
            Category: 'ActivityLog'
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

            MonitorDisable: {
                type: 'String'
                metadata: {
                    displayName: 'Effect'
                    description: 'Tag name to disable monitoring on resource. Set to true if monitoring should be disabled'
                }
          
                defaultValue: parMonitorDisable
            }
        }
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.Network/networkSecurityGroups'
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
                    name: 'ActivityNSGDelete'
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
                                                        equals: 'Administrative'
                                                    }
                                                ]
                                            }
                                            {
                                                allOf: [
                                                    {
                                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].field'
                                                        equals: 'operationName'
                                                    }
                                                    {
                                                        field: 'microsoft.insights/activityLogAlerts/condition.allOf[*].equals'
                                                        equals: 'Microsoft.Network/networkSecurityGroups/delete'
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
                                        location: policyLocation
                                        tags: '[parameters(\'alertResourceGroupTags\')]'
                                    }
                                    {
                                        type: 'Microsoft.Resources/deployments'
                                        apiVersion: '2019-10-01'
                                        name: 'ActivityLAWorkspaceDelete'
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
                                                        name: 'ActivityNSGDelete'
                                                        location: 'global'
                                                        tags: {
                                                            _deployed_by_alz_monitor: true
                                                        }
                                                        properties: {
                                                            description: 'Activity Log NSG Delete'
                                                            enabled: '[parameters(\'enabled\')]'
                                                            scopes: [
                                                                '[subscription().id]'
                                                            ]
                                                            condition: {
                                                                allOf: [
                                                                    {
                                                                        field: 'category'
                                                                        equals: 'Administrative'
                                                                    }
                                                                    {
                                                                        field: 'operationName'
                                                                        equals: 'Microsoft.Network/networkSecurityGroups/delete'
                                                                    }
                                                                    {
                                                                        field: 'status'
                                                                        containsAny: [
                                                                            'succeeded'
                                                                        ]
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
                            }
                        }
                    }
                }
            }
        }
    }
}
