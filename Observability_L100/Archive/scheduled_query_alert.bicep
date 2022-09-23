param name string
param displayName string
param description string

param location string
param workspaceId string

param frequency string = 'PT1M'
param window string = 'PT1M'
param threshold int = 1
param severity int = 1

param query string
param operator string
param resourceIdColumn string
param timeAggregation string

param dimensions array

param actionGroups array

param tags object


resource symbolicname 'Microsoft.Insights/scheduledQueryRules@2021-08-01' = {
  name: name
  location: location
  tags: tags
  
  kind: 'string'
  properties: {
    actions: {
      actionGroups: actionGroups
      customProperties: {}
    }
    autoMitigate: true
    criteria: {
      allOf: [
        {
          dimensions: dimensions
          failingPeriods: {
            minFailingPeriodsToAlert: int
            numberOfEvaluationPeriods: int
          }
          operator: operator
          query: query
          resourceIdColumn: resourceIdColumn
          threshold: threshold
          timeAggregation: timeAggregation
        }
      ]
    }
    description: description
    displayName: displayName
    enabled: true
    evaluationFrequency: frequency
    muteActionsDuration: 'string'
    overrideQueryTimeRange: 'string'
    scopes: [
      workspaceId
    ]
    severity: severity
    skipQueryValidation: bool
    targetResourceTypes: [
      'Microsoft.OperationalInsights/workspaces'
    ]
    windowSize: window
  }
}
