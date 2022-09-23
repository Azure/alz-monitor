targetScope = 'subscription'

param targetResources array

param resourceGroupLocation string = 'centralus'

param AvailableMemoryThreshold int = 95

resource vm_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-vm-${resourceGroupLocation}-${uniqueString(deployment().name)}'
  location: resourceGroupLocation
}

module vm_avail_mem_alert '../../arm/Microsoft.Insights/metricAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-VirtualMachineAlerts'
  scope: vm_alert_rg
  params: {
    name: 'vm_avail_mem_alert-${uniqueString(deployment().name)}'
    location: 'global'
    alertDescription: 'Metric Alert for Virtual Machine Available Memory (MBytes)'
    tags: {}
    severity: 3
    alertCriteriaType: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    criterias: [
      {
        criterionType: 'StaticThresholdCriterion'
        metricName: 'Average_Available MBytes'
        metricNamespace: 'Microsoft.Compute/virtualMachines'
        name: 'Average_AvailableMBytes'
        operator: 'LessThan'
        threshold: AvailableMemoryThreshold
        timeAggregation: 'Average'
      }
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    scopes: targetResources
  }
}
