// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'subscription'

param build_iteration string = '007'

param resourceGroupLocation string = 'centralus'

param targetResources array

resource vnet_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-vpn-gw-${resourceGroupLocation}-${build_iteration}'
  location: resourceGroupLocation
}

module vpng_bw_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'vpng_GW_Bandwidth_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vpngw_Bandwidth_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VPN Gateway Bandwidth Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'tunnelaveragebandwidth'
        metricNamespace: 'microsoft.network/vpngateways'
        name: 'avgbandwidth'
        operator: 'GreaterThan'
        threshold: 1000000000
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module vpng_status_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'vpng_bgpeerstatus_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vpngw_status_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VPN Gateway BGP peer status'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'bgppeerstatus'
        metricNamespace: 'microsoft.network/vpngateways'
        name: 'avgbandwidth'
        operator: 'LessThan'
        threshold: 1
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module vpng_ingress_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'vpng_ingress_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vpngw_ingress_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VPN Gateway tunnel ingress bytes'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'tunnelingressbytes'
        metricNamespace: 'microsoft.network/vpngateways'
        name: 'ingressbytes'
        operator: 'LessThanOrEqual'
        threshold: 0
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module vpng_egress_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: 'vpng_egress_alert'
  scope: vnet_alert_rg
  params: {
    name: 'vpngw_egress_alert-001'
    location: 'global'
    alertDescription: 'Metric Alert for VPN Gateway tunnel egress bytes'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'tunnelegressbytes'
        metricNamespace: 'microsoft.network/vpngateways'
        name: 'egressbytes'
        operator: 'LessThanOrEqual'
        threshold: 0
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
