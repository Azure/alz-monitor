// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

param BackupHealthEventThreshold int = 0

resource recovery_vault_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-recovery-vault-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module vault_backup_health_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-vault-backup-health'
  scope: recovery_vault_alert_rg
  params: {
    name: 'vault_backup_health_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Recovery Vault Backup Health Events'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'backuphealthevent'
        metricNamespace: 'Microsoft.RecoveryServices/Vaults'
        name: 'backuphealthevent'
        operator: 'GreaterThan'
        threshold: BackupHealthEventThreshold 
        timeAggregation: 'Count'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
