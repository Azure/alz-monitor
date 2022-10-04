targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// DNS Zone Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module dnsz_queryVolume_policy 'DNS_Zone_Alerts/dnsz_queryvolume_alert.bicep' = {
   name: '${uniqueString(deployment().name)}-qva-policyDefinitions-deploy'
   params: {
    deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
    policyLocation: policyLocation
   }
}

module dnsz_recordSetCount_policy 'DNS_Zone_Alerts/dnsz_recordsetcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-rsca-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module dnsz_recordSetCapacityUtilization_policy 'DNS_Zone_Alerts/dnsz_recordsetcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-rsca-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Key Vault Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module kv_capacity_policy 'Key_Vault_Alerts/kv_capacity_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvca-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_latency_policy 'Key_Vault_Alerts/kv_latency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvla-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_queryvolume_policy 'Key_Vault_Alerts/kv_queryvolume_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvqva-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_requests_policy 'Key_Vault_Alerts/kv_requests_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvra-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Private DNS Zone Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module pdnsz_capacityutilization_policy 'Private_DNS_Zone_Alerts/pdnsz_capacityutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnsvnlcu-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_queryvolume_policy 'Private_DNS_Zone_Alerts/pdnsz_queryvolume_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnszqv-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_recordsetcapacity_policy 'Private_DNS_Zone_Alerts/pdnsz_recordsetcapacity_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnsrsc-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_registrationcapacityutilization_policy 'Private_DNS_Zone_Alerts/pdnsz_registrationcapacityutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnszvnrcu-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Public IP Address Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module pip_bytesinddosattack_policy 'Public_IP_Address_Alerts/pip_bytesinddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipbiddos-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_ddosattack_policy 'Public_IP_Address_Alerts/pip_ddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipddosa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_packetsinddos_policy 'Public_IP_Address_Alerts/pip_packetsinddos_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pippiddos-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_vipavailability_policy 'Public_IP_Address_Alerts/pip_vipavailability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipvipaa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Recovery Vault Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module rv_backuphealth_policy 'Recovery_Vault_Alerts/rv_backuphealth_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-rvbuha-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Storage Account Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module sa_availability_policy 'Storage_Account_Alerts/sa_availability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-saaa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module sa_e2elatency_policy 'Storage_Account_Alerts/sa_e2elatency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-sae2ela-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module sa_latency_policy 'Storage_Account_Alerts/sa_latency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-sassla-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module sa_transactions_policy 'Storage_Account_Alerts/sa_transactions_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-sata-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Virtual Machine Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module vm_availablememory_policy 'Virtual_Machine_Alerts/vm_availablememory_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Virtual Network Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module vnet_ddosattack_policy 'Virtual_Network_Alerts/vnet_ddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetddosaa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnet_pingavgroundtrip_policy 'Virtual_Network_Alerts/vnet_pingavgroundtrip_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnparta-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnet_probefailed_policy 'Virtual_Network_Alerts/vnet_probefailed_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetpfa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Virtual Network Gateway Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module vnetg_expressroutecpuutilization_policy 'VNet_Gateway_Alerts/vnetg_expressroutecpuutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vngergcpuua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelbandwidth_policy 'VNet_Gateway_Alerts/vnetg_tunnelbandwidth_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgtaba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelegress_policy 'VNet_Gateway_Alerts/vnetg_tunnelegress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgteba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelingress_policy 'VNet_Gateway_Alerts/vnetg_tunnelingress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgtiba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// VPN Gateway Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module vpng_bandwidthutilization_policy 'VPN_Gateway_Alerts/vpng_bandwidthutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngbua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_bgppeerstatus_policy 'VPN_Gateway_Alerts/vpng_bgppeerstatus_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngbgppsa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egress_policy 'VPN_Gateway_Alerts/vpng_egress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngtea-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingress_policy 'VPN_Gateway_Alerts/vpng_ingress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngtia-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}
