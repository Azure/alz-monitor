// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.

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

module dnsz_queryVolume_policy '../../src/bicep/deploy-dnsz_queryvolume_alert.bicep' = {
   name: '${uniqueString(deployment().name)}-qva-policyDefinitions-deploy'
   params: {
    deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
    policyLocation: policyLocation
   }
}

module dnsz_recordSetCount_policy '../../src/bicep/deploy-dnsz_recordsetcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-rsca-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module dnsz_recordSetCapacityUtilization_policy '../../src/bicep/deploy-dnsz_recordsetcapacityutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-rscua-policyDefinitions-deploy'
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

module kv_capacity_policy '../../src/bicep/deploy-kv_capacity_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvca-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_latency_policy '../../src/bicep/deploy-kv_latency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvla-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_queryvolume_policy '../../src/bicep/deploy-kv_availability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvqva-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_requests_policy '../../src/bicep/deploy-kv_requests_alert.bicep' = {
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

module pdnsz_capacityutilization_policy '../../src/bicep/deploy-pdnsz_capacityutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnsvnlcu-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_queryvolume_policy '../../src/bicep/deploy-pdnsz_queryvolume_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnszqv-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_recordsetcapacity_policy '../../src/bicep/deploy-pdnsz_recordsetcapacity_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnsrsc-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_registrationcapacityutilization_policy '../../src/bicep/deploy-pdnsz_registrationcapacityutilization_alert.bicep' = {
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

module pip_bytesinddosattack_policy '../../src/bicep/deploy-pip_bytesinddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipbiddos-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_ddosattack_policy '../../src/bicep/deploy-pip_ddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipddosa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_packetsinddos_policy '../../src/bicep/deploy-pip_packetsinddos_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pippiddos-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_vipavailability_policy '../../src/bicep/deploy-pip_vipavailability_alert.bicep' = {
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

module rv_backuphealth_policy '../../src/bicep/deploy-rv_backuphealth_alert.bicep' = {
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

module sa_availability_policy '../../src/bicep/deploy-sa_availability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-saaa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module sa_e2elatency_policy '../../src/bicep/deploy-sa_e2elatency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-sae2ela-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module sa_latency_policy '../../src/bicep/deploy-sa_latency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-sassla-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module sa_transactions_policy '../../src/bicep/deploy-sa_transactions_alert.bicep' = {
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

module vm_availablememory_policy '../../src/bicep/deploy-vm_availablememory_alert.bicep' = {
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

module vnet_ddosattack_policy '../../src/bicep/deploy-vnet_ddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetddosaa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnet_pingavgroundtrip_policy '../../src/bicep/deploy-vnet_pingavgroundtrip_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnparta-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnet_probefailed_policy '../../src/bicep/deploy-vnet_probefailed_alert.bicep' = {
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

module vnetg_expressroutecpuutilization_policy '../../src/bicep/deploy-vnetg_expressroutecpuutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vngergcpuua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelbandwidth_policy '../../src/bicep/deploy-vnetg_bandwidthutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgtaba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelegress_policy '../../src/bicep/deploy-vnetg_egress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgteba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelingress_policy '../../src/bicep/deploy-vnetg_ingress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgtiba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_bgppeerstatus_policy '../../src/bicep/deploy-vnetg_bgppeerstatus_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnpgbgppeerstatus-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_expressroutebits_policy '../../src/bicep/deploy-vnetg_expressroutebitspersecond_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vngergbitsa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_egresspacketdropcount_policy '../../src/bicep/deploy-vnetg_egresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgegrpacketdropcnt-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_egresspacketdropmismatch_policy '../../src/bicep/deploy-vnetg_egresspacketdropmismatch_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgegrpacketdrpmmtch-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_ingresspacketdropcount_policy '../../src/bicep/deploy-vnetg_ingresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgingrpacketdropcnt-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_ingresspacketdropmismatch_policy '../../src/bicep/deploy-vnetg_ingresspacketdropmismatch_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgingrpacketdrpmmtch-policyDefinitions-deploy'
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

module vpng_bandwidthutilization_policy '../../src/bicep/deploy-vpng_bandwidthutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngbua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_bgppeerstatus_policy '../../src/bicep/deploy-vpng_bgppeerstatus_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngbgppsa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egress_policy '../../src/bicep/deploy-vpng_egress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngtea-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingress_policy '../../src/bicep/deploy-vpng_ingress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngtia-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egresspacketdropcount_policy '../../src/bicep/deploy-vpng_egresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngegrpacketdropcount-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egresspacketdropmismatch_policy '../../src/bicep/deploy-vpng_egresspacketdropmismatch_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngegrpacketdropmmatch-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingresspacketdropcount_policy '../../src/bicep/deploy-vpng_ingresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngingrpacketdropcount-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingresspacketdropmismatch_policy '../../src/bicep/deploy-vpng_ingresspacketdropmismatch_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngingrpacketdropmmtch-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// ExpressRoute Circuit Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module ercir_arpavailbility_policy '../../src/bicep/deploy-ercir_arpavailability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirarpav-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module ercir_bgpavailbility_policy '../../src/bicep/deploy-ercir_bgpavailability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirbgpav-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module ercir_qosdropbitsinpersecond_policy '../../src/bicep/deploy-ercir_qosdropsbitsin_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirqosdropsin-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module ercir_qosdropbitsoutpersecond_policy '../../src/bicep/deploy-ercir_qosdropsbitsout_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirqosdropsout-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// ExpressRoute Gateway Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module erg_ergcpuutilization_policy '../../src/bicep/deploy-erg_expressroutecpuutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ergergcpuua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module erg_ergbitsinpersecond_policy '../../src/bicep/deploy-erg_bitsinpersecond_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ergergbin-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module erg_ergbitsoutpersecond_policy '../../src/bicep/deploy-erg_bitsoutpersecond_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ergergbout-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Automation Account Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module aa_totaljobs_policy '../../src/bicep/deploy-aa_totaljob_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-aatotaljob-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Azure Firewall Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module afw_firewallhealth_policy '../../src/bicep/deploy-afw_firewallhealth_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-afwfirewallhealth-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module afw_snatportutilization_policy '../../src/bicep/deploy-afw_snatportutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-afwsnatportutilization-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Service Health Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module svcHealth_Health_policy '../../src/bicep/deploy-activitylog-ServiceHealth-Health.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthHealth-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module svcHealth_Incident_policy '../../src/bicep/deploy-activitylog-ServiceHealth-Incident.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthIncident-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module svcHealth_Maintenance_policy '../../src/bicep/deploy-activitylog-ServiceHealth-Maintenance.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthMaintenance-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module svcHealth_Security_policy '../../src/bicep/deploy-activitylog-ServiceHealth-Security.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthSecurity-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Activity Log Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module aLog_AfwDelete_policy '../../src/bicep/deploy-activitylog-AzureFirewall-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogAfwDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_KvDelete_policy '../../src/bicep/deploy-activitylog-KeyVault-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogaKvDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_LawDelete_policy '../../src/bicep/deploy-activitylog-LAWorkspace-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogLawDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_LawRegen_policy '../../src/bicep/deploy-activitylog-LAWorkspace-ReGen.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogLawRegen-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_NsgDelete_policy '../../src/bicep/deploy-activitylog-NSG-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogNsgDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_ResHealth_Unhealthy_policy '../../src/bicep/deploy-activitylog-ResourceHealth-UnHealthly-alert.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogResHealthUnhealthy-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_VpnGwDelete_policy '../../src/bicep/deploy-activitylog-VPNGate-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogVpnGwDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Alert Procesing Rules
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module actGrp_AlertProcessing_policy '../../src/bicep/deploy-alertprocessingrule-deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-actGrp_AlertProcessing_policy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}
