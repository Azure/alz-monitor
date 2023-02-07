# Consumer Guide

## Background

This guide describes how to get started with implementing alert policies and initiatives in your environment for testing and validation. In the guide it is assumed that you will be using GitHub actions or manual deployment to implement policies, initiatives and policy assignments in your environment. 

> Note that this is a preview solution intended to solicitate feedback for further development which should be tested in a safe environment before deploying to production to protect against possible failures/unnecessary cost. 
> Also note that this private repo is shared with different select Microsoft customers and partners, as such you should never upload or otherwise divulge sensititve information to this repo. If there is any concern, please contact your Microsoft counterparts for detailed advice.

The repo at present contains ip for the following:
- Policies to automatically create alerts, action groups and alert processing rules for different Azure resource types, centered around a recommended Azure Monitor Baseline for Alerting in a customers´ newly created or existing brownfield ALZ deployment.
- Initiatives grouping said policies into appropriate buckets for ease of policy assignment in alignment with ALZ Platform structure (Networking, Identity and Management).

Alerts, action groups and alert processing rules are created as follows:
1. All metric alerts are created in the resource group where the resource that is being monitored exists. I.e. creating an ER circuit in a resource group covered by the policies will create the corresponding alerts in that same resource group.
2. Activity log alerts are created in a specific resource group (created specifically by and used for this solution) in each subscription, when the subscription is deployed. The resource group name is parameterized, with a default value of AlzMonitoring-rg.
3. Resource health alerts are created in a specific resource group (created specifically by and used for this solution) in each subscription, when the subscription is deployed. The resource group name is parameterized, with a default value of AlzMonitoring-rg.
4. Action groups and alert processing rules are created in a specific resource group (created specifically by and used for this solution) in each subscription, when the subscription is deployed. The resource group name is parameterized, with a default value of AlzMonitoring-rg.

## Getting started

- Fork this repo to your own GitHub organization, this should be done to allow all contributors to work completely independent of each other. Pull requests directly towards the repo will be rejected.
- Clone the repo from your own GitHub organization to your developer workstation. 

### Manual (Complete) deployment - default settings
- Using either a PowerShell prompt or Azure CLI, navigate to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.
- Run the following commands to deploy the policy definitions, initiatives and policy assignments with default settings. There can be some delay between policies getting created and actually being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> As mentioned previously this should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment), to deploy and enable alerts in a controlled manner.

#### Azure CLI

```bash
  location="Your Azure location of choice"
  managementGroupId="The management group id where you want to deploy policies"
  identityManagementGroup="The management group id for Identity"
  managementManagementGroup="The management group id for Management"
  connectivityManagementGroup="The management group id for Connectivity"
  az deployment mg create --template-file infra-as-code/bicep/deploy_dine_policies.bicep --location $location --management-group-id $managementGroupId
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json --location $location --management-group-id $managementGroupId
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json --location $location --management-group-id $managementGroupId
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_identity.bicep --location $location --management-group-id $identityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_management.bicep --location $location --management-group-id $managementManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId
```

#### Azure PowerShell

```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The management group id where you want to deploy policies"
  $identityManagementGroup = "The management group id for Identity"
  $managementManagementGroup = "The management group id for Management"
  $connectivityManagementGroup = "The management group id for Connectivity"
  #Deploy policy definitions
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./infra-as-code/bicep/deploy_dine_policies.bicep
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementGroupID -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  New-AzManagementGroupDeployment -ManagementGroupId $identityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_identity.bicep -parPolicyManagementGroupId $managementGroupId
  New-AzManagementGroupDeployment -ManagementGroupId $managementManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_management.bicep -parPolicyManagementGroupId $managementGroupId
  New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -parPolicyManagementGroupId $managementGroupId
```
### Deploy through GitHub Actions - vanilla
To deploy through GitHub actions, please refer to the sample GitHub workflow in the repo under .github/workflows/sample-workflow.yml. To leverage this directly do the following.
- Configure your OpenID Connect as described [here](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Cwindows#use-the-azure-login-action-with-openid-connect).
- Modify the following values in sample-workflow.yml:
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the management group where you wish to deploy the policies, initiatives and policy assignments.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the management group for identity in your ALZ implementation.
  - Change _managementManagementGroup: "alz-platform-management"_, to the management group for management in your ALZ implementation.
  - Change _ManagementGroupPrefix: "alz-platform-connectivity"_, to the management group for connectivity in your ALZ implementation.

- Go to GitHub actions and run the action *Deploy ALZ Monitor policies*

## Policy remediation
The policies are all deploy-if-not-exists, by default, meaning that any new deployments will be influenced by them. Therefore if you are deploying in a greenfield scenario and will afterwards be deploying any of the covered resource types, including subscriptions, then the policies will take effect and the relevant alert rules, action groups and alert processing rules will be created. 
If you are in a brown-field scenario on the other hand, policies will be reporting non-compliance for resources in scope, but to remediate non-compliant resources you will need to initiate remediation. This can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.

## Customizing policy assignments

Fixme if need to disable all alerts to be comfortable with the process. For details on how to customize policy and in particular initiative assignments please refer to [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment)


## Customizing the `ALZ-Monitor` policies

Whatever way you may choose to consume the policies we do expect, and want, customers and partners to customize the policies to suit their needs and requirements for their design in their local copies of the policies.

For example, if you want to include more thresholds, metrics, activity log alerts or similar, outside of what the parameters allow you to change and customize, then by opening up the individual policy or initiative definitions you should be able to read, understand and customize the required lines to meet your requirements easily.

This customized policy can then be deployed into your environment to deliver the desired functionality.

<!-- markdownlint-disable -->
> **IMPORTANT:** If you believe the changes you have made should be more easily available to be customized by a parameter etc. in the policies, then please raise an [issue](https://github.com/Azure/ALZ-Monitor/issues) for a 'Feature Request' on the repository 
> 
> If you wish to, also feel free to submit a pull request relating to the issue which we can review and work with you to potentially implement the suggestion/feature request 
<!-- markdownlint-restore -->

