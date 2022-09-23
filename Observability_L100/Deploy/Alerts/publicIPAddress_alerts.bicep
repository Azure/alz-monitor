targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

param IfUnderDdosAttackThreshold int = 1
param BytesInDdosThreshold int = 8000000
param PacketsInDDoSThreshold int = 40000
param VipAvailabilityThreshold int = 1

resource pipaddr_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-pipaddr-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module pipaddr_ddosattack_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pipaddr_alert_rg
  params: {
    name: 'pipaddr_ddosattack_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Public IP Address Under Attack'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ifunderddosattack'
        metricNamespace: 'Microsoft.Network/publicIPAddresses'
        name: 'ifunderddosattack'
        operator: 'GreaterThan'
        threshold: IfUnderDdosAttackThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pipaddr_bytes_in_ddos_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pipaddr_alert_rg
  params: {
    name: 'pipaddr_bytes_in_ddos_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Public IP Address Bytes IN DDOS'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'bytesinddos'
        metricNamespace: 'Microsoft.Network/publicIPAddresses'
        name: 'bytesinddos'
        operator: 'GreaterThan'
        threshold: BytesInDdosThreshold 
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pipaddr_packets_in_ddos_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pipaddr_alert_rg
  params: {
    name: 'pipaddr_packets_in_ddos_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Public IP Address Packets IN DDOS'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'PacketsInDDoS'
        metricNamespace: 'Microsoft.Network/publicIPAddresses'
        name: 'PacketsInDDoS'
        operator: 'GreaterThanEqualTo'
        threshold: PacketsInDDoSThreshold 
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pipaddr_vip_availability_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-dnszonealert'
  scope: pipaddr_alert_rg
  params: {
    name: 'pipaddr_vip_availability_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Public IP Address VIP Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'VipAvailability'
        metricNamespace: 'Microsoft.Network/publicIPAddresses'
        name: 'VipAvailability'
        operator: 'LessThan'
        threshold: VipAvailabilityThreshold 
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
