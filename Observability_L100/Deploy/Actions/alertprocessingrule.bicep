param alertRuleName string = 'AlertRuleName'
param actionGroupName string = 'On-Call Team'
param location string = resourceGroup().location

resource actionGroup 'Microsoft.Insights/actionGroups@2021-09-01' existing = {
  name: actionGroupName
}

resource alertProcessingRule 'Microsoft.AlertsManagement/actionRules@2021-08-08' = {
  name: alertRuleName
  location: location
  properties: {
    actions: [
      {
        actionType: 'AddActionGroups'
        actionGroupIds: [
          actionGroup.id
        ]
      }
    ]
    conditions: [
      
    ]
    enabled: true
    scopes: [
      subscription().id
    ]
  }
}

