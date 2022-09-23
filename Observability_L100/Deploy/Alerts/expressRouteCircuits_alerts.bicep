targetScope = 'subscription'

param build_iteration string = '001'

param targetResources array

param resourceGroupLocation string = 'centralus'

param BitsInPerSecondThreshold int = 900000000
param BitsOutPerSecondThreshold int = 900000000

resource erc_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-erc-${resourceGroupLocation}-${build_iteration}'
  location: resourceGroupLocation
}

module erc_bps_in_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteCircuitAlerts'
  scope: erc_alert_rg
  params: {
    name: 'erc_bps_outalert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Circuit ARP Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'BitsInPerSecond'
        metricNamespace: 'Microsoft.Network/expressRouteCircuits'
        name: 'BitsInPerSecond'
        operator: 'LessThan'
        threshold: BitsInPerSecondThreshold 
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module erc_bps_out_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteCircuitAlerts'
  scope: erc_alert_rg
  params: {
    name: 'erc_bps_out_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Circuit ARP Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'BitsOutPerSecond'
        metricNamespace: 'Microsoft.Network/expressRouteCircuits'
        name: 'BitsOutPerSecond'
        operator: 'LessThan'
        threshold: BitsOutPerSecondThreshold
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}

module erc_arp_avail_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteCircuitAlerts'
  scope: erc_alert_rg
  params: {
    name: 'erc_arp_avail_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Circuit ARP Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'ArpAvailability'
        metricNamespace: 'Microsoft.Network/expressRouteCircuits'
        name: 'ArpAvailability'
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

module erc_bgp_avail_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-ExpressRouteCircuitAlerts'
  scope: erc_alert_rg
  params: {
    name: 'erc_bgp_avail_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for ExpressRoute Circuit BGP Availability'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'BgpAvailability'
        metricNamespace: 'Microsoft.Network/expressRouteCircuits'
        name: 'BgpAvailability'
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
