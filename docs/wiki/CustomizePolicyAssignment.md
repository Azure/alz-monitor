<!-- markdownlint-disable -->
# Customize Policy Assignment
<!-- markdownlint-restore -->

# Introduction

As described in the [Deployment Guide](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide), the policies and initiatives in this repo can be deployed in a default configuration, i.e. with default settings and are intended to be used as such. There may be however, scenarios where you would want to tweak the initiative assignment for individual policies to conform with your monitoring requirements, or potentially wish to deploy alerts in a more phased approach to a brownfield environment. This document lists some of the various scenarios as well as how you would go about making such changes to the assignments. 

## Modify initiative assignment

As an example you may want to change alert thresholds for one or more metric alerts when assigning initiatives. To do so the specific parameters can be specified in a parameter file. For convenience four parameters files, one for each of the initiatives, containing all the parameters that can be set for each individual alert rule as well as for the alert processing rule policy has been included. Note that you are advised to leverage these as templates for creating your own parameter files as the parameters in these files may change over time, which could potentially have undesirable effects on your alert configurations.

### Parameters files

- [parameters-complete-connectivity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-connectivity.json)
- [parameters-complete-identity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-identity.json)
- [parameters-complete-landingzones.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-landingzones.json)
- [parameters-complete-management.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-management.json)

### Example new parameters file

If we want to change the threshold value for Virtual Network Gateway Express Route CPU utilization from 80 (default value) to 90, and Virtual Network Gateway Egress traffic from 1 to 1000, what we would do is include this in a parameter file as shown below. These specific thresholds would then be set in the individual policy assignment, while the remaining values for all other policies would remain at default. 

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "parPolicyManagementGroupId": {
            "value": "alz"
        },
        "parPolicyAssignmentParameters": {
            "value": {
                "ALZMonitorResourceGroupName": {
                    "value": "rg-alz-monitor"
                },
                "ALZMonitorResourceGroupTags": {
                    "value": {
                        "Project": "alz-monitor"
                    }
                },
                "ALZMonitorResourceGroupLocation": {
                    "value": "eastus"
                }
            }
        },
        "parPolicAssignmentParametersAlertProcessing": {
            "value": {
                "ALZMonitorActionGroupEmail": {
                    "value": "action@mail.com"
                }
            }
        },
        "parPolicyAssignmentParametersConnectivity": {
            "value": {
                "VnetGwERCpuUtilThreshold": {
                    "value": "90"
                },
                "VnetGwTunnelEgressThreshold": {
                    "value": "1000"
                }
            }
        }
    }
}
```

The associated command line to assign the initiative would then look like this:

#### Azure CLI

```bash
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters  <path to parameter file>
```

#### Azure PowerShell

```powershell
   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -TemplateParameterFile <path to parameter file>
```

### Example using the complete parameters files

You can make the same changes by using the complete parameter files. Continuing with the same example, if we want to change the threshold value for Virtual Network Gateway Express Route CPU utilization from 80 (default value) to 90, and Virtual Network Gateway Egress traffic from 1 to 1000, we can modify [parameters-complete-connectivity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-connectivity.json). These specific thresholds would then be set in the individual policy assignment. 

> The complete parameters files have set the same default values. However, be aware that the _Policy assignment parameter reference type​_ will change for all parameters, even when a value of a parameter wasn't modified it will appear as a _User defined parameter_ since it was explicitly defined in the parameter file.

The associated command line to assign the initiative would then look like this:

#### Azure CLI

```bash
    deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters ./infra-as-code/bicep/parameters.json
```

#### Azure PowerShell

```powershell
   New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters.json
```

### Assigning all initiatives with the complete parameter files

The associated command lines to assign all initiatives would then look like this:

#### Azure CLI

```bash
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_identity.bicep --location $location --management-group-id $identityManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-identity.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_management.bicep --location $location --management-group-id $managementManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-management.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-connectivity.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_landingzones.bicep --location $location --management-group-id $LZManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-landingzones.json
```

#### Azure PowerShell

```powershell
  New-AzManagementGroupDeployment -ManagementGroupId $identityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_identity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-identity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_management.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-management.json
  New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-connectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $LZManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_landingzones.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-landingzones.json
```


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
| ALZMonitorResourceGroupName | The name of the resource group to place the alerts in |
| ALZMonitorResourceGroupTags | Any tags than needs to be added to the resource group created |
| ALZMonitorResourceGroupLocation | The location of the resource group to place the alerts in |

Note that the above parameters specifies the resource group that activity log alerts are placed in. If the resource group does not exist it gets created. Also the parameter for tags can take several tags, if multiple tags are needed. Tags are only applied at the resource group level. The tags parameter is set to a default value of one tag with the name *environment* and the value *test*, you can add more tags as already mentioned or set it to be an empty value.



## Big Red Button

Recognizing that it is not always possible to test alerts in a dev/test environment, we have introduced the parAlertstate parameter for all metric alerts. This is to address a scenario where   an alert storm occurs and it is necessary to disable one or more alerts deployed via policies through a controlled process. This could be considered for a roll-back process as part of a change request.
These are the high-level steps that would need to take place:
1. Change values for the parAlertState for the offending policies to disabled, either via command line or parameter file as described previously.
3. Deploy the policy assignments as described previously.
4. After deploying and policy evaluation there will be a number of non-compliant policies depending on which alerts were to be disabled. These will then need to be remediated which can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.
> Note that the above approach will not delete the alerts objects in Azure, merely disable them. To delete the alerts you will have to do so manually.
> Also note that while you can engage the parPolicyEffect to avoid deploying new alerts, you should not do so until you have successfully remediated the above. Otherwise the policy will be disabled, and you will not be able to turn alerts off via policy until that is changed back. 

