targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param parResourceGroupName string = 'AlzMonitoring-rg'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

param parAlertState string = 'true'

module ServiceHealthIncidentAlert '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-shi-policyDefinitions'
    params: {
        name: 'Deploy_activitylog_ServiceHealth_Incident'
        displayName: '[DINE] Deploy Service Health Incident Alert'
        description: 'DINE policy to Deploy Service Health Incident Alert'
        location: policyLocation
        metadata: {
            version: '1.0.0'
            Category: 'ServiceHealth'
            source: 'https://github.com/Azure/ALZ-Monitor/'
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
                    type: 'Microsoft.Insights/activityLogAlerts'
                    // should be replaced with parameter value
                    existenceScope: 'resourcegroup'
                    // should be replaced with parameter value
                    resourceGroupName: parResourceGroupName
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
                                                        equals: 'Incident'
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
                                    parResourceGroupName: {
                                        type: 'string'
                                        defaultValue: parResourceGroupName
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
                                        name: parResourceGroupName
                                        location: policyLocation
                                    }
                                    {
                                        type: 'Microsoft.Resources/deployments'
                                        apiVersion: '2019-10-01'
                                        //change name
                                        name: 'ServiceHealthIncident'
                                        resourceGroup: parResourceGroupName
                                        dependsOn: [
                                            'Microsoft.Resources/resourceGroups/${parResourceGroupName}'
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
                                                }
                                                variables: {}
                                                resources: [
                                                    {
                                                        type: 'microsoft.insights/activityLogAlerts'
                                                        apiVersion: '2020-10-01'
                                                        //name: '[concat(subscription().subscriptionId, \'-ActivityReGenKey\')]'
                                                        name: 'ServieHealthIncident'
                                                        location: 'global'
                                                        properties: {
                                                            description: 'ServiceHealthIncidentAlert'
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
                                                                        equals: 'Incident'
                                                                    }

                                                                ]
                                                            }
                                                        }
                                                        parameters: {
                                                            enabled: {
                                                                value: '[parameters(\'enabled\')]'
                                                            }
                                                        }

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
                            }
                        }
                    }
                }
            }
        }
    }
}
