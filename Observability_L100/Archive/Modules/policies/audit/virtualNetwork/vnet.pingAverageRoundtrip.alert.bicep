targetScope = 'subscription'

param name string
param description string
param displayName string
param policyType string = 'Custom'

//param metricAlertName string
//param metricAlertResourceNamespace string

resource vnet_ping_rtrip_alert_exists 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: name
  properties: {
    description: description
    displayName: displayName
    metadata: {}
    mode: 'All'
    parameters: {}
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Insights/metricAlerts'
          }
          {
            field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricNamespace'
            equals: 'Microsoft.Network/virtualNetworks'
          }
          {
            field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
            equals: 'PingMeshAverageRoundtripMs'
          }
        ]
      }
      then: {
        effect: 'audit'
      }
    }
    policyType: policyType
  }
}
