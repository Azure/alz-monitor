targetScope = 'managementGroup'

@description('The management group scope to which the policy definitions are to be created at. DEFAULT VALUE = "alz"')
param parTargetManagementGroupId string = 'alz'

module Deploy_DNSZ_QueryVolume_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_DNSZ_QueryVolume_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_DNSZ_QueryVolume_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy DNSZ Query Volume Alert'
            parPolicyAssignmentName: 'Deploy_DNSZ_QueryVolume'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy DNS Zone Query Volume Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
          }
        }
module Deploy_DNSZ_RecordSetCount_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_DNSZ_RecordSetCount_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_DNSZ_RecordSetCount_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy DNSZ Record Set Count Alert'
            parPolicyAssignmentName: 'Deploy_DNSZ_RecordSetCo'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy DNS Zone Record Set Count Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
          }
        }
module Deploy_DNSZ_ZoneRecordSetCapacityUtil_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_DNSZ_ZoneRecordSetCapacityUtil_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_DNSZ_ZoneRecordSetCapacityUtil_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy DNSZ Record Set Capacity Utilization Alert'
            parPolicyAssignmentName: 'Deploy_DNSZ_ZoneRecordS'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy DNS Zone Record Set Capacity Utilization Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
          }
        }
module Deploy_KeyVault_QueryVolume_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_KeyVault_QueryVolume_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_KeyVault_QueryVolume_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy KeyVault Query Volume Alert'
            parPolicyAssignmentName: 'Deploy_KeyVault_QueryVo'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy KeyVault Query Volume Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
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
          }
        }
module Deploy_StorageAccount_Transaction_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_StorageAccount_Transaction_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_StorageAccount_Transaction_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy SA Transaction Alert'
            parPolicyAssignmentName: 'Deploy_StorageAccount_T'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy SA Transaction Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
          }
        }
module Deploy_StorageAccount_Latency_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_StorageAccount_Latency_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_StorageAccount_Latency_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy SA Latency Alert'
            parPolicyAssignmentName: 'Deploy_StorageAccount_L'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy SA Latency Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
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
          }
        }
module Deploy_StorageAccount_E2ELatency_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_StorageAccount_E2ELatency_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_StorageAccount_E2ELatency_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy SA E2E Latency Alert'
            parPolicyAssignmentName: 'Deploy_StorageAccount_E'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy SA E2E Latency Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
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
          }
        }
module Deploy_VNET_PingAvgRoundtrip_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_VNET_PingAvgRoundtrip_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VNET_PingAvgRoundtrip_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy VNet Ping Avg Roundtrip Alert'
            parPolicyAssignmentName: 'Deploy_VNET_PingAvgRoun'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Ping Average Roundtrip Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
          }
        }
module Deploy_VNET_ProbeFailed_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_VNET_ProbeFailed_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/Deploy_VNET_ProbeFailed_Alert'
            parPolicyAssignmentDisplayName: '[DINE] Deploy VNet Probe Failed Alert'
            parPolicyAssignmentName: 'Deploy_VNET_ProbeFailed'
            parPolicyAssignmentDescription: 'DINE policy to audit/deploy Virtual Network Probe Failed Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
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
          }
        }


module Deploy_svcHlth_Alert '../../infra-as-code/bicep/modules/policy/assignments/policyAssignmentManagementGroup.bicep' = {
        name: '${uniqueString(deployment().name)}-Deploy_svcHlth_Alert'
          params: {
            parPolicyAssignmentDefinitionId: '/providers/Microsoft.Management/managementGroups/${parTargetManagementGroupId}/providers/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident'
            parPolicyAssignmentDisplayName: '[DINE] Deploy Service Health Incident Alert'
            parPolicyAssignmentName: 'Deploy_svcHlth_Ale'
            parPolicyAssignmentDescription: 'DINE policy to Deploy Service Health Incident Alert'
            parPolicyAssignmentIdentityType: 'SystemAssigned'
            parPolicyAssignmentIdentityRoleDefinitionIds: [
                'b24988ac-6180-42a0-ab88-20f7382dd24c'
            ]
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
                                       }
                                     }
