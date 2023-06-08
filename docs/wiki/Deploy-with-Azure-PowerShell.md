## 1. We recommend configuring the following parameters:

- Change the value of _parPolicyPseudoRootMgmtGroup_ to the management group where you wish to deploy the policies and the initiatives; this will also be the ["scope"](https://learn.microsoft.com/azure/governance/policy/concepts/scope) of the respective policy / initiative assignments.
This is usually the so called "pseudo root management group", e.g. in [ALZ terminology](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups), this would be the so called "Intermediate Root Management Group" (directly beneath the "Tenant Root Group").
- Change the value of _ALZMonitorResourceGroupName_ to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules are placed in.
- Change the value of _ALZMonitorResourceGroupTags_ to specify the tags to be added to said resource group.
- Change the value of _ALZMonitorResourceGroupLocation_ to specify the location for said resource group.
- Change the value of _ALZMonitorActionGroupEmail_ (specific to the Service Health initiative) to the email address where notifications of the alerts are sent to.

These changes must be made in each of the following parameter files:

- [parameters-complete-connectivity.json](/infra-as-code/bicep/parameters-complete-connectivity.json)
- [parameters-complete-identity.json](/infra-as-code/bicep/parameters-complete-identity.json)
- [parameters-complete-landingzones.json](/infra-as-code/bicep/parameters-complete-landingzones.json)
- [parameters-complete-management.json](/infra-as-code/bicep/parameters-complete-management.json)
- [parameters-complete-servicehealth.json](/infra-as-code/bicep/parameters-complete-servicehealth.json)

## 2. Example Parameter file:

Note that the parameter file shown below has been truncated for brevity, compared to the samples included.

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "parPolicyPseudoRootMgmtGroup": {
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
  $pseudoRootManagementGroup = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity"
  $managementManagementGroup = "The management group id for Management"
  $connectivityManagementGroup = "The management group id for Connectivity"
  $LZManagementGroup="The management group id for Landing Zones"
```

> *IMPORTANT:* Above-mentioned "pseudoRootManagementGroup" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter files.

### ALZ unaligned
> For ease of deployment and maintenance we have kept the same variables. If, for example, you combined Identity, Management and Connectivity into one management group you should configure the variables _identityManagementGroup_, _managementManagementGroup_ and _connectivityManagementGroup_ with the same management group id.
```powershell
  $location = "Your Azure location of choice"
  $pseudoRootManagementGroup = "The pseudo root management group id parenting the identity, management and connectivity management groups"
  $identityManagementGroup = "The management group id for Identity. The same management group id may be repeated"
  $managementManagementGroup = "The management group id for Management. The same management group id may be repeated"
  $connectivityManagementGroup = "The management group id for Connectivity. The same management group id may be repeated"
  $LZManagementGroup="The management group id for Landing Zones. The same management group id may be repeated"
```

> *IMPORTANT:* Above-mentioned "pseudoRootManagementGroup" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter files.

### Single management group
> For ease of deployment and maintenance we have kept the same variables. Configure the variables _pseudoRootManagementGroup_, _identityManagementGroup_, _managementManagementGroup_, _connectivityManagementGroup_ and _LZManagementGroup_ with the pseudo root management group id.
```powershell
  $location = "Your Azure location of choice"
  $pseudoRootManagementGroup = "The pseudo root management group id"
  $identityManagementGroup = "The pseudo root management group id"
  $managementManagementGroup = "The pseudo root management group id"
  $connectivityManagementGroup = "The pseudo root management group id"
  $LZManagementGroup="The pseudo root management group id"
```

> *IMPORTANT:* Above-mentioned "pseudoRootManagementGroup" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter files.

## 4. Deploy the policy definitions, initiatives and policy assignments with default settings
The following commands apply to all scenarios, whether you are aligned or unaligned with ALZ or don't have management groups. 

Using either a PowerShell prompt or Azure CLI, if you closed your previous session, navigate again to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run only the commands that correspond to your management group hierarchy. 

> There can be some delay between policies getting created and being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> This should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](./Customize-Policy-Assignment), to deploy and enable alerts in a controlled manner.

```powershell
  #Deploy policy definitions
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/deploy_dine_policies.bicep
  
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorConnectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorIdentity.json
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorManagement.json
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorLandingZone.json
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorServiceHealth.json
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  New-AzManagementGroupDeployment -ManagementGroupId $identityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_identity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-identity.json
  New-AzManagementGroupDeployment -ManagementGroupId $managementManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_management.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-management.json
  New-AzManagementGroupDeployment -ManagementGroupId $connectivityManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_connectivity.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-connectivity.json
  New-AzManagementGroupDeployment -ManagementGroupId $LZManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_landingzones.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-landingzones.json
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_servicehealth.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-servicehealth.json
```

# Next steps
- To remediate non-compliant policies, please proceed with [Policy remediation](./Policy-remediation)