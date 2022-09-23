targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

resource vnet_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-vnet-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module pingAverageRoundtrip_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'pingAverageRoundtrip_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnet_pingAverageRountrip_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet ping Average Roundtrip Time'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'PingMeshAverageRoundtripMs'
        metricNamespace: 'Microsoft.Network/virtualNetworks'
        name: 'PingRoundTripMs'
        operator: 'GreaterThan'
        threshold: 300
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module pingProbeFailed_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'pingProbeFailed_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnet_pingProbeFailed_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet ping mesh probe failed percentage'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'PingMeshProbesFailedPercent'
        metricNamespace: 'Microsoft.Network/virtualNetworks'
        name: 'PingProbesFailed'
        operator: 'GreaterThan'
        threshold: 90
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module ifunderddosattack_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'ifunderddosattack_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnet_ifunderddosattack_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet DDOS Attack'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ifunderddosattack'
        metricNamespace: 'Microsoft.Network/virtualNetworks'
        name: 'ifunderddosattack'
        operator: 'GreaterThanOrEqual'
        threshold: 1
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
