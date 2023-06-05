targetScope = 'managementGroup'

param policyLocation string = 'centralus'
param deploymentRoleDefinitionIds array = [
    '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
]
@description('Set Parameter to true to Opt-out of deployment telemetry')
param parTelemetryOptOut bool = false

// Customer Usage Attribution Id
var varCuaid = 'd6b3b08c-5825-4b89-a62b-e3168d3d8fb0'


///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Key Vault Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module kv_capacity_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_capacity_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvca-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_latency_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_latency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvla-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_availability_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_availability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-kvqva-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module kv_requests_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_requests_alert.bicep' = {
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

module pdnsz_capacityutilization_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_capacityutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnsvnlcu-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_queryvolume_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_queryvolume_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnszqv-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_recordsetcapacity_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_recordsetcapacity_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pdnsrsc-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pdnsz_registrationcapacityutilization_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_registrationcapacityutilization_alert.bicep' = {
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

module pip_bytesinddosattack_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_bytesinddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipbiddos-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_ddosattack_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_ddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pipddosa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module pip_packetsinddos_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_packetsinddos_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-pippiddos-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
  }
}

module pip_vipavailability_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_vipavailability_alert.bicep' = {
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

module rv_backuphealth_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-rv_backuphealth_alert.bicep' = {
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

module sa_availability_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-saaa-policyDefinitions-deploy'
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

module vm_availablememory_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm_availablememory_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Virtual Machine Log Alerts
//
///////////////////////////////////////////////////////////////////////////////////////////////////

module vm_availablememorypercent_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-PercentMemory_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vm_CPUpercent_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-PercentCPU_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}



module vm_NetworkOut_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-NetworkOut_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vm_NetworkIn_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-NetworkIn_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vm_HeartBeat_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-HeartBeat_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}



module vm_dataDiskWriteLatency_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-dataDiskwriteLatency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vm_dataDiskReadLatency_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-dataDiskreadLatency_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vmama-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vm_dataDiskSpace_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vm-dataDiskSpace_alert.bicep' = {
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

module vnet_ddosattack_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnet_ddosattack_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetddosaa-policyDefinitions-deploy'
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

module vnetg_expressroutecpuutilization_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutecpuutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vngergcpuua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelbandwidth_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_bandwidthutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgtaba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelegress_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgteba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_tunnelingress_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgtiba-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_expressroutebits_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutebitspersecond_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vngergbitsa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_egresspacketdropcount_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgegrpacketdropcnt-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_egresspacketdropmismatch_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egresspacketdropmismatch_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgegrpacketdrpmmtch-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_ingresspacketdropcount_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vnetgingrpacketdropcnt-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vnetg_ingresspacketdropmismatch_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingresspacketdropmismatch_alert.bicep' = {
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

module vpng_bandwidthutilization_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_bandwidthutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngbua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_bgppeerstatus_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_bgppeerstatus_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngbgppsa-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egress_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngtea-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingress_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingress_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngtia-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egresspacketdropcount_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngegrpacketdropcount-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_egresspacketdropmismatch_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egresspacketdropmismatch_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngegrpacketdropmmatch-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingresspacketdropcount_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingresspacketdropcount_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-vpngingrpacketdropcount-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module vpng_ingresspacketdropmismatch_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingresspacketdropmismatch_alert.bicep' = {
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

module ercir_arpavailbility_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_arpavailability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirarpav-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module ercir_bgpavailbility_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_bgpavailability_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirbgpav-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module ercir_qosdropbitsinpersecond_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_qosdropsbitsin_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ercirqosdropsin-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module ercir_qosdropbitsoutpersecond_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_qosdropsbitsout_alert.bicep' = {
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

module erg_ergcpuutilization_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_expressroutecpuutilization_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ergergcpuua-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module erg_ergbitsinpersecond_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_bitsinpersecond_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-ergergbin-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module erg_ergbitsoutpersecond_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_bitsoutpersecond_alert.bicep' = {
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

module aa_totaljobs_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.bicep' = {
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

module afw_firewallhealth_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.bicep' = {
  name: '${uniqueString(deployment().name)}-afwfirewallhealth-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module afw_snatportutilization_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_snatportutilization_alert.bicep' = {
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

module svcHealth_Health_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthHealth-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module svcHealth_Incident_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthIncident-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module svcHealth_Maintenance_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.bicep' = {
  name: '${uniqueString(deployment().name)}-svcHealthMaintenance-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module svcHealth_Security_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Security.bicep' = {
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

module aLog_AfwDelete_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-AzureFirewall-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogAfwDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_KvDelete_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-KeyVault-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogaKvDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_LawDelete_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-LAWorkspace-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogLawDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_LawRegen_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-LAWorkspace-ReGen.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogLawRegen-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_NsgDelete_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-NSG-Del.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogNsgDelete-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_UdrUpdate_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-RouteTable-Update.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogUdrUpdate-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_ResHealth_Unhealthy_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.bicep' = {
  name: '${uniqueString(deployment().name)}-aLogResHealthUnhealthy-policyDefinitions-deploy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

module aLog_VpnGwDelete_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-VPNGate-Del.bicep' = {
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

module actGrp_AlertProcessing_policy '../../src/resources/Microsoft.Authorization/policyDefinitions/deploy-alertprocessingrule-deploy.bicep' = {
  name: '${uniqueString(deployment().name)}-actGrp_AlertProcessing_policy'
  params: {
   deploymentRoleDefinitionIds: deploymentRoleDefinitionIds
   policyLocation: policyLocation
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Deployment telemetry
//
///////////////////////////////////////////////////////////////////////////////////////////////////


module modCustomerUsageAttribution './CRML/customerUsageAttribution/cuaIdManagementGroup.bicep' = if (!parTelemetryOptOut) {
  #disable-next-line no-loc-expr-outside-params //Only to ensure telemetry data is stored in same location as deployment. See https://github.com/Azure/ALZ-Bicep/wiki/FAQ#why-are-some-linter-rules-disabled-via-the-disable-next-line-bicep-function for more information
  name: 'pid-${varCuaid}-${uniqueString(deployment().location)}'
  params: {}
}
