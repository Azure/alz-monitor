param location string
param name string
param description string
param enabled bool
param tags object = {}
param scopes array
param condition object
param actionGroups array = []

resource genericActivityLogAlert 'Microsoft.Insights/activityLogAlerts@2020-10-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    actions: {
      actionGroups: actionGroups
    }
    condition: condition
    description: description
    enabled: enabled
    scopes: scopes
  }
}
