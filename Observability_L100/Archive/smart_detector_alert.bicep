resource symbolicname 'microsoft.alertsManagement/smartDetectorAlertRules@2021-04-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  properties: {
    actionGroups: {
      customEmailSubject: 'string'
      customWebhookPayload: 'string'
      groupIds: [
        'string'
      ]
    }
    description: 'string'
    detector: {
      id: 'string'
      parameters: {}
    }
    frequency: 'string'
    scope: [
      'string'
    ]
    severity: 'string'
    state: 'string'
    throttling: {
      duration: 'string'
    }
  }
}
