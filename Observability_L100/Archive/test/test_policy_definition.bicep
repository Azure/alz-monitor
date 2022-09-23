targetScope = 'subscription'

module vm_highcpu_alert_audit_policy '../Modules/policies/audit/workspaces/vm.highcpu.alert.bicep' = {
  name: 'vm-highcpu-alert-audit-policy'
  params: {
    name: 'pol-highcpu-alert-002'
    description: 'Policy to check if VM High CPU alert is present in enviornment.'
    displayName: 'VM High CPU Alert Policy'
  }
}
