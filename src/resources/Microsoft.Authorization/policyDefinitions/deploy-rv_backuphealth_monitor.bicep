// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

@allowed([
    'modify'
    'audit'
    'disabled'
])
param parPolicyEffect string = 'modify'

param parMonitorDisable string = 'MonitorDisable'

module BackupHealthMonitor '../../arm/Microsoft.Authorization/policyDefinitions/managementGroup/deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-rvbuhm-policyDefinitions'
    params: {
        name: 'Deploy_RecoveryVault_BackupHealthMonitor_Alert'
        displayName: '[Modify] Deploy RV Backup Health Monitoring Alerts'
        description: 'Modify policy to audit/update Recovery Vault Backup Health Alerting to Azure monitor alerts'
        location: policyLocation
        metadata: {
            version: '1.0.0'
            category: 'Site Recovery'
            source: 'https://github.com/Azure/ALZ-Monitor/'
            _deployed_by_alz_monitor: 'True'
        }
        parameters: {
            effect: {
                type: 'String'
                metadata: {
                    displayName: 'Effect'
                    description: 'Effect of the policy'
                }
                allowedValues: [
                    'modify'
                    'audit'
                    'disabled'
                ]
                defaultValue: parPolicyEffect
            }
            MonitorDisable: {
                type: 'String'
                metadata: {
                    displayName: 'Effect'
                    description: 'Tag name to disable monitoring resource. Set to true if monitoring should be disabled'
                }
                defaultValue: parMonitorDisable
            }
        }
        policyRule: {
            if: {
                allOf: [
                    {
                        field: 'type'
                        equals: 'Microsoft.RecoveryServices/Vaults'
                    }
                    {
                        field: '[concat(\'tags[\', parameters(\'MonitorDisable\'), \']\')]'
                        notEquals: 'true'
                    }
                    {
                        field: 'Microsoft.RecoveryServices/vaults/monitoringSettings.azureMonitorAlertSettings.alertsForAllJobFailures'
                        notEquals: 'Enabled'
                    }
                ]
            }
            then: {
                effect: '[parameters(\'effect\')]'
                details: {
                    roleDefinitionIds: deploymentRoleDefinitionIds
                    conflictEffect: 'audit'
                    operations: [
                        {
                            operation: 'addOrReplace'
                            field: 'Microsoft.RecoveryServices/vaults/monitoringSettings.classicAlertSettings.alertsForCriticalOperations'
                            value: 'Disabled'
                        }
                        {
                            operation: 'addOrReplace'
                            field: 'Microsoft.RecoveryServices/vaults/monitoringSettings.azureMonitorAlertSettings.alertsForAllJobFailures'
                            value: 'Enabled'
                        }
                    ]
                }
            }
        }
    }
}
