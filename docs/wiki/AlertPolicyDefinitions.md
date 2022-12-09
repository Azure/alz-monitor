# ALZ Monitor Alert Policy Definitions

The following poicy definition categories will be enabled as part of ALZ deployments:

- Resource Metrics
- Service and Resource Health
- Activity Logs
- Log Alerts (from Log Analytics) - TBD

## Deployment

ALZ Alerts are deployed using Azure Policy. This work is largely done, just working on the conversion from Bicep to ARM JSON so they can be incorporated into the Enterprise-Scale repo.

### Resource Metrics

Alerts are configured to be deployed in the same resource group as the create Azure resource.

### All Others

Alerts are configured to be deployed deployed in a dedicated resource group: AlzMonitoring-rg
