<!-- markdownlint-disable -->
# Customize Policy Assignment
<!-- markdownlint-restore -->

# Introduction

As described in ./ConsumerGuide.md, the policies and initiatives in this repo can be deployed in a vanilla configuration, i.e. with default settings and are intended to be used as such. There may be however, scenarios where you would want to tweak the initiative assignment a bit for individual policies to conform with your monitoring requirements. This document lists some of the various scenarios as well as how you would go about making such changes to the assignments. 

## Modify initiative assignment

To for example change alert thresholds for one or more metric alerts when assigning initiatives the specific parameters can be either specified on the command line or in a parameter file. If we are assigning the connectivity initiative to a management group, the default command would look something like this:

### Azure CLI

```bash
  
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId

```

### Azure PowerShell

```powershell

   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -parPolicyManagementGroupId $managementGroupId

```

If we want to for instance change the threshold value for Virtual Network Gateway Express Route CPU utilization from 80 (default value) to 90, and Virtual Network Gateway Egress traffic from 1 to 1000 for instance, what we would do would be to include this in the command line as shown below. These specific thresholds would then be set in the individual policiy assignment, while remaining values for all other policies would remain at default. 

### Azure CLI

```bash
  
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId VnetGwERCpuUtilThreshold=90 VnetGwTunnelEgressThreshold=1000

```

### Azure PowerShell

```powershell

   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -parPolicyManagementGroupId $managementGroupId -VnetGwERCpuUtilThreshold 90 -VnetGwTunnelEgressThreshold 1000

```

### Parameter files

As an alternative to specifying parameters on the command line, parameter files could be used. This would be particularly relevant if a large number of parameters needs to be set. See below for an example of such a parameter file, configuring the same settings as described above.

```json

{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "parPolicyManagementGroupId": {
           "value": "alz"
        },
        "VnetGwERCpuUtilThreshold": {
            "value": 90
        },
        "VnetGwTunnelEgressThreshold": {
            "value": 1000
        }
    }
}

```
The associated command line to assign the initiative would then look like this:

### Azure CLI

```bash

  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters <path to parameter file>

```

### Azure PowerShell

```powershell

   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep - TemplateParameterFile <path to parameter file>

```

The above approach can be leveraged with any of the different parameters in the initiatives. For each individual policy in the initiatives there are the following common parameters, that are referenced with unique names in the initiatives and can be modified correspondingly where required.
> Note that as a general rule it is recommended to leverage parameter files over parameters specified on command line, as it is arguably easier to manage multiple parameters in a parameter file rather than on a command line.

### Metric alert policy parameters

The following parameters can be changed for metric alert policies

| **Parameter Name** | **Parameter Description** |
|----------|----------|
| parAlertSeverity | 0 - 4 indicating alert severity |
| parWindowSize | Indicating the time windows inside which the alert is evaluating for true/false |
| parEvaluationFrequency | Indicating how often inside the time window evaluation takes place |
| parPolicyEffect | Can be either DeployIfNotExists or Disabled |
| parAutoMitigate | Indicates whether the the alert will auto-resolve if the alert condition is no longer true |
| parThreshold | Indicates a numerical threshold for when the alert would trigger. Not relevant to all alerts as some are configured with dynamic rather than fixed thresholds |
| parAlertState | Whether the alert is enabled or not |
### Activity log, Service health alert and action group policy parameters 

The following parameters can be changed for activity log, service health alert and action group policies.

| **Parameter Name** | **Parameter Description** |
|----------|----------|
| parResourceGroupName | The name of the resource group to place the alerts in |
| parResourcGroupTags | Any tags than needs to be added to the resource group created |

## Big Red Button

Recognizing that it is not always possible to test alerts in a dev/test environment, we have introduced the parAlertstate parameter for all metric alerts. This is to address a scenario where   an alert storm occurs and it is necessary to disable one or more alerts deployed via policies through a controlled process. This could be considered for a roll-back process as part of a change request.
These are the high-level steps that would need to take place:
1. Change values for the parAlertState for the offending policies to disabled, fixme waiting on https://dev.azure.com/csusoleng/Azure%20Landing%20Zones/_workitems/edit/26227, either via command line or parameter file as described previously.
3. Deploy the policy assignments as described previously
4. After deploying and policy evaluation there will be a number of non-compliant policies depending on which alerts were to be disabled. These will then need to be remediated which can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.
> Note that the above approach will not delete the alerts objects in Azure, merely disable them. To delete the alerts you will have to do so manually.
> Also note that while you can engage the parPolicyEffect to avoid deploying new alerts, you should not do so until you have successfully remediated the above. Otherwise the policy will be disabled, and you will not be able to turn alerts off via policy until that is changed back. 

