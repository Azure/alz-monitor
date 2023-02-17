<!-- markdownlint-disable -->
# Customize Policy Assignment
<!-- markdownlint-restore -->

# Introduction

As described in the [Consumer Guide](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide), the policies and initiatives in this repo can be deployed in a default configuration, i.e. with default settings and are intended to be used as such. There may be however, scenarios where you would want to tweak the initiative assignment for individual policies to conform with your monitoring requirements, or potentially wish to deploy alerts in a more phased approach to a brownfield environment. This document lists some of the various scenarios as well as how you would go about making such changes to the assignments. 

## Modify initiative assignment

As an example you may want to change alert thresholds for one or more metric alerts when assigning initiatives. To do so the specific parameters can be either specified in a parameter file or on the command line. If we are assigning the connectivity initiative to a management group, the default command would look something like this:

### Azure CLI

```bash
  
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId

```

### Azure PowerShell

```powershell

   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -parPolicyManagementGroupId $managementGroupId

```

If we want to for instance change the threshold value for Virtual Network Gateway Express Route CPU utilization from 80 (default value) to 90, and Virtual Network Gateway Egress traffic from 1 to 1000 for instance, what we would do would be to include this in a parameter file as shown below. These specific thresholds would then be set in the individual policiy assignment, while remaining values for all other policies would remain at default. 

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

As an alternative to using parameters files, specifying the parameters on the command line could be used. Note though that this approach soon becomes difficult to maintain as the number of parameters increases, instead parameter file usage is recommended. See below for examples of such command lines, configuring the same settings as described above.

### Azure CLI

```bash
  
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId VnetGwERCpuUtilThreshold=90 VnetGwTunnelEgressThreshold=1000

```

### Azure PowerShell

```powershell

   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -parPolicyManagementGroupId $managementGroupId -VnetGwERCpuUtilThreshold 90 -VnetGwTunnelEgressThreshold 1000

```

The above approach can be leveraged with any of the different parameters in the initiatives. For each individual policy in the initiatives there are the following common parameters, that are referenced with unique names in the initiatives and can be modified correspondingly where required.

### Metric alert policy parameters

The following parameters can be changed for metric alert policies, in the initiatives these are prefixed with an appropriate string to indicate the metric in question.

| **Parameter Name** | **Parameter Description** |
|----------|----------|
| severity | 0 - 4 indicating alert severity |
| windowSize | Indicating the time windows inside which the alert is evaluating for true/false |
| evaluationFrequency | Indicating how often inside the time window evaluation takes place |
| effect | Can be either DeployIfNotExists or Disabled |
| autoMitigate | Indicates whether the the alert will auto-resolve if the alert condition is no longer true |
| threshold | Indicates a numerical threshold for when the alert would trigger. Not relevant to all alerts as some are configured with dynamic rather than fixed thresholds |
| enabled | Whether the alert is enabled or not |
### Activity log, Service health alert and action group policy parameters 

The following parameters can be changed for activity log, service health alert and action group policies.

| **Parameter Name** | **Parameter Description** |
|----------|----------|
| alertResourceGroupName | The name of the resource group to place the alerts in |
| alertResourcGroupTags | Any tags than needs to be added to the resource group created |

Note that the above parameters specifies the resource group that activity log alerts are placed in. If the resource group does not exist it gets created. Also the parameter for tags can take several tags, if multiple tags are needed. Tags are only applied at the resource group level.



## Big Red Button

Recognizing that it is not always possible to test alerts in a dev/test environment, we have introduced the parAlertstate parameter for all metric alerts. This is to address a scenario where   an alert storm occurs and it is necessary to disable one or more alerts deployed via policies through a controlled process. This could be considered for a roll-back process as part of a change request.
These are the high-level steps that would need to take place:
1. Change values for the parAlertState for the offending policies to disabled, either via command line or parameter file as described previously.
3. Deploy the policy assignments as described previously.
4. After deploying and policy evaluation there will be a number of non-compliant policies depending on which alerts were to be disabled. These will then need to be remediated which can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.
> Note that the above approach will not delete the alerts objects in Azure, merely disable them. To delete the alerts you will have to do so manually.
> Also note that while you can engage the parPolicyEffect to avoid deploying new alerts, you should not do so until you have successfully remediated the above. Otherwise the policy will be disabled, and you will not be able to turn alerts off via policy until that is changed back. 

