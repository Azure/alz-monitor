## 1. We recommend configuring the following parameters:

- Change the value of _parPolicyPseudoRootMgmtGroup_ to the management group where you wish to deploy the policies and the initiatives; this will also be the ["scope"](https://learn.microsoft.com/azure/governance/policy/concepts/scope) of the respective policy / initiative assignments.
This is usually the so called "pseudo root management group", e.g. in [ALZ terminology](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups), this would be the so called "Intermediate Root Management Group" (directly beneath the "Tenant Root Group").
- Change the value of _ALZMonitorResourceGroupName_ to the name of the resource group where the activity logs, resource health alerts, actions groups and alert processing rules are placed in.
- Change the value of _ALZMonitorResourceGroupTags_ to specify the tags to be added to said resource group.
- Change the value of _ALZMonitorResourceGroupLocation_ to specify the location for said resource group.
- Change the value of _ALZMonitorActionGroupEmail_ (specific to the Service Health initiative) to the email address where notifications of the alerts are sent to.

These changes must be made in each of the following parameter files:

- [parameters-complete-connectivity.json](../blob/main/infra-as-code/bicep/parameters-complete-connectivity.json)
- [parameters-complete-identity.json](../blob/main/infra-as-code/bicep/parameters-complete-identity.json)
- [parameters-complete-landingzones.json](../blob/main/infra-as-code/bicep/parameters-complete-landingzones.json)
- [parameters-complete-management.json](../blob/main/infra-as-code/bicep/parameters-complete-management.json)
- [parameters-complete-servicehealth.json](../blob/main/infra-as-code/bicep/parameters-complete-servicehealth.json)

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

## 3. Configure and run the pipeline
First configure your Azure DevOps project with a pipeline hosted in GitHub as described [here](https://learn.microsoft.com/en-us/azure/devops/pipelines/repos/github?view=azure-devops&tabs=yaml#access-to-github-repositories). The pipeline should be configured to use the [sample-pipeline.yml](../../azure-pipelines/sample-pipeline.yml) file.

Also in your Azure DevOps project, configure a service connection to your Azure subscription as described [here](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops&tabs=yaml). The service connection should target the intermediate root management group for ALZ aligned deployments or the management group where you wish to deploy the policies and the initiatives for ALZ unaligned deployments.

### ALZ aligned

- Modify the following values in [sample-pipeline.yml](../../azure-pipelines/sample-pipeline.yml):
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the pseudo root management group id parenting the identity, management and connectivity management groups.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the management group for identity in your ALZ implementation.
  - Change _managementManagementGroup: "alz-platform-management"_, to the management group for management in your ALZ implementation.
  - Change _connectivityManagementGroup: "alz-platform-connectivity"_, to the management group for connectivity in your ALZ implementation.
  - Change _LZManagementGroup: "alz-landing-zone"_, to the management group for Landing Zones in your ALZ implementation.
- Go to Azure DevOps Pipelines and run the pipeline you just created.

> *IMPORTANT:* Above-mentioned "ManagementGroupPrefix" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter files.

### ALZ unaligned
> For ease of deployment and maintenance we have kept the same variables. If, for example, you combined Identity, Management and Connectivity into one management group you should configure the variables _identityManagementGroup_, _managementManagementGroup_ and _connectivityManagementGroup_ with the same management group.

- Modify the following values in [sample-pipeline.yml](../../azure-pipelines/sample-pipeline.yml):
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the pseudo root management group parenting the identity, management and connectivity management groups.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the management group for the Identity initiative. The same management group may be repeated.
  - Change _managementManagementGroup: "alz-platform-management"_, to the management group for Management. The same management group may be repeated.
  - Change _connectivityManagementGroup: "alz-platform-connectivity"_, to the management group for Connectivity. The same management group may be repeated.
  - Change _LZManagementGroup: "alz-landing-zone"_, to the management group for Landing Zones. The same management group may be repeated.
- Go to Azure DevOps Pipelines and run the pipeline you just created.

> *IMPORTANT:* Above-mentioned "ManagementGroupPrefix" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter files.

### Single management group
> For ease of deployment and maintenance we have kept the same variables. Configure the variables _ManagementGroupPrefix_, _identityManagementGroup_, _managementManagementGroup_, _connectivityManagementGroup_ and _LZManagementGroup_ with the pseudo root management group.

- Modify the following values in [sample-pipeline.yml](../../azure-pipelines/sample-pipeline.yml):
  - Change _Location: "norwayeast"_, to your preferred Azure region
  - Change _ManagementGroupPrefix: "alz"_, to the pseudo root management group.
  - Change _identityManagementGroup: "alz-platform-identity"_, to the pseudo root management group.
  - Change _managementManagementGroup: "alz-platform-management"_, to the pseudo root management group.
  - Change _connectivityManagementGroup: "alz-platform-connectivity"_, to the pseudo root management group.
  - Change _LZManagementGroup: "alz-landing-zone"_, to the pseudo root management group.
- Go to Azure DevOps Pipelines and run the pipeline you just created.

> *IMPORTANT:* Above-mentioned "ManagementGroupPrefix" variable value, being the so called "pseudo root management group id", should _coincide_ with the value of the "parPolicyPseudoRootMgmtGroup" parameter, as set previously within the parameter files.

# Next steps
- To remediate non-compliant policies, please proceed with [Policy remediation](./Policy-Remediation.md)
