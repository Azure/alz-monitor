# Deployment Guide

## Background

This guide describes how to get started with implementing alert policies and initiatives in your environment for testing and validation. In the guide it is assumed that you will be using GitHub actions or manual deployment to implement policies, initiatives and policy assignments in your environment. 

> Note that this is a preview solution intended to solicitate feedback for further development which should be tested in a safe environment before deploying to production to protect against possible failures/unnecessary cost. 
> Also note that this private repo is shared with different select Microsoft customers and partners, as such you should never upload or otherwise divulge sensititve information to this repo. If there is any concern, please contact your Microsoft counterparts for detailed advice.

The repo at present contains code and details for the following:


- Policies to automatically create alerts, action groups and alert processing rules for different Azure resource types, centered around a recommended Azure Monitor Baseline for Alerting in a customers´ newly created or existing brownfield ALZ deployment.
- Initiatives grouping said policies into appropriate buckets for ease of policy assignment in alignment with ALZ Platform structure (Networking, Identity and Management).

Alerts, action groups and alert processing rules are created as follows:


1. All metric alerts are created in the resource group where the resource that is being monitored exists. i.e. creating an ER circuit in a resource group covered by the policies will create the corresponding alerts in that same resource group.
2. Activity log alerts are created in a specific resource group (created specifically by and used for this solution) in each subscription, when the subscription is deployed. The resource group name is parameterized, with a default value of AlzMonitoring-rg.
3. Resource health alerts are created in a specific resource group (created specifically by and used for this solution) in each subscription, when the subscription is deployed. The resource group name is parameterized, with a default value of AlzMonitoring-rg.
4. Action groups and alert processing rules are created in a specific resource group (created specifically by and used for this solution) in each subscription, when the subscription is deployed. The resource group name is parameterized, with a default value of AlzMonitoring-rg.

## Prerequisites


1. Azure Active Directory Tenant.
2. ALZ Management group hierarchy deployed as described [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-areas).
3. Minimum 1 subscription, for when deploying alerts through policies. 
4. Deployment Identity with `Owner` permission to the pseudo root management group.  Owner permission is required to allow the Service Principal Account to create role-based access control assignments. 
5. If deploying manually, i.e. via Azure CLI or PowerShell, ensure that you have [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep) installed and working, before attempting installation. See here for how to configure for [Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-cli) and here for [PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-powershell)
6. For the policies to work, the following Azure resource providers, normally registered by default, must be registered on all subscriptions in scope:
    - Microsoft.AlertsManagement
    - Microsoft.Insights

Please see [here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider) for details on how to register a resource provider should you need to do so.

## Getting started

- Fork this repo to your own GitHub organization, you should not create a direct clone of the repo. Pull requests based off direct clones of the repo will not be allowed.
- Clone the repo from your own GitHub organization to your developer workstation. 

### Deploy through GitHub Actions (Complete) - Default settings

To deploy through GitHub actions which is the preferred approach, please refer to the sample GitHub workflow in the repo under .github/workflows/sample-workflow.yml. To leverage this directly do the following:

- Configure your OpenID Connect as described [here](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Cwindows#use-the-azure-login-action-with-openid-connect).
- Modify the following values in sample-workflow.yml:
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the management group where you wish to deploy the policies, initiatives and policy assignments.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the management group for identity in your ALZ implementation.
  - Change _managementManagementGroup: "alz-platform-management"_, to the management group for management in your ALZ implementation.
  - Change _ManagementGroupPrefix: "alz-platform-connectivity"_, to the management group for connectivity in your ALZ implementation.
- Go to GitHub actions and run the action _Deploy ALZ Monitor policies_

### Manual (Complete) deployment - default settings

- Using either a PowerShell prompt or Azure CLI, navigate to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

#### 1. For a standard deployment we recommend configuring the following parameters:
  - Change the value of _parPolicyManagementGroupId_ to the management group where you wish to deploy the policies, initiatives and policy assignments.
  - Change the value of _ALZMonitorResourceGroupName_ to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules are placed in.
  - Change the value of _ALZMonitorResourceGroupTags_ to specify the tags to be added to said resource group.
  - Change the value of _ALZMonitorResourceGroupLocation_ to specify the location for said resource group.
  - Change the value of _ALZMonitorActionGroupEmail_ to the email address where notifications of the alerts are sent to.

These changes have to made in each of the following parameters files:

  - [parameters-complete-connectivity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-connectivity.json)
  - [parameters-complete-identity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-identity.json)
  - [parameters-complete-landingzones.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-landingzones.json)
  - [parameters-complete-management.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-management.json)


#### 2. Example Parameter file:

Note that the parameter file shown below has been truncated for brevity, compared to the samples included.

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "parPolicyManagementGroupId": {
            "value": "Contoso"
        },
        "parPolicyAssignmentParameters": {
            "value": {
                "ALZMonitorResourceGroupName": {
                    "value": "rg-alz-monitor"
                },
                "ALZMonitorResourceGroupTags": {
                    "value": {
                        "Environment": "Production",
                        "Project": "ALZ Monitor"
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
                    "value": "alzmonitor@contoso.com"
                }
            }
        }
    }
}
```

#### 3. Deploy the policy definitions, initiatives and policy assignments with default settings. 

> There can be some delay between policies getting created and actually being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> As mentioned previously this should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment), to deploy and enable alerts in a controlled manner.

##### Azure CLI

```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id parenting the identity, management and connectivity management groups"
  identityManagementGroup="The management group id for Identity"
  managementManagementGroup="The management group id for Management"
  connectivityManagementGroup="The management group id for Connectivity"
  LZManagementGroup="The management group id for Landing Zones"

  #Deploy policy definitions
  az deployment mg create --template-file infra-as-code/bicep/deploy_dine_policies.bicep --location $location --management-group-id $managementGroupId
  
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorLandingZone.json --location $location --management-group-id $managementGroupId
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_identity.bicep --location $location --management-group-id $identityManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-identity.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_management.bicep --location $location --management-group-id $managementManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-management.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-connectivity.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_landingzones.bicep --location $location --management-group-id $LZManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-landingzones.json
```

##### Azure PowerShell

```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity"
  $managementManagementGroup = "The management group id for Management"
  $connectivityManagementGroup = "The management group id for Connectivity"
  $LZManagementGroup="The management group id for Landing Zones"

  #Deploy policy definitions
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./infra-as-code/bicep/deploy_dine_policies.bicep
  
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorLandingZone.json
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  New-AzManagementGroupDeployment -ManagementGroupId $identityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_identity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-identity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_management.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-management.json
  New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-connectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $LZManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_landingzones.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-landingzones.json
```

## Policy remediation

The policies are all deploy-if-not-exists, by default, meaning that any new deployments will be influenced by them. Therefore if you are deploying in a greenfield scenario and will afterwards be deploying any of the covered resource types, including subscriptions, then the policies will take effect and the relevant alert rules, action groups and alert processing rules will be created.
If you are in a brown-field scenario on the other hand, policies will be reporting non-compliance for resources in scope, but to remediate non-compliant resources you will need to initiate remediation. This can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix. To use the script do the following:

- Log on to Azure PowerShell with an account with at least Resource Policy Contributor permissions at the pseudo-root management group level
- Navigate to the root of the cloned repo
- To remediate for example the Alerting-Management initiative, assigned to the alz-platform-management Management Group run the following command: .github\script\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-management -policyName Alerting-Management.
- The script will return the output from the rest api calls which should be a status code 201. If the script fails, check the error message and ensure that the management group name and policy name are correct.
- After running the script you should be able to see a number of remediation tasks initiated at the alz-platform-management.
For convenience, assuming that the management hierarchy is fully aligned to ALZ, below are the commands required to remediate all policies assigned through the guidance provided in this repo:

```powershell
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-management -policyName Alerting-Management
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-connectivity -policyName Alerting-Connectivity
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-identity -policyName Alerting-Identity
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-landingzones -policyName Alerting-LandingZones
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-management -policyName Deploy_AlertProcessing_Rule
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-connectivity -policyName Deploy_AlertProcessing_Rule
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-identity -policyName Deploy_AlertProcessing_Rule
.github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-landingzones -policyName Deploy_AlertProcessing_Rule
```

## Customizing policy assignments

As mentioned previously the above guidance will deploy policies, alerts and action groups with default settings. For details on how to customize policy and in particular initiative assignments please refer to [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment)

## Customizing the `ALZ-Monitor` policies

Whatever way you may choose to consume the policies we do expect, and want, customers and partners to customize the policies to suit their needs and requirements for their design in their local copies of the policies.

For example, if you want to include more thresholds, metrics, activity log alerts or similar, outside of what the parameters allow you to change and customize, then by opening up the individual policy or initiative definitions you should be able to read, understand and customize the required lines to meet your requirements easily.

This customized policy can then be deployed into your environment to deliver the desired functionality.

## Disabling Monitoring

If you wish to disable monitoring for a resource or for alerts targeted at subscription level such as Activity Log, Service Health and Resource Health.  A "MonitorDisable" tag can be created with a value of "true" at the scope where you wish to disable monitor.  This will effectively filter the resource or subscription from the compliance check for the policy.

<!-- markdownlint-disable -->
> **IMPORTANT:** If you believe the changes you have made should be more easily available to be customized by a parameter etc. in the policies, then please raise an [issue](https://github.com/Azure/ALZ-Monitor/issues) for a 'Feature Request' on the repository 
> 
> If you wish to, also feel free to submit a pull request relating to the issue which we can review and work with you to potentially implement the suggestion/feature request 
<!-- markdownlint-restore -->
