param actionGroupName string = 'On-Call Team'
param location string = resourceGroup().location

var actionGroupEmail = 'oncallteam@contoso.com'

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
