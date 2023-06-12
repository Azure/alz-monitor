## Introduction
The following guide describes the steps to implement an individual initiative. In this example we will deploy the Service Health initiative via Azure CLI. The same principles and steps apply to other initiatives and deployment methods. The deployment is similar to deploying all initiatives, and the main difference is in the initial deployment of the Policy Definitions. The high level steps are as follows:
- You can choose deploy all the Policy Definitions, this is recommended when other initiatives will be implemented in the future.
- In case you don´t want to deploy all the Policy Definitions, you need to manually deploy the definitions that are part of the Initiative. All initiatives and relevant Policy Definitions are documented here: [Azure Policy Initiatives](./PolicyInitiatives)
- Deploy all or only the required policies
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
Using either a PowerShell prompt or Azure CLI, navigate to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run the following commands. 

```bash
  location="Your Azure location of choice"
  pseudoRootManagementGroup="The pseudo root management group id parenting the identity, management and connectivity management groups"
```

> *IMPORTANT:* When running Azure CLI from PowerShell the variables have to start with a $.
> *IMPORTANT:* Above-mentioned "pseudoRootManagementGroup" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter file.

## 4. Deploy the policy definitions, initiatives and policy assignments with default settings
Using either a PowerShell prompt or Azure CLI, if you closed your previous session, navigate again to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

> There can be some delay between policies getting created and being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> This should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](./Customize-Policy-Assignment), to deploy and enable alerts in a controlled manner.

If you want to deploy all Policy Definitions run the following command:

```bash
  #Deploy all policy definitions
  az deployment mg create --template-file infra-as-code/bicep/deploy_dine_policies.bicep --location $location --management-group-id $pseudoRootManagementGroup
```

If you want to deploy only the Policy Definitions required for the Service Health initiative run the following commands:

```bash
  #Deploy only the required policy definitions for the Service Health initiative
  az deployment mg create --template-file src/resources\Microsoft.Authorization/policyDefinitions/deploy-activitylog-ResourceHealth-UnHealthly-alert.bicep --location $location --management-group-id $pseudoRootManagementGroup
  az deployment mg create --template-file src/resources\Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.bicep --location $location --management-group-id $pseudoRootManagementGroup
  az deployment mg create --template-file src/resources\Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.bicep --location $location --management-group-id $pseudoRootManagementGroup
  az deployment mg create --template-file src/resources\Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.bicep --location $location --management-group-id $pseudoRootManagementGroup
  az deployment mg create --template-file src/resources\Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Security.bicep --location $location --management-group-id $pseudoRootManagementGroup
  az deployment mg create --template-file src/resources\Microsoft.Authorization/policyDefinitions/deploy-alertprocessingrule-deploy.bicep --location $location --management-group-id $pseudoRootManagementGroup
```

Run the following commands to deploy and to assign the Service Health initiative to the pseudo root management group:

```bash
  #Deploy policy initiatives, wait approximately 1-2 minutes after deploying policies to ensure that there are no errors when creating initiatives
  az deployment mg create --template-file ./src/resources/Microsoft.Authorization/policySetDefinitions/ALZ-MonitorServiceHealth.json --location $location --management-group-id $pseudoRootManagementGroup
  
  #Assign Policy Initiatives, wait approximately 1-2 minutes after deploying initiatives policies to ensure that there are no errors when assigning them
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_servicehealth.bicep --location $location --management-group-id $pseudoRootManagementGroup --parameters ./infra-as-code/bicep/parameters-complete-servicehealth.json
```

# Next steps
- To remediate non-compliant policies, please proceed with [Policy remediation](./Policy-remediation)