targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

param TransactionsThreshold int = 1000
param SuccessServerLatencyThreshold int = 5000
param AvailabilityThreshold int = 99
param AverageE2ELatencyThreshold int = 5000

resource storageAccount_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-storageaccount-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module storageaccount_transactions_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-storageaccount-alert'
  scope: storageAccount_alert_rg
  params: {
    name: 'storageaccount_transactions_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Storage Account Transactions'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'Transactions'
        metricNamespace: 'Microsoft.Storage/storageAccounts'
        name: 'Transactions'
        operator: 'GreaterThan'
        threshold: TransactionsThreshold 
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module storageAccount_Latency_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}--storageaccount-alert'
  scope: storageAccount_alert_rg
  params: {
    name: 'storageAccount_Latency_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Storage Account Success Server Latency'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'SuccessServerLatency'
        metricNamespace: 'Microsoft.Storage/storageAccounts'
        name: 'SuccessServerLatency'
        operator: 'GreaterThan'
        threshold: SuccessServerLatencyThreshold 
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module storageAccount_availability_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-storageaccount-alert'
  scope: storageAccount_alert_rg
  params: {
    name: 'storageAccount_availability_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Storage Account Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'Availability'
        metricNamespace: 'Microsoft.Storage/storageAccounts'
        name: 'Availability'
        operator: 'LessThan'
        threshold: AvailabilityThreshold 
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module storageAccount_e2e_latency_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-storageaccount-alert'
  scope: storageAccount_alert_rg
  params: {
    name: 'storageAccount_e2e_latency_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Storage Account End to End Latency'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'AverageE2ELatency'
        metricNamespace: 'Microsoft.Storage/storageAccounts'
        name: 'AverageE2ELatency'
        operator: 'LessThan'
        threshold: AverageE2ELatencyThreshold 
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
