<!-- markdownlint-disable -->
## Telemetry Tracking Using Customer Usage Attribution (PID)
<!-- markdownlint-restore -->

Microsoft can identify the deployments of the Azure Resource Manager and Bicep templates with the deployed Azure resources. Microsoft can correlate these resources used to support the deployments. Microsoft collects this information to provide the best experiences with their products and to operate their business. The telemetry is collected through [customer usage attribution](https://docs.microsoft.com/azure/marketplace/azure-partner-customer-usage-attribution). The data is collected and governed by Microsoft's privacy policies, located at the [trust center](https://www.microsoft.com/trustcenter).

To disable this tracking, we have included a parameter called `parTelemetryOptOut` to the following bicep/ARM files in this repo with a simple boolean flag. The default value `false` which **does not** disable the telemetry. If you would like to disable this tracking, then simply set this value to `true` and this module will not be included in deployments and **therefore disables** the telemetry tracking.

- ./infra-as-code/bicep/deploy_dine_policies.bicep
- ./infra-as-code/bicep/assign_initiatives_connectivity.bicep
- ./infra-as-code/bicep/assign_initiatives_identity.bicep
- ./infra-as-code/bicep/assign_initiatives_management.bicep
- ./src/resources/Microsoft.Authorization/policySetDefinitions/deploy-connectivity.json
- ./src/resources/Microsoft.Authorization/policySetDefinitions/deploy-management.json
- ./src/resources/Microsoft.Authorization/policySetDefinitions/deploy-identity.json

If you are happy with leaving telemetry tracking enabled, no changes are required. 

For example, in the deploy_dine_policies.bicep file, you will see the following:

```bicep
@description('Set Parameter to True to Opt-out of deployment telemetry')
param parTelemetryOptOut bool = true
```

The default value is `false`, but by changing the parameter value `true` and saving this file, when you deploy this module either via PowerShell, Azure CLI, or as part of a pipeline the module deployment below will be ignored and therefore telemetry will not be tracked.

```bicep
// Optional Deployment for Customer Usage Attribution
module modCustomerUsageAttribution '../../CRML/customerUsageAttribution/cuaIdTenant.bicep' = if (!parTelemetryOptOut) {
  name: 'pid-${varCuaid}-${uniqueString(deployment().location)}'
  params: {}
}
```

## Module PID Value Mapping

The following are the unique ID's (also known as PIDs) used in each of the files:

| File Name                     | PID                                  |
| ------------------------------- | ------------------------------------ |
| deploy_dine_policies            | d6b3b08c-5825-4b89-a62b-e3168d3d8fb0 |
| assign_initiatives_connectivity.bicep | 2d69aa07-8780-4697-a431-79882cb9f00e |
| assign_initiatives_identity.bicep | 8d257c20-97bf-4d14-acb3-38dd1436d13a |
| assign_initiatives_management.bicep | d87415c4-01ef-4667-af89-0b5adc14af1b |
| deploy-connectivity.json | 7e6d4601-dfd7-4996-8ea6-3e1ef93758f1 |
| deploy-management.json | 7e6d4601-dfd7-4996-8ea6-3e1ef93758f1 |
| deploy-identity.json | 7e6d4601-dfd7-4996-8ea6-3e1ef93758f1 |