## 1. We recommend configuring the following parameters:

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

## 2. Example Parameter file:

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
        "parPolicyAssignmentParametersServiceHealth": {
            "value": {
                "ALZMonitorActionGroupEmail": {
                    "value": "action@mail.com"
                }
            }
        }
    }
}
```

## 3. Configuring variables for deployment
Using either a PowerShell prompt or Azure CLI, navigate to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run only the commands that correspond to your management group hierarchy. 

### ALZ aligned
```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity"
  $managementManagementGroup = "The management group id for Management"
  $connectivityManagementGroup = "The management group id for Connectivity"
  $LZManagementGroup="The management group id for Landing Zones"
```

### ALZ unaligned
> For ease of deployment and maintenance we have kept the same variables. If, for example, you combined Identity, Management and Connectivity into one management group you should configure the variables _identityManagementGroup_, _managementManagementGroup_ and _connectivityManagementGroup_ with the same management group id.

```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity. The same management group id may be repeated"
  $managementManagementGroup = "The management group id for Management. The same management group id may be repeated"
  $connectivityManagementGroup = "The management group id for Connectivity. The same management group id may be repeated"
  $LZManagementGroup="The management group id for Landing Zones. The same management group id may be repeated"
```

### Single management group
> For ease of deployment and maintenance we have kept the same variables. Configure the variables _$managementGroupID_, _identityManagementGroup_, _managementManagementGroup_, _connectivityManagementGroup_ and _$LZManagementGroup_ with the pseudo root management group id.
```powershell
  $location = "Your Azure location of choice"
  $managementGroupID = "The pseudo root management group id"
  $identityManagementGroup = "The pseudo root management group id"
  $managementManagementGroup = "The pseudo root management group id"
  $connectivityManagementGroup = "The pseudo root management group id"
  $LZManagementGroup="The pseudo root management group id"
```

## Azure Devops Pipelines Deployment

### Prerequisites

1. Azure Active Directory Tenant.
2. ALZ Management group hierarchy deployed as described [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-areas).
3. Minimum 1 subscription, for when deploying alerts through policies. 
4. Deployment Identity with `Owner` permission to the pseudo root management group.  Owner permission is required to allow the Service Principal Account to create role-based access control assignments.
5. Azure Devops connected to your ALZ Implementation

### ALZ Pipelines

To use Azure Devops Pipelines fork the ALZ repository to your Github Account, or download its contents. 

#### Create New Pipeline

Specify where the ALZ github contents are, Azure Devops Repo, Github.  
Select Starter YAML Pipeline. An example YAML pipeline can be found here. [sample-cli-pipeline.yml](https://github.com/Azure/alz-monitor/blob/main/docs/azure-pipelines/sample-cli-pipeline.yml)

#### Define Variables, Trigger, Pool

Define variables for location, the psuedo Root Management Group, Connectivity Management Group, Identity Management Group, and the Management Group for Management.  

Additionaly define your trigger and pool vmImage type if required.

```yml
variables:
  location: 'westus'
  rootManagementGroup: 'ALZ'
  connectivityManagementGroup: 'alz-platform-connectivity'
  identityManagementGroup: 'alz-platform-identity'
  managementManagementGroup: 'alz-platform-management'

trigger:
- main

pool:
  vmImage: ubuntu-latest
```

#### Deploy DINE Definitions

Create the first Azure CLI task as inline script.  
Define task name, the Azuze Subscription connection name specified in Azure Devops.


```yml
steps:
- task: AzureCLI@2
  displayName: 'Deploy Definitions'
  inputs:
    azureSubscription: newVSstudio
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
     az deployment mg create --template-file '$(System.DefaultWorkingDirectory)/infra-as-code/bicep/deploy_dine_policies.bicep' --location $(location) --management-group-id $(rootManagementGroup)
```

#### Deploy Policies

Create another CLI task or duplicate the first task to create a second Azure CLI task as inline script to deploy the policies.  
 

```yml
- task: AzureCLI@2
  displayName: 'Deploy Policies'
  inputs:
    azureSubscription: newVSstudio
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
     az deployment mg create --template-file '$(System.DefaultWorkingDirectory)/src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json' --location $(location) --management-group-id $(connectivityManagementGroup)
     az deployment mg create --template-file  '$(System.DefaultWorkingDirectory)/src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json' --location $(location) --management-group-id $(identityManagementGroup)
     az deployment mg create --template-file  '$(System.DefaultWorkingDirectory)/src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json' --location $(location) --management-group-id $(managementManagementGroup)       
```  

#### Assign Policies

Create the third task or duplicate from previous.

```yml
- task: AzureCLI@2
  displayName: 'Assign Policies'
  inputs:
    azureSubscription: newVSstudio
    scriptType: bash
    scriptLocation: inlineScript
    inlineScript: |
     az deployment mg create --template-file '$(System.DefaultWorkingDirectory)/infra-as-code/bicep/assign_initiatives_connectivity.bicep' --location $(location) --management-group-id $(connectivityManagementGroup)
     az deployment mg create --template-file  '$(System.DefaultWorkingDirectory)/infra-as-code/bicep/assign_initiatives_identity.bicep' --location $(location) --management-group-id $(identityManagementGroup)
     az deployment mg create --template-file  '$(System.DefaultWorkingDirectory)/infra-as-code/bicep/assign_initiatives_management.bicep' --location $(location) --management-group-id $(managementManagementGroup)
     az deployment mg create --template-file  '$(System.DefaultWorkingDirectory)/infra-as-code/bicep/assign_initiatives_landingzones.bicep --location' --location $(location) --management-group-id $(rootManagementGroup)
```


# Next steps

- To remediate non-compliant policies, please proceed with [Policy remediation](./Policy-remediation)