targetScope = 'subscription'

param build_iteration string = '007'

param resourceGroupLocation string = 'centralus'

param targetResources array

resource vnet_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-vnet-gw-${resourceGroupLocation}-${build_iteration}'
  location: resourceGroupLocation
}

module er_gateway_cpu_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: ' ExpressRouteGatewayCpuUtilization _alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnetgw_ERGatewayCpuUtil_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet Gateway Express Route CPU Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ExpressRouteGatewayCpuUtilization'
        metricNamespace: 'Microsoft.Network/virtualNetworkGateways'
        name: 'ERCPUUtil'
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

module avg_bandwidth_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'TunnelAvgBandwidth_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnetgw_AvgBandwidth_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet Gateway Tunnel Avg Bandwidth'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'TunnelAverageBandwidth'
        metricNamespace: 'Microsoft.Network/virtualNetworkGateways'
        name: 'AvgBandwidth'
        operator: 'LessThan'
        threshold: 1
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module egress_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'Tunnel_Egress_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnetgw_egress_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet Gateway Tunnel Egress Bytes'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'TunnelEgressBytes'
        metricNamespace: 'Microsoft.Network/virtualNetworkGateways'
        name: 'Egress'
        operator: 'LessThanOrEqual'
        threshold: 1
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module ingress_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'Tunnel_Ingress_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vnetgw_ingress_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VNet Gateway Tunnel ingress Bytes'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'TunnelIngressBytes'
        metricNamespace: 'Microsoft.Network/virtualNetworkGateways'
        name: 'Ingress'
        operator: 'LessThanOrEqual'
        threshold: 1
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
