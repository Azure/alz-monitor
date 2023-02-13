# Azure Policy initiatives for monitoring

## Overview

This document details the ALZ-Monitor Azure policy initiatives leveraged for deploying the ALZ-Monitor baselines. For references on individual alerts/policies please refer to [Alert Details](https://github.com/Azure/alz-monitor/wiki/AlertsDetails).

## Connectivity initiative

This initiative is intended for assignment of policies relevant to networking components in ALZ. With the guidance provided in [How to consume the IP contained in this repo](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide), this will assign to the alz-platform-connectivity management group structure in the ALZ reference architecture. For details on which policies are included in the initiative as well as what the default enablement state of the policy is, please refer to the below table. 

| **Policy Name** | **Path to policy json file** | **Policy default effect** |
|----------|----------|----------|
| Deploy_AFW_FirewallHealth_Alert | [deploy-afw_firewallhealth_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.json) | deployIfNotExists |
| Deploy_activitylog_ResourceHealth_Unhealthy_Alert | [deploy-afw_firewallhealth_alert.json]() | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_HealthAdvisory | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Incident | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_activitylog_ServiceHealth_Maintenance | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_AA_TotalJob_Alert | [deploy-aa_totaljob_alert.json](https://github.com/Azure/alz-monitor/blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.json) | Row 2, Column 3 |
| Deploy_RecoveryVault_BackupHealth_Alert | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_AFW_FirewallHealth_Alert | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_KeyVault_Availability_Alert | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_KeyVault_Latency_Alert | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_KeyVault_Capacity_Alert | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |
| Deploy_StorageAccount_Availability_Alert | [deploy-afw_firewallhealth_alert.json]()  | Row 2, Column 3 |

## Management initiative

Kaustubh to fill in

## Identity initiative

Kaustubh to fill in
