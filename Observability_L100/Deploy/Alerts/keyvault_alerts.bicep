// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'subscription'

param build_iteration string = '007'

param targetResources array

param resourceGroupLocation string = 'centralus'

resource kv_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-kv-${resourceGroupLocation}-${build_iteration}'
  location: resourceGroupLocation
}

module kv_availablity_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'kv_availability_alert'
  scope: kv_alert_rg
  params: {
    name: 'kv_availability_alert-${build_iteration}'
    location: 'global'
    alertDescription: 'Metric Alert for KV Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'Availability'
        metricNamespace: 'microsoft.keyvault/vaults'
        name: 'Availability'
        operator: 'LessThan'
        threshold: 100
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module kv_capacity_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'kv_capacity_alert'
  scope: kv_alert_rg
  params: {
    name: 'kv_capacity_alert-${build_iteration}'
    location: 'global'
    alertDescription: 'Metric Alert for KV Capacity'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'SaturationShoebox'
        metricNamespace: 'microsoft.keyvault/vaults'
        name: 'SaturationShoebox'
        operator: 'GreaterThan'
        threshold: 75
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module kv_latency_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'kv_latency_alert'
  scope: kv_alert_rg
  params: {
    name: 'kv_latency_alert-${build_iteration}'
    location: 'global'
    alertDescription: 'Metric Alert for KV latency'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ServiceApiLatency'
        metricNamespace: 'microsoft.keyvault/vaults'
        name: 'ServiceApiLatency'
        operator: 'GreaterThan'
        threshold: 75
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module kv_requests_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'kv_requests_alert'
  scope: kv_alert_rg
  params: {
    name: 'kv_requests_alert-${build_iteration}'
    location: 'global'
    alertDescription: 'Metric Alert for KV Requests'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ServiceApiResult'
        metricNamespace: 'microsoft.keyvault/vaults'
        name: 'ServiceApiResult'
        operator: 'GreaterThan'
        threshold: 0
        timeAggregation: 'Count'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
