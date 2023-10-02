# Alerts for Azure Landing Zone

>**_Note:_** This Repo is no longer actively maintained, please visit [AMBA Azure landing zone pattern](https://aka.ms/amba/alz) for the latest version hosted in a new GitHub repo. We're in the process of moving Azure Monitor Baseline Alerts (AMBA) to a new home (repo) as part of a wider investment in AMBA across the entire Azure Monitor / Observability area where you will see in the future a broader set of alerts across a wider range of Azure services that you can access from one central location. As part of this move we need to freeze the code located here to allow us to work from the new location. 
> Some considerations:
> - Please fork / star the [new repo](https://aka.ms/amba) and work from there moving forward
> - You will no longer be able to submit issues here as we archive this repo
> - We plan to link existing open issues to a new issue in the new repo
> - We have updated and simplified how to deploy the AMBA for ALZ pattern and no longer use bicep. Updated guidance can be found [here](https://aka.ms/amba/alz/deploy)

## Disclaimer

Please note that the policies in this GitHub repository are currently in development and may be subject to frequent changes and updates. This means that the functionality and features of the polices may change without notice. As such, you are advised to ensure that the policies are tested thoroughly in a test environment before considering moving to production.

Additionally you are advised to reach out to the authors of this repository to discuss the policies and their suitability for your environment, before deploying them in production. To do so create an issue [here](https://github.com/alz-monitor/issues), and we will get back to you as soon as possible.

By accessing or using the code in this repository, you agree to assume all risks associated with its use and to use it at your own discretion and risk. Microsoft shall not be liable for any damages or losses resulting from the use of this code. For support details, please see the [Support section](https://github.com/Azure/alz-monitor/blob/main/SUPPORT.md).

## Overview

One of the most common questions faced when working with customers is, "What should we monitor in Azure?" and "What thresholds should we configure our alerts for?"

There isn't definitive list of what you should monitor when you deploy something to Azure because "it depends", on what services you're using and how the services are used, which will in turn dictate what you should monitor and what thresholds the metrics you do decide to collect are and what errors you should alert on in logs.

Microsoft has tried to address this by providing a number of 'insights or solutions' for popular services which pull together all the things you should care about ([Storage Insights](https://learn.microsoft.com/en-us/azure/storage/common/storage-insights-overview), [VM Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-overview), [Container Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-overview)); but what about everything else???

The purpose of this project is to focus on monitoring for Azure Landing Zone as a common set of Azure resources/services that are configured in a similar way across organizations. We know that every organization is different, as such we also include guidance on how this can be used in custom brownfield scenarios that don´t align with ALZ. This provided us with a starting point on addressing "What should be monitored in Azure?" It also provides an example of how to monitor-at-scale while leveraging Infrastructure-as-code principles.
This project is an opinionated view on what you should monitor for the key components of your Azure Landing Zone within the Platform and Landing Zone scope. i.e:

- Express Route Circuits
- Express Route Gateways
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

In addition to the above of course the alerts need to go somewhere. To that end a generic action group and alert processing rule is deployed to every subscription in scope, also via policy. For more details around this, as well as the reasoning behind this approach please refer to [Monitoring and Alerting in ALZ](../../wiki/Monitoring-and-Alerting-in-ALZ).

## 📣Feedback 📣

Once you've had an opportunity to deploy the solution we'd love to hear from you! Click [here](https://aka.ms/alz/monitor/feedback) to leave your feedback.

If you have encountered an issue with Azure Baseline Alerts for ALZ, please see our [SUPPORT](https://github.com/Azure/alz-monitor/blob/9777cbaf347138e613a0a24391f9261294d18481/SUPPORT.md#L3) page.

## Deployment Guide

We have a [Deployment Guide](../../wiki/Introduction-to-deploying-ALZ-Monitor) available for guidance on how to consume the contents of this repo.

## Wiki

Please see the content in the [wiki](https://github.com/Azure/alz-monitor/wiki) for more detailed information about the repo and various other pieces of documentation.

## Known Issues

Please see the [Known Issues](https://github.com/Azure/alz-monitor/wiki/KnownIssues) in the wiki.

## Frequently Asked Questions

Please see the [Frequently Asked Questions](https://github.com/Azure/alz-monitor/wiki/FAQ) in the wiki.

## Dependencies

This project uses the bicep modules from the [CARML](https://github.com/Azure/ResourceModules), version [0.7.0](https://github.com/Azure/ResourceModules/releases/tag/v0.7.0), and the modules from [ALZ-Bicep](https://github.com/Azure/ALZ-Bicep/tree/main/infra-as-code/bicep), version [0.10.2](https://github.com/Azure/ALZ-Bicep/releases/tag/v0.10.2). As the primary goal of the project is to provide policy baselines for consumption by reference ALZ implementations as well as implementations not aligned to ALZ, these modules are unlikely to change from a repo standpoint, and will indeed be completely disconnected once moving to ALZ reference implementations, since baselines there are all JSON by necessity.

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

> Details on contributing to this repo can be found [here in the wiki](https://github.com/azure/alz-monitor/wiki/Contributing)

## Telemetry

When you deploy the IP located in this repo, Microsoft can identify the installation of said IP with the deployed Azure resources. Microsoft can correlate these resources used to support the software. Microsoft collects this information to provide the best experiences with their products and to operate their business. The telemetry is collected through customer usage attribution. The data is collected and governed by [Microsoft's privacy policies](https://www.microsoft.com/trustcenter).

If you don't wish to send usage data to Microsoft, or need to understand more about its' use details can be found [here](https://github.com/azure/alz-monitor/wiki/Telemetry).

## Trademarks

This project may contain trademarks or logos for projects, products, or services.
Authorized use of Microsoft trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
