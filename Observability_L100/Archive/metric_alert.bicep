param location string
param name string
param description string
param tags object = {}
param severity int = 3
param autoMitigation bool = true
param enabled bool = true

param criteria object
param frequency string
param window string
param scopes array

param actions array

param targetResourceRegion string = ''
param targetResourceType string = ''

resource genericMetricAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    actions: actions
    autoMitigate: autoMitigation 
    criteria: criteria
    description: description
    enabled: enabled
    evaluationFrequency: frequency
    scopes: scopes
    severity: severity
    targetResourceRegion: ((!empty(targetResourceRegion)) ? targetResourceRegion : null)
    targetResourceType: ((!empty(targetResourceType)) ? targetResourceType : null)
    windowSize: window
  }
}
