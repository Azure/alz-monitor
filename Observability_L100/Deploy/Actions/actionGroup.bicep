targetScope = 'resourceGroup'


param actionGroupName string 
param actionGroupEmail string
var location  = resourceGroup().location



resource supportTeamActionGroup 'Microsoft.Insights/actionGroups@2021-09-01' = {
  name: actionGroupName
  location: location
  properties: {
    enabled: true
    groupShortName: actionGroupName
    emailReceivers: [
      {
        name: actionGroupName
        emailAddress: actionGroupEmail
        useCommonAlertSchema: true
      }
    ] 
  }
}
