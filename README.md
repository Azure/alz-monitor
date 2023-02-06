# Alerts for Azure Landing Zone

## Overview

One of the most common questions faced when working with customers is, "What should we monitor in Azure?" and "What thresholds should we configure our alerts for?"

There isn't definitive list of what you should monitor when you deploy something to Azure because "it depends", on what services you're using and how the services are used, which will in turn dictate what you should monitor and what thresholds the metrics you do decide to collect are and what errors you should alert on in logs.

Microsoft has tried to address this by providing a number of 'insights or solutions' for popular services which pull together all the things you should care about ([Storage Insights](https://learn.microsoft.com/en-us/azure/storage/common/storage-insights-overview), [VM Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-overview), [Container Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-overview)); but what about everything else???

Let's reduce the list of what we should monitor to something a bit more manageable... Let's look at Azure Landing Zone. It's a common set of Azure resources/services that are configured in a similar way across organizations. (Of course there will be exceptions but we'll get to that.)

 This project is a opinionated view on What you should monitor for the key components of your Azure Landing Zone within the Platform scope. I.e:

- Express Route Circuits
- Azure Firewalls
- Virtual Networks
- Virtual Network gateways
- Log Analytics workspaces
- Private DNS zones
- Azure Key Vaults

Monitoring baselines for the above components are proposed to be deployed leveraging Azure Policy and has been bundled into Azure Policy initiatives for ease of deployment and management. In addition to the components mentioned there are also a number of other component alerts included in the repo, but outside any initiatives, or disabled by default. These components are:

- Storage accounts
- Network security groups
- Azure route tables

In addition to the component specific alerts mentioned above the repo also contains policies for deploying service health alerts by subscription. 

Alerts are based on Microsoft public guidance where available, and on practical application experience where public guidance is not available. For more details on which alerts are included please refer to [Alert Details](https://github.com/Azure/alz-monitor/wiki/AlertsDetails). 

For details on how policies are grouped into initiatives please refer to [Azure Policy Initiatives](https://github.com/Azure/alz-monitor/wiki/AzurePolicyInitiatives)

In addition to the above of course the alerts need to go somewhere. To that end a generic action group and alert processing rule is deployed to every subscription in scope, also via policy. For more details around this, as well as the reasoning behind this approach please refer to [Monitoring and Alerting in ALZ](https://github.com/Azure/alz-monitor/wiki/MonitoringAndAlerting).


## Wiki

Please see the content in the [wiki](https://github.com/Azure/alz-monitor/wiki) for more detailed information about the repo and various other pieces of documentation.

## Known Issues

Please see the [Known Issues](https://github.com/Azure/alz-monitor/wiki/KnownIssues) in the wiki.

## Consumer Guide
We have a [Consumer Guide](https://github.com/Azure/alz-monitor/wiki/ConsumerGuide) available for guidance on how to consume the contents of this repo.

## Dependencies

This project uses the bicep modules from the [CARML](https://github.com/Azure/ResourceModules), version [0.7.0](https://github.com/Azure/ResourceModules/releases/tag/v0.7.0), and the modules from [ALZ-Bicep](https://github.com/Azure/ALZ-Bicep/tree/main/infra-as-code/bicep), version [0.10.2](https://github.com/Azure/ALZ-Bicep/releases/tag/v0.10.2). As the primary goal of the project is to provide policy baselines for consumption by reference ALZ implementations as well as potentially implementations not aligned to ALZ, these modules are unlikely to change from a repo standpoint.


## Contributing

This project welcomes contributions and suggestions.
Most contributions require you to agree to a Contributor License Agreement (CLA)
declaring that you have the right to, and actually do, grant us the rights to use your contribution.
For details, visit [https://cla.opensource.microsoft.com](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment).
Simply follow the instructions provided by the bot.
You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

> Details on contributing to this repo can be found [here in the wiki](https://github.com/azure/alz-monitor/wiki/Contributing) 👍

## Telemetry

When you deploy the IP found in this repo, Microsoft can identify the installation of said IP with the deployed Azure resources. Microsoft can correlate these resources used to support the software. Microsoft collects this information to provide the best experiences with their products and to operate their business. The telemetry is collected through customer usage attribution. The data is collected and governed by [Microsoft's privacy policies](https://www.microsoft.com/trustcenter).

If you don't wish to send usage data to Microsoft, details on how to turn it off can be found [here.](https://github.com/azure/alz-monitor/wiki/Telemetry).

## Trademarks

This project may contain trademarks or logos for projects, products, or services.
Authorized use of Microsoft trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.




![Monitoring Layers](media\Layers.png)

The next challenge we've faced is how do you do this at scale in a repeatable way? To be honest there weren't a lot of examples available on how to do this, even if you used Infrastructure-as-Code, each person had their own way of doing things, let's develop a common deployment method that if someone is just starting out and don't have the experience they can get up and running with a scaleable method to deploy Azure Monitor alerts.

If you have a way to deploy Azure Monitor alerts but struggle determining what to monitor and what thresholds to set, you can use the thresholds here for your Azure Landing zones.

Do you need to have Azure Landing zones deployed for this to work?

*No but you will need to be using Azure Management groups and for now our focus is on the resources frequently deployed as part of Azure Landing Zone deployments.*

Do you need to use the thresholds we've defined in the metric rule alert?

*It's provided as a starting point, we've based the initial threshold on what we've seen and what Microsoft's documentation recommends. You will need to adjust the thresholds at some point.*

*You will need to observe and if the alert is too chatty, adjust the threshold up; if it's not alerting when there's a problem, adjust the threshold down a bit, (or vice-versa depending on what metric or log error is being used as a monitoring source). The key thing is you'll need to investigate, leverage the insights if they are available, or create a workbook or dashboard to help you out.*

Do we need to use these metrics or can we replace them with other ones?

*The metric rules we've created are based on recommendations from Microsoft documentation and field exprience. How you're using Azure resources may also be different so tailor the alerts to suit your needs. One of the other goals of this project is to help you have a way to do Azure Monitor alerts at scale, create new rules with your own thresholds. We'd love to hear about your new rules too so feel free to share back.*

## <a name='Dependencies'></a>Dependencies

This project uses the bicep modules from the [CARML](https://github.com/Azure/ResourceModules), version [0.7.0](https://github.com/Azure/ResourceModules/releases/tag/v0.7.0). We will work to keep this as compatible with the [CARML](https://github.com/Azure/ResourceModules) repo but for the moment our priority is to build this project up as much as possible so things may break if you use a more current version of the Bicep modules found in [CARML](https://github.com/Azure/ResourceModules).

## <a name='Roadmap'></a>Roadmap

Going back to our layered approach we dediced to first tackle creating Metric alerts because they are responsive and alerts are relatively inexpensive because it's pre-computed and stored in the system, where as log alerts are stored in a Log Analytics Workspace and have had some sort of logic operation performed on the data. Click [here](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-types#metric-alerts) for more information on Metric alerts.

Next we're going to tackle Service Health alerts, knowing when there's an outage, planned maintenance and other health advisories for the services you're using. These types of alerts rely on information in the ActivityLog. Click [here](https://learn.microsoft.com/en-us/azure/service-health/overview) for more information on Service Health Alerts.

The final area we're going to tackle is log alerts and as stated earlier the data is collected in a Log Analytics Workspace and some sort of logic operation is performed on the data which means there's charge for using these types of alerts.

* Where possible we're going to focus on queries which use the [ScheduledQueryRules API](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-log-api-switch) and [Metric alerts for Logs](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-metric-logs).

* ActivityLog alerts we may create additional alerts based on data found in the ActivityLog Alerts that are not Service Health related.

## <a name='Prerequisites'></a>Prerequisites

* VSCode
* Bicep Extension
* Azure subscriptions where you want to apply alerts.
* Management Groups that manage the Azure subscriptions
* Must have [permission](https://learn.microsoft.com/en-us/azure/governance/policy/overview#azure-rbac-permissions-in-azure-policy) to assign policy initiatives/defintions to management groups
* Azure CLI
* Azure PowerShell (optional if you want to use it to deploy the code.)

## <a name='MetricAlertPolicyDeploymentSteps'></a>Metric Alert Policy Deployment Steps

The intention of the policies is to provide a common set of metrics and thresholds to monitor all Azure Landing Zone resources which is why you will want to deploy this as high up in your Azure Management group structure to ensure that all subscriptions are included and the steps below will cover that specific scenario. If there are other scenarios you'd like to see or have applied the policies at a different level within your Azure Management group structure send us feedback through GitHub Issues. <<Link>>

1. Update the parameters.json to suit your environment.
2. Login to the subscription you want to deploy the metric alerts to.
3. From the Azure CLI type:
```az deployment mg create --name <'ManagementGroupName'> --location <'EastUS'> --management-group-id <'ManagementGroupName'> --template c:\\azuredeploy.json --parameters @parameters.json```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
