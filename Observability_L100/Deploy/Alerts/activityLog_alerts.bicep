targetScope = 'subscription'

param build_iteration string = '001'

param resourceGroupLocation string = 'centralus'

resource al_alert_rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-alerts-al-${resourceGroupLocation}-${build_iteration}'
  location: resourceGroupLocation
}

module activityLogAlerts '../../arm/Microsoft.Insights/activityLogAlerts/deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-activityLogAlerts'
  scope: al_alert_rg
  params: {
    name: 'al_alert-${build_iteration}'
    location: 'global'
    conditions: [
      {
        'field': 'category'
        'equals': 'ServiceHealth'
        'containsAny': null
        'odata.type': null
    }
    {
        'field': 'properties.impactedServices[*].ServiceName'
        'equals': null
        'containsAny': [
            'Automation'
            'Azure Bastion'
            'Azure DDoS Protection'
            'Azure DNS'
            'Azure Firewall'
            'Azure Firewall Manager'
            'Azure Key Vault Managed HSM'
            'Azure Policy'
            'Azure Resource Manager'
            'Backup'
            'Cloud Shell'
            'Diagnostic Logs'
            'Event Hubs'
            'ExpressRoute'
            'ExpressRoute \\ ExpressRoute Circuits'
            'ExpressRoute \\ ExpressRoute Gateways'
            'Key Vault'
            'Log Analytics'
            'Microsoft Azure portal'
            'Microsoft Azure portal \\ Marketplace'
            'Microsoft Defender for Cloud'
            'Network Infrastructure'
            'Network Watcher'
            'Security Center'
            'Service Fabric'
            'Site Recovery'
            'Storage'
            'Subscription Management'
            'VPN Gateway'
            'VPN Gateway \\ Virtual WAN'
            'Virtual Machines'
            'Virtual Machine Scale Sets'
            'Virtual Network'
        ]
        'odata.type': null
    }
    {
        'field': 'properties.impactedServices[*].ImpactedRegions[*].RegionName'
        'equals': null
        'containsAny': [
            'Global'
        ]
        'odata.type': null
    }
    ]
  }
}
