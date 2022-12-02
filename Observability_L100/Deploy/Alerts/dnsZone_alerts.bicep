// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'subscription'

param build_iteration string = '001'

param targetResources array

param resourceGroupLocation string = 'centralus'

param UtilizationThreshold int = 75
param CountThreshold int = 2000
param VolumeThreshold int = 90

resource dnszone_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-dnszone-${resourceGroupLocation}-${build_iteration}'
  location: resourceGroupLocation
}

module dnszone_capacity_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: dnszone_alert_rg
  params: {
    name: 'dns_zone_utilization_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for DNS Zone Record Set Capacity Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'RecordSetCapacityUtilization'
        metricNamespace: 'Microsoft.Network/dnsZones'
        name: 'RecordSetCapacityUtilization'
        operator: 'GreaterThan'
        threshold: UtilizationThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module dnszone_count_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: dnszone_alert_rg
  params: {
    name: 'dns_zone_count_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for DNS Zone Record Set Count'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'RecordSetCount'
        metricNamespace: 'Microsoft.Network/dnsZones'
        name: 'RecordSetCount'
        operator: 'GreaterThan'
        threshold: CountThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module dnszone_volume_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: dnszone_alert_rg
  params: {
    name: 'dns_zone_query_volume_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for DNS Zone Query Volume'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'QueryVolume'
        metricNamespace: 'Microsoft.Network/dnsZones'
        name: 'QueryVolume'
        operator: 'GreaterThanEqualTo'
        threshold: VolumeThreshold 
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
