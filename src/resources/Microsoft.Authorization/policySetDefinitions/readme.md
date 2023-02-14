# Azure Policy initiatives for monitoring

## Overview

This document details the ALZ-Monitor Azure policy initiatives leveraged for deploying the ALZ-Monitor baselines. For references on individual alerts/policies please refer to [Alert Details](https://github.com/Azure/alz-monitor/wiki/AlertsDetails).

## Connectivity initiative

This initiative is intended for assignment of policies relevant to networking components in ALZ. With the guidance provided in [How to consume the IP contained in this repo](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide), this will assign to the alz-platform-connectivity management group structure in the ALZ reference architecture. For details on which policies are included in the initiative as well as what the default enablement state of the policy is, please refer to the below table. 

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_ERCIR_QosDropBitsInPerSecond_Alert | [deploy-ercir_qosdropsbitsin_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_qosdropsbitsin_alert.json) | deployIfNotExists |
| Deploy_ERCIR_QosDropBitsOutPerSecond_Alert | [deploy-ercir_qosdropsbitsout_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_qosdropsbitsout_alert.json) | deployIfNotExists|
| Deploy_VPNGw_BGPPeerStatus_Alert | [deploy-vpng_bgppeerstatus_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_bgppeerstatus_alert.json) | deployIfNotExists|
| Deploy_VnetGw_ExpressRouteCpuUtil_Alert | [deploy-vnetg_expressroutecpuutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutecpuutilization_alert.json) | deployIfNotExists|
| Deploy_VnetGw_TunnelBandwidth_Alert | [deploy-vnetg_bandwidthutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_bandwidthutilization_alert.json) | deployIfNotExists |
| Deploy_VnetGw_TunnelEgress_Alert | [deploy-vnetg_egress_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egress_alert.json) | disabled|
| Deploy_VnetGw_TunnelIngress_Alert | [deploy-vnetg_ingress_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingress_alert.json) | disabled |
| Deploy_VPNGw_BandwidthUtil_Alert | [deploy-vpng_bandwidthutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_bandwidthutilization_alert.json) | deployIfNotExists |
| Deploy_VPNGw_Egress_Alert | [deploy-vpng_egress_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egress_alert.json) | disabled |
| Deploy_VPNGw_TunnelEgressPacketDropCount_Alert | [deploy-vpng_egresspacketdropcount_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egresspacketdropcount_alert.json) | deployIfNotExists|
| Deploy_VPNGw_TunnelEgressPacketDropMismatch_Alert | [deploy-vpng_egresspacketdropmismatch_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egresspacketdropmismatch_alert.json) | deployIfNotExists|
| Deploy_VPNGw_Ingress_Alert | [deploy-vpng_ingress_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingress_alert.json) | disabled |
| Deploy_VPNGw_TunnelIngressPacketDropCount_Alert | [deploy-vpng_ingresspacketdropcount_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingresspacketdropcount_alert.json) | deployIfNotExists|
| Deploy_VPNGw_TunnelIngressPacketDropMismatch_Alert | [deploy-vpng_ingresspacketdropmismatch_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingresspacketdropmismatch_alert.json) | deployIfNotExists |
| Deploy_PDNSZ_CapacityUtil_Alert | [deploy-pdnsz_capacityutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_capacityutilization_alert.json) | deployIfNotExists|
| Deploy_PDNSZ_QueryVolume_Alert | [deploy-pdnsz_queryvolume_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_queryvolume_alert.json) | disabled |
| Deploy_PDNSZ_RecordSetCapacity_Alert | [deploy-pdnsz_recordsetcapacity_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_recordsetcapacity_alert.json) | deployIfNotExists |
| Deploy_DNSZ_RegistrationCapacityUtil_Alert | [deploy-pdnsz_registrationcapacityutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_registrationcapacityutilization_alert.json) | deployIfNotExists|
| Deploy_ERGw_ExpressRouteBitsIn_Alert | [deploy-erg_bitsinpersecond_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_bitsinpersecond_alert.json) | disabled|
| Deploy_ERGw_ExpressRouteBitsOut_Alert | [deploy-erg_bitsoutpersecond_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_bitsoutpersecond_alert.json) | disabled|
| Deploy_ERGw_ExpressRouteCpuUtil_Alert | [deploy-erg_expressroutecpuutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_expressroutecpuutilization_alert.json) | deployIfNotExists |
| Deploy_VnetGw_TunnelEgressPacketDropMismatch_Alert | [deploy-vnetg_egresspacketdropmismatch_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egresspacketdropmismatch_alert.json) | deployIfNotExists |
| Deploy_VnetGw_ExpressRouteBitsPerSecond_Alert | [deploy-vnetg_expressroutebitspersecond_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutebitspersecond_alert.json) | deployIfNotExists |
| Deploy_VnetGw_TunnelIngressPacketDropMismatch_Alert | [deploy-vnetg_ingresspacketdropmismatch_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingresspacketdropmismatch_alert.json) | deployIfNotExists |
| Deploy_VnetGw_TunnelIngressPacketDropCount_Alert | [deploy-vnetg_ingresspacketdropcount_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingresspacketdropcount_alert.json) | deployIfNotExists |
| Deploy_ERCIR_BgpAvailability_Alert | [deploy-ercir_bgpavailability_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_bgpavailability_alert.json) | deployIfNotExists |
| Deploy_ERCIR_ArpAvailability_Alert | [deploy-ercir_arpavailability_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_arpavailability_alert.json) | deployIfNotExists |
| Deploy_AFW_SNATPortUtilization_Alert | [deploy-afw_snatportutilization_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_snatportutilization_alert.json) | deployIfNotExists |

## Management initiative

This initiative is intended for assignment of policies relevant to management components in ALZ. With the guidance provided in [How to consume the IP contained in this repo](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide), this will assign to the alz-platform-management group structure in the ALZ reference architecture. For details on which policies are included in the initiative as well as what the default enablement state of the policy is, please refer to the below table. 

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_activitylog_ResourceHealth_Unhealthy_Alert | [deploy-activitylog-ResourceHealth-UnHealthly-alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.json) | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_HealthAdvisory | [deploy-activitylog-ServiceHealth-Health.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Incident | [deploy-activitylog-ServiceHealth-Incident.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Maintenance | [deploy-activitylog-ServiceHealth-Maintenance.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.json)  | Row 2, Column 3 |
| Deploy_AA_TotalJob_Alert | [deploy-aa_totaljob_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.json) | deployIfNotExists |
| Deploy_RecoveryVault_BackupHealth_Alert | [deploy-rv_backuphealth_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-rv_backuphealth_alert.json)  | deployIfNotExists |
| Deploy_AFW_FirewallHealth_Alert | [deploy-afw_firewallhealth_alert](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.json)  | deployIfNotExists |
| Deploy_KeyVault_Availability_Alert | [deploy-kv_availability_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_availability_alert.json)  | disabled |
| Deploy_KeyVault_Latency_Alert | [deploy-kv_latency_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_latency_alert.json)  | disabled |
| Deploy_KeyVault_Capacity_Alert | [deploy-kv_capacity_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_capacity_alert.json)  | disabled |
| Deploy_StorageAccount_Availability_Alert | [deploy-sa_availability_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.json)  | deployIfNotExists |

## Identity initiative

This initiative is intended for assignment of policies relevant to identity components in ALZ. With the guidance provided in [How to consume the IP contained in this repo](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide), this will assign to the alz-platform-identity management group structure in the ALZ reference architecture. For details on which policies are included in the initiative as well as what the default enablement state of the policy is, please refer to the below table. 

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_PublicIp_BytesInDDoSAttack_Alert | [deploy-pip_bytesinddosattack_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_bytesinddosattack_alert.json) | disabled |
| Deploy_PublicIp_DDoSAttack_Alert | [deploy-pip_ddosattack_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_ddosattack_alert.json)  | deployIfNotExists |
| Deploy_PublicIp_PacketsInDDoSAttack_Alert | [deploy-pip_packetsinddos_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_packetsinddos_alert.json)  | disabled |
| Deploy_PublicIp_VIPAvailability_Alert | [deploy-pip_vipavailability_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_vipavailability_alert.json)  | deployIfNotExists |
| Deploy_KeyVault_Requests_Alert | [deploy-kv_requests_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_requests_alert.json) | disabled |
| Deploy_VNET_DDoSAttack_Alert | [deploy-vnet_ddosattack_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnet_ddosattack_alert.json)  | deployIfNotExists |
| Deploy_activitylog_Firewall_Delete | [deploy-activitylog-AzureFirewall-Del.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-AzureFirewall-Del.json)  | NA |
| Deploy_activitylog_KeyVault_Delete | [deploy-activitylog-KeyVault-Del.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-KeyVault-Del.json)  | Row 2, Column 3 |
| Deploy_activitylog_LAWorkspace_Delete | [deploy-activitylog-LAWorkspace-Del.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-LAWorkspace-Del.json)  | Row 2, Column 3 |
| Deploy_activitylog_LAWorkspace_KeyRegen | [deploy-activitylog-LAWorkspace-ReGen.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-LAWorkspace-ReGen.json)  | Row 2, Column 3 |
| Deploy_activitylog_NSG_Delete | [deploy-activitylog-NSG-Del.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-NSG-Del.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_SecurityAdvisory | [deploy-activitylog-ServiceHealth-Security.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Security.json)  | Row 2, Column 3 |
| Deploy_activitylog_VPNGateway_Delete | [deploy-activitylog-VPNGate-Del.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-VPNGate-Del.json)  | Row 2, Column 3 |
