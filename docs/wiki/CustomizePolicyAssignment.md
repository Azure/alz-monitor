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

### Metric alert policies

- parAlertSeverity, indicating alert severity
- parWindowSize, indicating the time windows inside which the alert is evaluating for true/false
- parEvaluationFrequency, indicating how often inside the time window evaluation takes place
- parPolicyEffect, can be either DeployIfNotExists or Disabled
- parAutoMitigate, indicates whether the the alert will auto-resolve if the alert condition is no longer true
- parThreshold, indicates a numerical threshold for when the alert would trigger. Not relevant to all alerts as some are configured with dynamic rather than fixed thresholds
- parAlertState, whether the alert is enabled or not.

### Activity log, Service health alert and action group policies

- parResourceGroupName, the namee of the resource group to place the alerts in
- parResourcGroupTags, any tags than needs to be added to the resource group created

## Big Red Button

A special use case for modifying initiative parameters when assigning would be a situation where it is determined that alerts are running amok and that it is necessary to turn off alerting for one or more policies. In that case the following approach should be followed.
1. Change values for the parAlertState for the offending policies to disabled, fixme waiting on https://dev.azure.com/csusoleng/Azure%20Landing%20Zones/_workitems/edit/26227, either via command line or parameter file as described previously.
2. Change values for parPolicyEffect for the offending policies to disabled, if you wish to avoid deploying more alerts for this particular metric
3. Deploy the policy assignments as described previously
4. After deploying and policy evaluation there will be a number of non-compliant policies depending on which alerts were to be disabled. These will then need to be remediated which can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.


