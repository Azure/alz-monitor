# Azure Policy initiatives for monitoring

## Overview

This document details the ALZ-Monitor Azure policy initiatives leveraged for deploying the ALZ-Monitor baselines. For references on individual alerts/policies please refer to [Alert Details](https://github.com/Azure/alz-monitor/wiki/AlertsDetails).

## Connectivity initiative

This initiative is intended for assignment of policies relevant to networking components in ALZ. With the guidance provided in [How to consume the IP contained in this repo](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide), this will assign to the alz-platform-connectivity management group structure in the ALZ reference architecture. For details on which policies are included in the initiative as well as what the default enablement state of the policy is, please refer to the below table. 

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_activitylog_ResourceHealth_Unhealthy_Alert | [deploy-activitylog-ResourceHealth-UnHealthly-alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.json) | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_HealthAdvisory | [deploy-activitylog-ServiceHealth-Health.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Incident | [deploy-activitylog-ServiceHealth-Incident.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Maintenance | [deploy-activitylog-ServiceHealth-Maintenance.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.json)  | Row 2, Column 3 |
| Deploy_AA_TotalJob_Alert | [deploy-aa_totaljob_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.json) | deployIfNotExists |
| Deploy_RecoveryVault_BackupHealth_Alert | [deploy-rv_backuphealth_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-rv_backuphealth_alert.json)  | deployIfNotExists |
| Deploy_AFW_FirewallHealth_Alert | [deploy-afw_firewallhealth_alert](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.json)  | deployIfNotExists |
| Deploy_KeyVault_Availability_Alert | [deploy-kv_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_availability_alert.json)  | Row 2, Column 3 |
| Deploy_KeyVault_Latency_Alert | [deploy-kv_latency_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_latency_alert.json)  | Row 2, Column 3 |
| Deploy_KeyVault_Capacity_Alert | [deploy-kv_capacity_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_capacity_alert.json)  | Row 2, Column 3 |
| Deploy_StorageAccount_Availability_Alert | [deploy-sa_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.json)  | Row 2, Column 3 |

## Management initiative

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_activitylog_ResourceHealth_Unhealthy_Alert | [deploy-activitylog-ResourceHealth-UnHealthly-alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.json) | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_HealthAdvisory | [deploy-activitylog-ServiceHealth-Health.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Incident | [deploy-activitylog-ServiceHealth-Incident.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Maintenance | [deploy-activitylog-ServiceHealth-Maintenance.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.json)  | Row 2, Column 3 |
| Deploy_AA_TotalJob_Alert | [deploy-aa_totaljob_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.json) | deployIfNotExists |
| Deploy_RecoveryVault_BackupHealth_Alert | [deploy-rv_backuphealth_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-rv_backuphealth_alert.json)  | deployIfNotExists |
| Deploy_AFW_FirewallHealth_Alert | [deploy-afw_firewallhealth_alert](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.json)  | deployIfNotExists |
| Deploy_KeyVault_Availability_Alert | [deploy-kv_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_availability_alert.json)  | Row 2, Column 3 |
| Deploy_KeyVault_Latency_Alert | [deploy-kv_latency_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_latency_alert.json)  | Row 2, Column 3 |
| Deploy_KeyVault_Capacity_Alert | [deploy-kv_capacity_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_capacity_alert.json)  | Row 2, Column 3 |
| Deploy_StorageAccount_Availability_Alert | [deploy-sa_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.json)  | Row 2, Column 3 |

## Identity initiative

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_PublicIp_BytesInDDoSAttack_Alert | [deploy-activitylog-ResourceHealth-UnHealthly-alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.json) | Row 2, Column 3 |
| Deploy_PublicIp_DDoSAttack_Alert | [deploy-activitylog-ServiceHealth-Health.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.json)  | Row 2, Column 3 |
| Deploy_PublicIp_PacketsInDDoSAttack_Alert | [deploy-activitylog-ServiceHealth-Incident.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.json)  | Row 2, Column 3 |
| Deploy_PublicIp_VIPAvailability_Alert | [deploy-activitylog-ServiceHealth-Maintenance.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.json)  | Row 2, Column 3 |
| Deploy_KeyVault_Requests_Alert | [deploy-aa_totaljob_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.json) | deployIfNotExists |
| Deploy_VNET_DDoSAttack_Alert | [deploy-rv_backuphealth_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-rv_backuphealth_alert.json)  | deployIfNotExists |
| Deploy_activitylog_Firewall_Delete | [deploy-afw_firewallhealth_alert](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.json)  | deployIfNotExists |
| Deploy_activitylog_KeyVault_Delete | [deploy-kv_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_availability_alert.json)  | Row 2, Column 3 |
| Deploy_activitylog_LAWorkspace_Delete | [deploy-kv_latency_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_latency_alert.json)  | Row 2, Column 3 |
| Deploy_activitylog_LAWorkspace_KeyRegen | [deploy-kv_capacity_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_capacity_alert.json)  | Row 2, Column 3 |
| Deploy_activitylog_NSG_Delete | [deploy-sa_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.json)  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_SecurityAdvisory | [deploy-sa_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.json)  | Row 2, Column 3 |
| Deploy_activitylog_VPNGateway_Delete | [deploy-sa_availability_alert.json](https://github.com/Azure/alz-monitor/blob/e73e6cac5a3daa8c03dfe32a05d5c764e91a84fc/src/resources/Microsoft.Authorization/policyDefinitions/deploy-sa_availability_alert.json)  | Row 2, Column 3 |
