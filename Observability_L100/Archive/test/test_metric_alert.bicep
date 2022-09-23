targetScope = 'subscription'

param location string = 'centralus'
param iteration string = '001'


resource demo_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'bicep-demo-${iteration}-rg'
  location: location
}

module metric_alert '../Archive/metric_alert.bicep' = {
  name: 'vm_metric_alert'
  scope: demo_rg
  params: {
    name: 'ma-vm-cpu-demo-${iteration}'
    location: 'global'
    description: 'Metric Alert for VM CPU Utilization'
    tags: {}
    severity: 3
    criteria: {
      'allOf': [
        {
            'threshold': 10
            'name': 'Metric1'
            'metricNamespace': 'Microsoft.OperationalInsights/workspaces'
            'metricName': 'Average_Available MBytes'
            'dimensions': [
                {
                    'name': 'Computer'
                    'operator': 'Include'
                    'values': [
                        '*'
                    ]
                }
            ]
            'operator': 'LessThan'
            'timeAggregation': 'Average'
            'skipMetricValidation': false
            'criterionType': 'StaticThresholdCriterion'
        }
    ]
    'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
    }

    frequency: 'PT1M'
    window: 'PT1M'
    scopes: [
      '/subscriptions/c7a405fc-3d07-4fac-b4ab-8254c690fad1/resourceGroups/rg-cona-mgmt-demo-001/providers/Microsoft.OperationalInsights/workspaces/law-cona-demo-001'
    ]
    actions: []
  }
}
