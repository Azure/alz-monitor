targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

param RecordSetCapacityUtilizationThreshold int = 75
param VirtualNetworkLinkCapacityUtilizationThreshold int = 80
param VirtualNetworkWithRegistrationCapacityUtilizationThreshold int = 90
param VolumeThreshold int = 500

resource pdnszone_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-pdnszone-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module pdnszone_rs_capacity_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pdnszone_alert_rg
  params: {
    name: 'pdns_zone_rs_utilization_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Private DNS Zone Record Set Capacity Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'RecordSetCapacityUtilization'
        metricNamespace: 'Microsoft.Network/privateDnsZones'
        name: 'RecordSetCapacityUtilization'
        operator: 'GreaterThanOrEqual'
        threshold: RecordSetCapacityUtilizationThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pdnszone_vnl_utilization_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pdnszone_alert_rg
  params: {
    name: 'pdns_zone_vnl_utilization_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Private DNS Zone Virtual Network Link Capacity Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'VirtualNetworkLinkCapacityUtilization'
        metricNamespace: 'Microsoft.Network/privateDnsZones'
        name: 'VirtualNetworkLinkCapacityUtilization'
        operator: 'GreaterThanOrEqual'
        threshold: VirtualNetworkLinkCapacityUtilizationThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pdnszone_volume_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pdnszone_alert_rg
  params: {
    name: 'pdns_zone_query_volume_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for DNS Zone Query Volume'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'QueryVolume'
        metricNamespace: 'Microsoft.Network/privateDnsZones'
        name: 'QueryVolume'
        operator: 'GreaterThanEqualTo'
        threshold: VolumeThreshold 
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pdnszone_vnrc_utilization_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pdnszone_alert_rg
  params: {
    name: 'pdns_zone_vnrc_utilization_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Private DNS Zone Virtual Network with Registration Capacity Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'VirtualNetworkWithRegistrationCapacityUtilization'
        metricNamespace: 'Microsoft.Network/privateDnsZones'
        name: 'VirtualNetworkWithRegistrationCapacityUtilization'
        operator: 'GreaterThan'
        threshold: VirtualNetworkWithRegistrationCapacityUtilizationThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
