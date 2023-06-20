## Introduction
The following guide describes the steps to implement an individual initiative. In this example we will deploy the Service Health initiative via Azure PowerShell. The same principles and steps apply to other initiatives and deployment methods. 

When you deploy one initiative, like Service Health, you will only need the baseline monitoring Policy Definitions required by that Initiative. You can still choose to deploy all baseline monitoring Policy Definitions that are provided in this repository, this is recommended when you want to deploy other baseline monitoring Initiatives in the future. In case you first deploy a subset of the baseline monitoring Policy Definitions, you can easily deploy additional definitions at a later stage.

### High level deployment steps:
- Deploy baseline monitoring Policy Definitions. You can choose between 2 options:
    - Deploy all the baseline monitoring Policy Definitions provided in this repository. This is recommended when you want to deploy other baseline monitoring Initiatives in the future.
    - Deploy only the baseline monitoring Policy Definitions that are required by the Initiative. Consult the documentation [Azure Policy Initiatives](./PolicyInitiatives) to find the required baseline monitoring Policy Definitions for each of the Initiatives. For example, the following baseline monitoring Policy Definitions are required for the Service Health initiative:
        - [deploy-activitylog-ResourceHealth-UnHealthly-alert.bicep ](../blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.bicep)
        - [deploy-activitylog-ServiceHealth-Health.bicep](../blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.bicep)
        - [deploy-activitylog-ServiceHealth-Incident.bicep](../blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.bicep)
        - [deploy-activitylog-ServiceHealth-Maintenance.bicep](../blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.bicep)
        - [deploy-activitylog-ServiceHealth-Security.bicep](../blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Security.bicep)
        - [deploy-alertprocessingrule-deploy.bicep](../blob/main/src/resources/Microsoft.Authorization/policyDefinitions/deploy-alertprocessingrule-deploy.bicep)
- Deploy the initiative
- Assign the initiative

## 1. We recommend configuring the following parameters:

- Change the value of _parPolicyPseudoRootMgmtGroup_ to the management group where you wish to deploy the policies and the initiatives; this will also be the ["scope"](https://learn.microsoft.com/azure/governance/policy/concepts/scope) of the respective policy / initiative assignments.
This is usually the so called "pseudo root management group", e.g. in [ALZ terminology](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups), this would be the so called "Intermediate Root Management Group" (directly beneath the "Tenant Root Group").
- Change the value of _ALZMonitorResourceGroupName_ to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules are placed in.
- Change the value of _ALZMonitorResourceGroupTags_ to specify the tags to be added to said resource group.
- Change the value of _ALZMonitorResourceGroupLocation_ to specify the location for said resource group.
- Change the value of _ALZMonitorActionGroupEmail_ (specific to the Service Health initiative) to the email address where notifications of the alerts are sent to.

These changes must be made in the corresponding parameter file, in this case the Service Health parameter file:

- [parameters-complete-servicehealth.json](../blob/main/infra-as-code/bicep/parameters-complete-servicehealth.json)

## 2. Example Parameter file:

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "parPolicyPseudoRootMgmtGroup": {
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
        "parPolicyAssignmentParametersServiceHealth": {
            "value": {
                "ALZMonitorActionGroupEmail": {
                    "value": "action@mail.com"
                },
                "ResHlthUnhealthyAlertState": {
                    "value": "true"
                },
                "SvcHlthAdvisoryAlertState": {
                    "value": "true"
                },
                "SvcHlthIncidentAlertState": {
                    "value": "true"
                },
                "SvcHlthMaintenanceAlertState": {
                    "value": "true"
                },
                "svcHlthSecAdvisoryAlertState": {
                    "value": "true"
                }
            }
        }
    }
}
```

## 3. Configuring variables for deployment
Open Windows PowerShell, and navigate to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run the following commands. 

```powershell
  $location="Your Azure location of choice"
  $pseudoRootManagementGroup="The pseudo root management group id parenting the identity, management and connectivity management groups"
```

> *IMPORTANT:* Above-mentioned "pseudoRootManagementGroup" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter file.

## 4. Deploy the policy definitions, initiatives and policy assignments with default settings
Using Windows PowerShell, if you closed your previous session, navigate again to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

> There can be some delay between policies getting created and being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> This should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](./Customize-Policy-Assignment), to deploy and enable alerts in a controlled manner.

If you want to deploy all baseline monitoring Policy Definitions provided in this repository (_this includes Policy Definitions for the other Initiatives_), run the following command:

```powershell
  #Deploy all policy definitions
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/deploy_dine_policies.bicep
```

If you want to deploy only the baseline monitoring Policy Definitions required for the Service Health initiative run the following commands:

```powershell
  #Deploy only the required policy definitions for the Service Health initiative
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location ./src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.bicep
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location ./src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.bicep
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location ./src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.bicep 
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location ./src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.bicep
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location ./src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Security.bicep
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location ./src/resources/Microsoft.Authorization/policyDefinitions/deploy-alertprocessingrule-deploy.bicep
```

Run the following commands to deploy and to assign the Service Health initiative to the pseudo root management group:

```powershell
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorServiceHealth.json
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  New-AzManagementGroupDeployment -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile ./infra-as-code/bicep/assign_initiatives_servicehealth.bicep -TemplateParameterFile ./infra-as-code/bicep/parameters-complete-servicehealth.json
```

# Next steps
- To remediate non-compliant policies, please proceed with [Policy remediation](./Policy-remediation)