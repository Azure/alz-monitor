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
```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id parenting the identity, management and connectivity management groups"
  identityManagementGroup="The management group id for Identity"
  managementManagementGroup="The management group id for Management"
  connectivityManagementGroup="The management group id for Connectivity"
  LZManagementGroup="The management group id for Landing Zones"
```

> When running Azure CLI from PowerShell the variables have to start with a $.

### ALZ unaligned
> For ease of deployment and maintenance we have kept the same variables. If, for example, you combined Identity, Management and Connectivity into one management group you should configure the variables _identityManagementGroup_, _managementManagementGroup_ and _connectivityManagementGroup_ with the same management group id.
```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id parenting the identity, management and connectivity management groups"
  identityManagementGroup="The management group id for the Identity initiative. The same management group id may be repeated"
  managementManagementGroup="The management group id for Management. The same management group id may be repeated"
  connectivityManagementGroup="The management group id for Connectivity. The same management group id may be repeated"
  LZManagementGroup="The management group id for Landing Zones. The same management group id may be repeated"
```

> When running Azure CLI from PowerShell the variables have to start with a $.

### Single management group
> For ease of deployment and maintenance we have kept the same variables. Configure the variables _$managementGroupID_, _identityManagementGroup_, _managementManagementGroup_, _connectivityManagementGroup_ and _$LZManagementGroup_ with the pseudo root management group id.
```bash
  location="Your Azure location of choice"
  managementGroupId="The pseudo root management group id"
  identityManagementGroup="The pseudo root management group id"
  managementManagementGroup="The pseudo root management group id"
  connectivityManagementGroup="The pseudo root management group id"
  LZManagementGroup="The pseudo root management group id"
```

> When running Azure CLI from PowerShell the variables have to start with a $.


## 4. Deploy the policy definitions, initiatives and policy assignments with default settings
The following commands apply to all scenarios, whether you are aligned or unaligned with ALZ or don't have management groups. 

Using either a PowerShell prompt or Azure CLI, if you closed your previous session, navigate again to the root of the cloned repo and log on to Azure with an account with at least Resource Policy Contributor access at the root of the management group hierarchy where you will be creating the policies and initiatives.

Run only the commands that correspond to your management group hierarchy. 

> There can be some delay between policies getting created and being available to be included in initiatives, as well as some delay for initiatives to be created and being able to be assigned, so allow for some delay between these different deployment actions.
> This should be tested in a safe environment. If you are subsequently looking to deploy to prod environments, consider leveraging the guidance found in [Customize Policy Assignment](https://github.com/Azure/alz-monitor/wiki/CustomizePolicyAssignment), to deploy and enable alerts in a controlled manner.

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

# Next steps
- To remediate non-compliant policies, please proceed with [Policy remediation](https://github.com/Azure/alz-monitor/wiki/Policy-remediation)