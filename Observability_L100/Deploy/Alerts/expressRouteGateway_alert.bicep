// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

param CpuUtilizationThreshold int = 80
param BitsInPerSecondThreshold int = 8000000000
param BitsOutPerSecondThreshold int = 8000000000
param PeerConnectionsThreshold int = 800
param RouteChangeFrequencyThreshold int = 10

resource erg_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-erg-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module erg_cpu_util_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteGatewayAlerts'
  scope: erg_alert_rg
  params: {
    name: 'erg_cpu_util_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Gateway CPU Utilization'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'xpressroutegatewaycpuutilization'
        metricNamespace: 'Microsoft.Network/expressRouteGateways'
        name: 'xpressroutegatewaycpuutilization'
        operator: 'GreaterThan'
        threshold: CpuUtilizationThreshold
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module erg_bps_out_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteGatewayAlerts'
  scope: erg_alert_rg
  params: {
    name: 'erg_bps_out_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Gateway BPS Out'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ergatewayconnectionbitsoutpersecond'
        metricNamespace: 'Microsoft.Network/expressRouteGateways'
        name: 'ergatewayconnectionbitsoutpersecond'
        operator: 'LessThan'
        threshold: BitsOutPerSecondThreshold
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module erg_bps_in_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteGatewayAlerts'
  scope: erg_alert_rg
  params: {
    name: 'erg_bps_in_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Gateway BPS In'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ergatewayconnectionbitsinpersecond'
        metricNamespace: 'Microsoft.Network/expressRouteGateways'
        name: 'ergatewayconnectionbitsinpersecond'
        operator: 'LessThan'
        threshold: BitsInPerSecondThreshold
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module erg_peer_routes_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteGatewayAlerts'
  scope: erg_alert_rg
  params: {
    name: 'erg_peer_routes_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Gateway Number of Peer Routes'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'expressroutegatewaycountofroutesadvertisedtopeer'
        metricNamespace: 'Microsoft.Network/expressRouteGateways'
        name: 'expressroutegatewaycountofroutesadvertisedtopeer'
        operator: 'GreaterThan'
        threshold: PeerConnectionsThreshold
        timeAggregation: 'Maximum'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module erg_route_change_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteGatewayAlerts'
  scope: erg_alert_rg
  params: {
    name: 'erg_route_change_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Gateway Route Change Frequency'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'expressroutegatewayfrequencyofrouteschanged'
        metricNamespace: 'Microsoft.Network/expressRouteGateways'
        name: 'expressroutegatewayfrequencyofrouteschanged'
        operator: 'GreaterThan'
        threshold: RouteChangeFrequencyThreshold
        timeAggregation: 'Total'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
