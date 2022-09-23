param name string
param scope string
param description string
param displayName string
param policyType string = 'Custom'

param metricAlertName string
param metricAlertResourceNamespace string

resource symbolicname 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: name
  scope: scope
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
            equals: metricAlertResourceNamespace
          }
          {
            field: 'Microsoft.Insights/metricAlerts/criteria.Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria.allOf[*].metricName'
            equals: metricAlertName
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
