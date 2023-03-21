// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

targetScope = 'managementGroup'

@description('The management group scope to which the policy definitions are to be created at. DEFAULT VALUE = "alz"')
param parTargetManagementGroupId string = 'alz'

module Deploy_KeyVault_Availability_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_KeyVault_Availability_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_KeyVault_Availability_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy KeyVault Availability Alert'
    parPolicyAssignmentName: 'Deploy_KeyVault_Avail'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy KeyVault Availability Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_KeyVault_Capacity_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_KeyVault_Capacity_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_KeyVault_Capacity_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy KeyVault Capacity Alert'
    parPolicyAssignmentName: 'Deploy_KeyVault_Capacit'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy KeyVault Capacity Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_KeyVault_Latency_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_KeyVault_Latency_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_KeyVault_Latency_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy KeyVault Latency Alert'
    parPolicyAssignmentName: 'Deploy_KeyVault_Latency'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy KeyVault Latency Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_KeyVault_Requests_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_KeyVault_Requests_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_KeyVault_Requests_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy KeyVault Requests Alert'
    parPolicyAssignmentName: 'Deploy_KeyVault_Request'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy KeyVault Requests Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PDNSZ_RecordSetCapacity_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PDNSZ_RecordSetCapacity_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PDNSZ_RecordSetCapacity_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PDNSZ Record Set Capacity Alert'
    parPolicyAssignmentName: 'Deploy_PDNSZ_RecordSetC'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Private DNS Zone Record Set Capacity Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PDNSZ_CapacityUtil_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PDNSZ_CapacityUtil_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PDNSZ_CapacityUtil_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PDNSZ Capacity Utilization Alert'
    parPolicyAssignmentName: 'Deploy_PDNSZ_CapacityUt'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Private DNS Zone Capacity Utilization Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PDNSZ_QueryVolume_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PDNSZ_QueryVolume_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PDNSZ_QueryVolume_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PDNSZ Query Volume Alert'
    parPolicyAssignmentName: 'Deploy_PDNSZ_QueryVolum'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Private DNS Zone Query Volume Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_DNSZ_RegistrationCapacityUtil_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_DNSZ_RegistrationCapacityUtil_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_DNSZ_RegistrationCapacityUtil_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PDNSZ Registration Capacity Utilization Alert'
    parPolicyAssignmentName: 'Deploy_DNSZ_Registratio'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Private DNS Zone Registration Capacity Utilization Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PublicIp_DDoSAttack_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PublicIp_DDoSAttack_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PublicIp_DDoSAttack_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PIP DDoS Attack Alert'
    parPolicyAssignmentName: 'Deploy_PublicIp_DDoSAtt'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy PIP DDoS Attack Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PublicIp_BytesInDDoSAttack_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PublicIp_BytesInDDoSAttack_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PublicIp_BytesInDDoSAttack_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PIP Bytes in DDoS Attack Alert'
    parPolicyAssignmentName: 'Deploy_PublicIp_BytesIn'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy PIP Bytes in DDoS Attack Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PublicIp_PacketsInDDoSAttack_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PublicIp_PacketsInDDoSAttack_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PublicIp_PacketsInDDoSAttack_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PIP Packets in DDoS Attack Alert'
    parPolicyAssignmentName: 'Deploy_PublicIp_Packets'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy PIP Packets in DDoS Attack Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_PublicIp_VIPAvailability_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_PublicIp_VIPAvailability_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_PublicIp_VIPAvailability_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy PIP VIP Availability Alert'
    parPolicyAssignmentName: 'Deploy_PublicIp_VIPAvai'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy PIP VIP Availability Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_RecoveryVault_BackupHealth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_RecoveryVault_BackupHealth_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_RecoveryVault_BackupHealth_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy RV Backup Health Alert'
    parPolicyAssignmentName: 'Deploy_RecoveryVault_Ba'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Recovery Vault Backup Health Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_StorageAccount_Availability_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_StorageAccount_Availability_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_StorageAccount_Availability_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy SA Availability Alert'
    parPolicyAssignmentName: 'Deploy_StorageAccount_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy SA Availability Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VM_AvailableMemory_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VM_AvailableMemory_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VM_AvailableMemory_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VM Available Memory Alert'
    parPolicyAssignmentName: 'Deploy_VM_AvailableMemo'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VM Available Memory Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VNET_DDoSAttack_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VNET_DDoSAttack_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VNET_DDoSAttack_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNet DDoS Attack Alert'
    parPolicyAssignmentName: 'Deploy_VNET_DDoSAttack_'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network DDoS Attack Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_ExpressRouteCpuUtil_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VnetGw_ExpressRouteCpuUtil_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_ExpressRouteCpuUtil_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG ExpressRoute CPU Utilization Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_ExpressRo'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Gateway Express Route CPU Utilization Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelBandwidth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VnetGw_TunnelBandwidth_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelBandwidth_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Tunnel Bandwidth Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_TunnelBan'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Gateway Tunnel Bandwidth Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelEgress_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VnetGw_TunnelEgress_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelEgress_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Tunnel Egress Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_TunnelEgr'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Gateway Tunnel Egress Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelIngress_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VnetGw_TunnelIngress_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelIngress_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Tunnel Ingress Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_TunnelIng'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Gateway Tunnel Ingress Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_BandwidthUtil_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_BandwidthUtil_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_BandwidthUtil_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG  Bandwidth Utilization Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_BandwidthU'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway Bandwidth Utilization Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_BGPPeerStatus_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_BGPPeerStatus_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_BGPPeerStatus_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG  BGP Peer Status Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_BGPPeerSta'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway BGP Peer Status Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_Ingress_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_Ingress_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_Ingress_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG Ingress Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_Ingress_Al'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway Ingress Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_Egress_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_Egress_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_Egress_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG Egress Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_Egress_Ale'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway Egress Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_svcHlth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_svcHlth_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_ServiceHealth_Incident'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Service Health Incident Alert'
    parPolicyAssignmentName: 'Deploy_svcHlth_Ale'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Service Health Incident Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_svcHlth_Hlth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_svcHlth_Hlth_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_ServiceHealth_HealthAdvisory'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Service Health Health Advisory Alert'
    parPolicyAssignmentName: 'Deploy_svcHlth_Hlth'
    parPolicyAssignmentDescription: 'DINE policy to deploy Service Health Health Advisory Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_svcHlth_Main_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_svcHlth_Main_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_ServiceHealth_Maintenance'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Service Health Planned Maintenance Alert'
    parPolicyAssignmentName: 'Deploy_svcHlth_main'
    parPolicyAssignmentDescription: 'DINE policy to deploy Service Health Planned Maintenance Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_svcHlth_Sec_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_svcHlth_Sec_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_ServiceHealth_SecurityAdvisory'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Service Health Security Advisory Alert'
    parPolicyAssignmentName: 'Deploy_svcHlth_sec'
    parPolicyAssignmentDescription: 'DINE policy to deploy Service Health Security Advisory Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ResHlth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_resHlth_Unhlth_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_ResourceHealth_Unhealthy_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Resource Health Unhealthy Alert'
    parPolicyAssignmentName: 'Deploy_resHlth_unhealth'
    parPolicyAssignmentDescription: 'DINE policy to deploy Resource Health Unhealthy Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActLog_Firewall_Del_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_activity_firewalldel_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_Firewall_Delete'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Activity Log Azure FireWall Delete Alert'
    parPolicyAssignmentName: 'Deploy_firewall_delete'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Activity Log Azure Firewall Delete Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActLog_KeyVault_Del_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_activity_keyvaultdel_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_KeyVault_Delete'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Activity Log Key Vault Delete Alert'
    parPolicyAssignmentName: 'Deploy_keyvault_delete'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Activity Log Key Vault Delete Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActLog_LogAnal_Del_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_activity_loganaldel_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_LAWorkspace_Delete'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Activity Log LA Workspace Delete Alert'
    parPolicyAssignmentName: 'Deploy_loganal_delete'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Activity Log LA Workspace Delete Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActLog_LogAnal_regen_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_activity_loganalregen_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_LAWorkspace_KeyRegen'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Activity Log LA Workspace Regenerate Key Alert'
    parPolicyAssignmentName: 'Deploy_loganal_ReGenk'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Activity Log LA Workspace Regenerate Key Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActLog_NSG_delete_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_activity_nsgdel_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_NSG_Delete'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Activity Log NSG Delete Alert'
    parPolicyAssignmentName: 'Deploy_ActNSG_Del'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Activity Log NSG Delete Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActLog_VPNGateway_delete_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_activity_vpngatedel_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_activitylog_VPNGateway_Delete'
    parPolicyAssignmentDisplayName: '[DINE] Deploy Activity Log VPN Gateway Delete Alert'
    parPolicyAssignmentName: 'Deploy_ActVPNGate_Del'
    parPolicyAssignmentDescription: 'DINE policy to Deploy Activity Log VPN Gateway Delete Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ERCIR_ArpAvailability_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERCIR_ArpAvailability_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERCIR_ArpAvailability_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ExpressRoute ArpAvailability Alert'
    parPolicyAssignmentName: 'Deploy_ERCIR_ArpAv_Aler'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ExpressRoute ArpAvailability Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_ERCIR_BgpAvailability_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERCIR_BgpAvailability_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERCIR_BgpAvailability_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ExpressRoute BgpAvailability Alert'
    parPolicyAssignmentName: 'Deploy_ERCIR_BgpAv_Aler'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ExpressRoute BgpAvailability Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_ERCIR_QosDropBitsInPerSecond_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERCIR_QosDropBitsInPerSecond_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERCIR_QosDropBitsInPerSecond_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ExpressRoute QosDropBitsInPerSecond Alert'
    parPolicyAssignmentName: 'Deploy_ERCIR_QosDropIn'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ExpressRoute QosDropBitsInPerSecond Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_ERCIR_QosDropBitsOutPerSecond_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERCIR_QosDropBitsOutPerSecond_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERCIR_QosDropBitsOutPerSecond_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ExpressRoute QosDropBitsOutPerSecond Alert'
    parPolicyAssignmentName: 'Deploy_ERCIR_QosDropOut'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ExpressRoute QosDropBitsOutPerSecond Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_TunnelEgressPacketDropCount_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_TunnelEgressPacketDropCount_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_TunnelEgressPacketDropCount_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG TunnelEgressPacketDropCount Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_TunnelEgrC'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway TunnelEgressPacketDropCount Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_TunnelEgressPacketDropMisMatch_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_TunnelEgressPacketDropMisMatch_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_TunnelEgressPacketDropMisMatch_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG TunnelEgressPacketDropMisMatch Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_TunnelEgrM'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway TunnelEgressPacketDropMisMatch Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_TunnelIngressPacketDropCount_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_TunnelIngressPacketDropCount_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_TunnelIngressPacketDropCount_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG TunnelIngressPacketDropCount Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_TunnelIngC'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway TunnelIngressPacketDropCount Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VPNGw_TunnelIngressPacketDropMismatch_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VPNGw_TunnelIngressPacketDropMismatch_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VPNGw_TunnelIngressPacketDropMismatch_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VPNG TunnelIngressPacketDropMismatch Alert'
    parPolicyAssignmentName: 'Deploy_VPNGw_TunnelIngM'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy VPN Gateway TunnelIngressPacketDropMismatch Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_AA_TotalJob_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_AA_TotalJob_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_AA_TotalJob_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy AA TotalJob Alert'
    parPolicyAssignmentName: 'Deploy_AA_TotalJob_Aler'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Automation Account Total Job Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_AFW_FirewallHealth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_AFW_FirewallHealth_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_AFW_FirewallHealth_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy AFW FirewallHealth Alert'
    parPolicyAssignmentName: 'Deploy_AFW_FWHealth_Ale'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Azure Firewall FirewallHealth Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_AFW_SNATPortUtilization_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_AFW_SNATPortUtilization_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_AFW_SNATPortUtilization_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy AFW SNATPortUtilization'
    parPolicyAssignmentName: 'Deploy_AFW_SNATPortUtil'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Azure Firewall SNAtPortUtilization Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_ERG_CPUUtilization_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERGw_ExpressRouteCpuUtil_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERGw_ExpressRouteCpuUtil_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ERG ExpressRoute CPU Utilization Alert'
    parPolicyAssignmentName: 'Deploy_ERGw_ERCpuU_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ER Gateway Express Route CPU Utilization Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_ERGw_ExpressRouteBitsIn_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERGw_ExpressRouteBitsIn_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERGw_ExpressRouteBitsIn_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ERG ExpressRoute Bits In Alert'
    parPolicyAssignmentName: 'Deploy_ERGw_ERBitsIn_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ER Gateway Connection BitsInPerSecond Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_ERGw_ExpressRouteBitsOut_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ERGw_ExpressRouteBitsOut_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_ERGw_ExpressRouteBitsOut_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy ERG ExpressRoute Bits Out Alert'
    parPolicyAssignmentName: 'Deploy_ERGw_ERBitsOut_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy ER Gateway Connection BitsOutPerSecond Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_ExpressRouteBitsPerSecond_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VNetG_ExpressRouteBps_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_ExpressRouteBitsPerSecond_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG ExpressRoute Bits Per Second Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_ERBPS_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Gateway Express Route Bits Per Second Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelEgressPacketDropCount_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VNetG_TunnelEgressPacketDc_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelEgressPacketDropCount_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Egress Packet Drop Count Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_EgrPDC_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Vnet Gateway Egress Packet Drop Count Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelEgressPacketDropMismatch_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VNetG_TunnelEgressPacketDropMm_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelEgressPacketDropMismatch_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Egress Packet Drop Mismatch Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_EgrPDM_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Vnet Gateway Egress Packet Drop Mismatch Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelIngressPacketDropCount_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VNetG_TunnelIngressPacketDc_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelIngressPacketDropCount_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Ingress Packet Drop Count Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_IgrPDC_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Vnet Gateway Ingress Packet Drop Count Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
module Deploy_VnetGw_TunnelIngressPacketDropMismatch_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_VNetG_TunnelIngressPacketDropMm_Alert'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VnetGw_TunnelIngressPacketDropMismatch_Alert'
    parPolicyAssignmentDisplayName: '[DINE] Deploy VNetG Ingress Packet Drop Mismatch Alert'
    parPolicyAssignmentName: 'Deploy_VnetGw_IgrPDM_A'
    parPolicyAssignmentDescription: 'DINE policy to audit/deploy Vnet Gateway Ingress Packet Drop Mismatch Alert'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}

module Deploy_ActGrp_AlertPpocessingRule '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
  name: '${uniqueString(deployment().name)}-Deploy_ActGrp_AlertPpocessingRule'
  params: {
    parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_AlertProcessing_Rule'
    parPolicyAssignmentDisplayName: '[DINE] Deploy_AlertProcessing_Rule'
    parPolicyAssignmentName: 'Deploy_AlPro_ActGrp_A'
    parPolicyAssignmentDescription: 'DINE Deploy Alert Processing Rule'
    parPolicyAssignmentIdentityType: 'SystemAssigned'
    parPolicyAssignmentIdentityRoleDefinitionIds: [
      'b24988ac-6180-42a0-ab88-20f7382dd24c'
    ]
    parPolicyAssignmentMetadata: {
      _deployed_by_alz_monitor: true
    }
    parPolicyAssignmentRoleAssignmentDescription: '_deployed_by_alz_monitor'
  }
}
