# Deployment Guide

## Background

This guide describes how to get started with implementing alert policies and initiatives in your environment for testing and validation. In the guide it is assumed that you will be using GitHub actions or manual deployment to implement policies, initiatives and policy assignments in your environment. 

> Note that this is a preview solution intended to solicitate feedback for further development which should be tested in a safe environment before deploying to production to protect against possible failures/unnecessary cost. 
> Also note that this private repo is shared with different select Microsoft customers and partners, as such you should never upload or otherwise divulge sensitive information to this repo. If there is any concern, please contact your Microsoft counterparts for detailed advice.

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
2. ALZ Management group hierarchy deployed as described [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-areas).*
3. Minimum 1 subscription, for when deploying alerts through policies. 
4. Deployment Identity with `Owner` permission to the pseudo root management group.  Owner permission is required to allow the Service Principal Account to create role-based access control assignments. 
5. If deploying manually, i.e. via Azure CLI or PowerShell, ensure that you have [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep) installed and working, before attempting installation. See here for how to configure for [Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-cli) and here for [PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-powershell)
6. For the policies to work, the following Azure resource providers, normally registered by default, must be registered on all subscriptions in scope:
    - Microsoft.AlertsManagement
    - Microsoft.Insights

Please see [here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider) for details on how to register a resource provider should you need to do so.

_*While it´s recommended to implement the alert policies and initiatives to an ALZ Management Group hierarchy, it is not a technical requirement. These policies and initiatives can be implemented in existing brownfield scenarios that don´t adhere to the ALZ Management Group hierarchy. For example, in hierarchies where there is a single management group, or where the structure does not align to ALZ. At least one management group is required. In case you haven't implemented management groups, we included guidance on how to get started._

## Getting started

- Fork this repo to your own GitHub organization, you should not create a direct clone of the repo. Pull requests based off direct clones of the repo will not be allowed.
- Clone the repo from your own GitHub organization to your developer workstation.
- Review your current configuration to determine what scenario applies to you. We have guidance that will help deploy these policies and initiatives whether you are aligned with Azure Landing Zones, or use other management group hierarchy, or you may not be using management groups at all. If you know your type of management group hierarchy, you can skip forward to your preferred deployment method:
  - [Automated deployment with GitHub Actions](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Automated-deployment-with-GitHub-Actions) (recommended method)
  - [Manual deployment with Azure CLI or PowerShell](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Manual-deployment-with-Azure-CLI-or-PowerShell)

### Determining your management group hierarchy

Azure Landing Zones is a concept that provides a set of best practices, patterns, and tools for creating a cloud environment that is secure, Well-Architected, and easy to manage. Management groups are a key component of Azure Landing Zones, as they allow you to organize and manage your subscriptions and resources in a hierarchical structure. By using management groups, you can apply policies and access controls across multiple subscriptions and resources, making it easier to manage and govern your Azure environment.

The initiatives provided in this repository align with the management group hierarchy guidelines of Azure Landing Zones. Effectively creating the following assignment mapping between the initiative and the management group:

* Identity Initiative is assigned to the Identity management group.
* Management Initiative is assigned to the Management management group.
* Connectivity Initiative is assigned to the Connectivity management group.
* Landing Zone Initiative is assigned to the Landing Zone management group.
* Service Health Initiative is assigned to the intermediate (ALZ) root management group.

The image below is an example of how a management group hierarchy looks like when you follow Azure Landing Zone guidance. Also illustrated in this image is the default recommended assignments of the initiatives.

![ALZ Management group structure](../raw/main/media/alz-management-groups.png)

If you have this management group hierarchy, you can skip forward to your preferred deployment method: [Automated deployment with GitHub Actions](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Automated-deployment-with-GitHub-Actions) or [Manual deployment with Azure CLI or PowerShell](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Manual-deployment-with-Azure-CLI-or-PowerShell)

It´s important to understand why we assign initiatives to certain management groups. In the previous example, the assignment mapping was done this way because the associated resources within a subscription below a management group have a specific purpose. For example, below the Connectivity management group you will find a subscription that contains the networking components like Firewalls, Virtual WAN, Hub Networks, etc. Consequently, this is where we assign the connectivity initiative to get relevant alerting on those services. It wouldn't make sense to assign the connectivity initiative to other management groups when there are no relevant networking services deployed.

We recognize that Azure allows for flexibility and choice, and you may not be aligned with ALZ. For example, you may have:

* A management group structure that is not aligned to ALZ. Where you may only have a Platform management group without the sub management groups like Identity/ Management/ Connectivity. 
* No management group structure.

> **NOTE:** If you are looking to align your Azure environment to Azure landing zone, please see [Transition existing Azure environments to the Azure landing zone conceptual architecture](http://aka.ms/alz/brownfield).

Suppose Identity/ Management/ Connectivity are combined in one Platform Management Group, the approach could be to assign the three corresponding initiatives to the Platform management group instead. Maybe you have a hierarchy where you organize by geography and/or business units instead of specific landing zones. Assignment mapping:

* Identity Initiative is assigned to the Platform management group.
* Management Initiative is assigned to the Platform management group.
* Connectivity Initiative is assigned to the Platform management group.
* Landing Zone Initiative is assigned to the Geography management group.
* Service Health Initiative is assigned to the top-most level(s) in your management group hierarchy.

The image below is an example of how the assignments could look like when the management group hierarchy isn´t aligned with ALZ.

![Management group structure - unaligned](../raw/main/media/alz-management-groups-unaligned.png)

We recommend that you review the [initiative definitions](https://github.com/Azure/alz-monitor/tree/main/src/resources/Microsoft.Authorization/policySetDefinitions) to determine where best to apply the initiatives in your management group hierarchy.

If you have this management group hierarchy, you can skip forward to your preferred deployment method: [Automated deployment with GitHub Actions](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Automated-deployment-with-GitHub-Actions) or [Manual deployment with Azure CLI or PowerShell](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Manual-deployment-with-Azure-CLI-or-PowerShell)

If management groups were never configured in your environment, there are some additional steps that need to be implemented. To be able to deploy the policies and initiatives through the guidance and code we provide you need to create at least one management group, and by doing so the tenant root management group is created automatically. We strongly recommend following the [Azure Landing Zones guidance](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups) on management group design. 

Please refer to our [documentation](https://learn.microsoft.com/en-us/azure/governance/management-groups/create-management-group-portal ) on how to create management groups. 

If you implemented the recommended management group design, you can forward to your preferred deployment method: [Automated deployment with GitHub Actions](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Automated-deployment-with-GitHub-Actions) or [Manual deployment with Azure CLI or PowerShell](https://github.com/Azure/alz-monitor/wiki/DeploymentGuide#Manual-deployment-with-Azure-CLI-or-PowerShell) following the ALZ aligned guidance. 

If you implemented a single management group, we recommend to move your production subscriptions into that management group, consult the steps in the [documentation](https://learn.microsoft.com/en-us/azure/governance/management-groups/manage#add-an-existing-subscription-to-a-management-group-in-the-portal) for guidance to add the subscriptions.
> To prevent unnecessary alerts, we recommend keeping development, sandbox, and other non-production subscriptions either in a different management group or below the tenant root group.

The image below is an example of how the assignments look like when you are using a single management group.

![Management group structure - single](../raw/main/media/alz-management-groups-single.png)

## Automated deployment with GitHub Actions

### 1. We recommend configuring the following parameters:

- Change the value of _parPolicyManagementGroupId_ to the management group where you wish to deploy the policies, initiatives and policy assignments. This is usually the pseudo root management group.
- Change the value of _ALZMonitorResourceGroupName_ to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules are placed in.
- Change the value of _ALZMonitorResourceGroupTags_ to specify the tags to be added to said resource group.
- Change the value of _ALZMonitorResourceGroupLocation_ to specify the location for said resource group.
- Change the value of _ALZMonitorActionGroupEmail_ (specific to the Service Health initiative) to the email address where notifications of the alerts are sent to.

These changes have to be made in each of the following parameters files:

- [parameters-complete-connectivity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-connectivity.json)
- [parameters-complete-identity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-identity.json)
- [parameters-complete-landingzones.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-landingzones.json)
- [parameters-complete-management.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-management.json)
- [parameters-complete-servicehealth.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-servicehealth.json)

### 2. Example Parameter file:

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
,        "parPolicyAssignmentParametersServiceHealth": {
            "value": {
                "ALZMonitorActionGroupEmail": {
                    "value": "action@mail.com"
                }
            }
        }
    }
}
```
### 3. Configure and run the workflow
First, configure your OpenID Connect as described [here](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Cwindows#use-the-azure-login-action-with-openid-connect).

To deploy through GitHub actions, please refer to the [sample GitHub workflow](https://github.com/Azure/alz-monitor/blob/main/.github/workflows/sample-workflow.yml) and follow the guidance corresponding to your management group hierarchy.

#### ALZ aligned

- Modify the following values in [sample-workflow.yml](https://github.com/Azure/alz-monitor/blob/main/.github/workflows/sample-workflow.yml):
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the pseudo root management group id parenting the identity, management and connectivity management groups.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the management group for identity in your ALZ implementation.
  - Change _managementManagementGroup: "alz-platform-management"_, to the management group for management in your ALZ implementation.
  - Change _connectivityManagementGroupPrefix: "alz-platform-connectivity"_, to the management group for connectivity in your ALZ implementation.
  - Change _LZGroupPrefix: "alz-landing-zone"_, to the management group for Landing Zones in your ALZ implementation.
- Go to GitHub actions and run the action *Deploy ALZ Monitor policies*

#### ALZ unaligned
> For ease of deployment and maintenance we have kept the same variables. If, for example, you combined Identity, Management and Connectivity into one management group you should configure the variables _identityManagementGroup_, _managementManagementGroup_ and _connectivityManagementGroup_ with the same management group.

- Modify the following values in [sample-workflow.yml](https://github.com/Azure/alz-monitor/blob/main/.github/workflows/sample-workflow.yml):
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the pseudo root management group parenting the identity, management and connectivity management groups.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the management group for the Identity initiative. The same management group may be repeated.
  - Change _managementManagementGroup: "alz-platform-management"_, to the management group for Management. The same management group may be repeated.
  - Change _connectivityManagementGroupPrefix: "alz-platform-connectivity"_, to the management group for Connectivity. The same management group may be repeated.
  - Change _LZGroupPrefix: "alz-landing-zone"_, to the management group for Landing Zones. The same management group may be repeated.
- Go to GitHub actions and run the action *Deploy ALZ Monitor policies*

#### Single management group
> For ease of deployment and maintenance we have kept the same variables. Configure the variables _$ManagementGroupID_, _identityManagementGroup_, _managementManagementGroup_, _connectivityManagementGroup_ and _$LZManagementGroup_ with the pseudo root management group.

- Modify the following values in [sample-workflow.yml](https://github.com/Azure/alz-monitor/blob/main/.github/workflows/sample-workflow.yml):
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the pseudo root management group.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the pseudo root management group.
  - Change _managementManagementGroup: "alz-platform-management"_, to the pseudo root management group.
  - Change _connectivityManagementGroupPrefix: "alz-platform-connectivity"_, to the pseudo root management group.
  - Change _LZGroupPrefix: "alz-landing-zone"_, to the pseudo root management group.
- Go to GitHub actions and run the action *Deploy ALZ Monitor policies*

## Manual deployment with Azure CLI or PowerShell

### 1. We recommend configuring the following parameters:

- Change the value of _parPolicyManagementGroupId_ to the management group where you wish to deploy the policies, initiatives and policy assignments. This is usually the pseudo root management group.
- Change the value of _ALZMonitorResourceGroupName_ to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules are placed in.
- Change the value of _ALZMonitorResourceGroupTags_ to specify the tags to be added to said resource group.
- Change the value of _ALZMonitorResourceGroupLocation_ to specify the location for said resource group.
- Change the value of _ALZMonitorActionGroupEmail_ (specific to the Service Health initiative) to the email address where notifications of the alerts are sent to.

These changes must made in each of the following parameter files:

- [parameters-complete-connectivity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-connectivity.json)
- [parameters-complete-identity.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-identity.json)
- [parameters-complete-landingzones.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-landingzones.json)
- [parameters-complete-management.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-management.json)
- [parameters-complete-servicehealth.json](https://github.com/Azure/alz-monitor/infra-as-code/bicep/parameters-complete-servicehealth.json)

### 2. Example Parameter file:

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
,        "parPolicyAssignmentParametersServiceHealth": {
            "value": {
                "ALZMonitorActionGroupEmail": {
                    "value": "action@mail.com"
                }
            }
        }
    }
}
```

### 3. Configuring variables for deployment
Using either a PowerShell prompt or Azure CLI, navigate to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run only the commands that correspond to your management group hierarchy. 

#### ALZ aligned

##### Azure CLI
```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id parenting the identity, management and connectivity management groups"
  identityManagementGroup="The management group id for Identity"
  managementManagementGroup="The management group id for Management"
  connectivityManagementGroup="The management group id for Connectivity"
  LZManagementGroup="The management group id for Landing Zones"
```

> When running Azure CLI from PowerShell the variables have to start with a $.

##### Azure PowerShell
```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity"
  $managementManagementGroup = "The management group id for Management"
  $connectivityManagementGroup = "The management group id for Connectivity"
  $LZManagementGroup="The management group id for Landing Zones"
```

#### ALZ unaligned
> For ease of deployment and maintenance we have kept the same variables. If, for example, you combined Identity, Management and Connectivity into one management group you should configure the variables _identityManagementGroup_, _managementManagementGroup_ and _connectivityManagementGroup_ with the same management group id.

##### Azure CLI
```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id parenting the identity, management and connectivity management groups"
  identityManagementGroup="The management group id for the Identity initiative. The same management group id may be repeated"
  managementManagementGroup="The management group id for Management. The same management group id may be repeated"
  connectivityManagementGroup="The management group id for Connectivity. The same management group id may be repeated"
  LZManagementGroup="The management group id for Landing Zones. The same management group id may be repeated"
```

> When running Azure CLI from PowerShell the variables have to start with a $.

##### Azure PowerShell
```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity. The same management group id may be repeated"
  $managementManagementGroup = "The management group id for Management. The same management group id may be repeated"
  $connectivityManagementGroup = "The management group id for Connectivity. The same management group id may be repeated"
  $LZManagementGroup="The management group id for Landing Zones. The same management group id may be repeated"
```

#### Single management group
> For ease of deployment and maintenance we have kept the same variables. Configure the variables _$managementGroupID_, _identityManagementGroup_, _managementManagementGroup_, _connectivityManagementGroup_ and _$LZManagementGroup_ with the pseudo root management group id.

##### Azure CLI
```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id"
  identityManagementGroup="The pseudo root management group id"
  managementManagementGroup="The pseudo root management group id"
  connectivityManagementGroup="The pseudo root management group id"
  LZManagementGroup="The pseudo root management group id"
```

> When running Azure CLI from PowerShell the variables have to start with a $.

##### Azure PowerShell
```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id"
  $identityManagementGroup = "The pseudo root management group id"
  $managementManagementGroup = "The pseudo root management group id"
  $connectivityManagementGroup = "The pseudo root management group id"
  $LZManagementGroup="The pseudo root management group id"
```

### 4. Deploy the policy definitions, initiatives and policy assignments with default settings. 
The following commands apply to all scenarios, whether you are aligned or unaligned with ALZ or don't have management groups. 

Using either a PowerShell prompt or Azure CLI, if you closed your previous session, navigate again to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run only the commands that correspond to your management group hierarchy. 

> There can be some delay between policies getting created and being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> This should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment), to deploy and enable alerts in a controlled manner.

#### Azure CLI

```bash
  #Deploy policy definitions
  az deployment mg create --template-file infra-as-code/bicep/deploy_dine_policies.bicep --location $location --management-group-id $managementGroupId
  
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorLandingZone.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorServiceHealth.json --location $location --management-group-id $managementGroupId
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_identity.bicep --location $location --management-group-id $identityManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-identity.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_management.bicep --location $location --management-group-id $managementManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-management.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-connectivity.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_landingzones.bicep --location $location --management-group-id $LZManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-landingzones.json
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_servicehealth.bicep --location $location --management-group-id $managementGroupId --parameters ./infra-as-code/bicep/parameters-complete-servicehealth.json
```

##### Azure PowerShell

```powershell
  #Deploy policy definitions
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./infra-as-code/bicep/deploy_dine_policies.bicep
  
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorLandingZone.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorServiceHealth.json
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  New-AzManagementGroupDeployment -ManagementGroupId $identityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_identity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-identity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_management.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-management.json
  New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-connectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $LZManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_landingzones.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-landingzones.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_servicehealth.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-servicehealth.json
```

## Policy remediation
The policies are all deploy-if-not-exists, by default, meaning that any new deployments will be influenced by them. Therefore, if you are deploying in a greenfield scenario and will afterwards be deploying any of the covered resource types, including subscriptions, then the policies will take effect and the relevant alert rules, action groups and alert processing rules will be created. 
If you are in a brownfield scenario on the other hand, policies will be reporting non-compliance for resources in scope, but to remediate non-compliant resources you will need to initiate remediation. This can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.
> Note: This script requires PowerShell 7.0 or higher and the Az.Resources PowerShell module.

To use the script do the following:
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
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-landingzones -policyName Alerting-LandingZone
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz -policyName Alerting-ServiceHealth
```

## Customizing policy assignments

As mentioned previously the above guidance will deploy policies, alerts and action groups with default settings. For details on how to customize policy and in particular initiative assignments please refer to [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment)

## Customizing the `ALZ-Monitor` policies

Whatever way you may choose to consume the policies we do expect, and want, customers and partners to customize the policies to suit their needs and requirements for their design in their local copies of the policies.

For example, if you want to include more thresholds, metrics, activity log alerts or similar, outside of what the parameters allow you to change and customize, then by opening the individual policy or initiative definitions you should be able to read, understand and customize the required lines to meet your requirements easily.

This customized policy can then be deployed into your environment to deliver the desired functionality.

## Disabling Monitoring

If you wish to disable monitoring for a resource or for alerts targeted at subscription level such as Activity Log, Service Health, and Resource Health. A "MonitorDisable" tag can be created with a value of "true" at the scope where you wish to disable monitor. This will effectively filter the resource or subscription from the compliance check for the policy.



<!-- markdownlint-disable -->
> **IMPORTANT:** If you believe the changes you have made should be more easily available to be customized by a parameter etc. in the policies, then please raise an [issue](https://github.com/Azure/ALZ-Monitor/issues) for a 'Feature Request' on the repository.
> 
> If you wish to, also feel free to submit a pull request relating to the issue which we can review and work with you to potentially implement the suggestion/feature request. 
<!-- markdownlint-restore -->

## Cleaning up an ALZ Monitor Deployment

In some scenarios, it may be necessary to remove everything deployed by the ALZ Monitor solution. The instructions below detail execution of a PowerShell script to delete all resources deployed, including:

- Metric Alerts
- Activity Log Alerts
- Resource Groups (created for to contain alert resources)
- Policy Assignments
- Policy Definitions
- Policy Set Definitions
- Policy Assignment remediation identity role assignments

All resources deployed as part of the initial ALZ Monitor deployment and the resources created by dynamically by 'deploy if not exist' policies are either tagged, marked in metadata, or in description (depending on what the resource supports) with the value `_deployed_by_alz_monitor` or `_deployed_by_alz_monitor=True`. This metadata is used to execute the cleanup of deployed resources; _if it has been removed or modified the cleanup script will not include those resources_. 

### Cleanup Script Execution

#### Download the script file

Follow the instructions below to download the cleanup script file. Alternatively, clone the repo from GitHub and ensure you are working from the latest version of the file by fetching the latest `main` branch.

 1. Navigate ALZ-Monitor [project in GitHub](https://github.com/Azure/alz-monitor)
 1. In the folder structure, browse to the `src/scripts` directory
 1. Open the **Start-ALZMonitorCleanup.ps1** script file
 1. Click the **Raw** button
 1. Save the open file as **Start-ALZMonitorCleanup.ps1**

#### Executing the Script

1. Open PowerShell
1. Install the **Az.ResourceGraph** module: `Install-Module Az.ResourceGraph`
1. Change directories to the location of the **Start-ALZMonitorCleanup.ps1** script
1. Sign in to the Azure with the `Connect-AzAccount` command. The account you sign in as needs to have permissions to remove Policy Assignments, Policy Definitions, and resources at the desired Management Group scope.
1. Execute the script using the option below

**Generate a list of the resource IDs which would be deleted by this script:**

  ```powershell
  ./Start-ALZMonitorCleanup.ps1 -ReportOnly
  ```

**Show output of what would happen if deletes executed:**

  ```powershell
  ./Start-ALZMonitorCleanup.ps1 -WhatIf
  ```

**Delete all resources deployed by the ALZ-Monitor IaC without prompting for confirmation:**

  ```powershell
  ./Start-ALZMonitorCleanup.ps1 -Force
  ```
