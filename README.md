# Rules of engagement
Please remember to create all contributions as branches and create a pull request when you are ready to merge with main. 

There are three pipelines as follows:
## .github/workflows/deploy-hub-networking.yml
This pipeline is started manually only and deploys the following:
- Management group structure hubnw with four subscriptions. Three for the various platform areas and one for the landing zones area (corp)
- Log analytics workspace and automation account in the management subscription
- HUB vNet, Azure Firewall, private DNS zones, ER Gateway, VPN gateway and Bastion etc. in connectivity subscription. Note that DDoS is not enabled (cost reasons)
- Spoke vnet peered to hub vnet and UDR i landing zone subscription
- Default ALZ custom role definitions (no assignments)
- ALZ custom policy/initiative definitions
- ALZ Custom Monitor policy definitions (from ./Observability_L100/Deploy/policyDefinitions), actual deployment happens through ./Observability_L100/Deploy/deploy_dine_policies.bicep.
- Default ALZ policy assignments except for DDoS (cost reasons)
- ALZ Custom Monitor policy assignments, deployment happens through ./Observability_L100/Deploy/policyAssignDeploy.bicep
The workflow is set for manual runs only, i.e. you need to run it from [here](https://github.com/Azure/alz-monitor/actions/workflows/deploy-hub-networking.yml)


## .github/workflows/deploy-vwan-networking.yml
This pipeline is started manually only and  deploys the following:
- Management group structure vwan with four subscriptions. Three for the various platform areas and one for the landing zones area (corp)
- Log analytics workspace and automation account in the management subscription
- vWan hub, Azure Firewall, private DNS zones, ER Gateway, VPN gateway etc in connectivity subscription. Note that DDoS is not enabled (cost reasons)
- Spoke vnet connected to vWan hub and UDR in landing zone subscription
- Default ALZ custom role definitions (no assignments)
- ALZ custom policy/initiative definitions
- ALZ Custom Monitor policy definitions (from ./Observability_L100/Deploy/policyDefinitions), actual deployment happens through ./Observability_L100/Deploy/deploy_dine_policies.bicep.
- Default ALZ policy assignments except for DDoS (cost reasons)
- ALZ Custom Monitor policy assignments, deployment happens through ./Observability_L100/Deploy/policyAssignDeploy.bicep
The workflow is set for manual runs only, i.e. you need to run it from [here](https://github.com/Azure/alz-monitor/actions/workflows/deploy-vwan-networking.yml)

## .github/workflows/delete-networking resources.yml
This pipeline can be started manually, but also runs at 7 PM EST every day to delete the following:
- ARM deployments to hubnw management group hierarchy
- Resource group containing HUB vNet, Azure Firewall, private DNS zones, ER Gateway, VPN gateway and Bastion etc. in connectivity subscription
- Resource group containing spoke vnet peered to hub vnet and UDR i landing zone subscription
- ARM deployments to vwan management group hierarchy
- Resource group containing vWan hub, Azure Firewall, private DNS zones, ER Gateway, VPN gateway etc in connectivity subscription
- Resource group containing Spoke vnet connected to vWan hub and UDR in landing zone subscription
The workflow is set to run every day at 12:00 AM UTC (should be 7pm EST), but can also be run manually from [here](https://github.com/Azure/alz-monitor/actions/workflows/delete-networking-resources.yml)



# Alerts for Azure Landing Zone

<!-- vscode-markdown-toc -->
- [Dependencies](#Dependencies)
- [Roadmap](#Roadmap)
- [Prerequisites](#Prerequisites)
- [Metric Alert Policy Deployment Steps](#MetricAlertPolicyDeploymentSteps)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

One of the most common questions we've faced in working with Customers is, "What should we monitor in Azure?" and "What thresholds should we configure our alerts for?"

We started thinking about our experiences on our customer projects where we were working with them to establish how they would manage their Azure Landing Zones, eventually we'd come to the age old question, "What should we monitor?" and "What thresholds should we set?"

There isn't definitive list of what you should monitor when you deploy something to Azure because "it depends", on what services you're using and how the services are used which will dictate what you should monitor and what thresholds the metrics you do decide to collect are and what errors you should alert on in logs.

Microsoft has tried to address this by providing a number of 'insights or solutions' for popular services which pull together all the things you should care about ([Storage Insights](https://learn.microsoft.com/en-us/azure/storage/common/storage-insights-overview), [VM Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-overview), [Container Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-overview)); but what about everything else???

Let's reduce the list of what we should monitor to something a bit more manageable... Let's look at the Azure Landing Zone. It's a common set of Azure resources/services that are configured in a similar way across organizations. (Of course there will be exceptions but we'll get to that.)

 What you should monitor are the key components of your Azure Landing Zones within the Platform/Shared landing zones and the pieces which stretch into application or workload subscriptions and then add monitoring to the resources which use those landing zone components.

 Example:

  -Storage Accounts
  -ASR Vaults
  -VNETs and subnets
  -Log Analytics workspace/s
  -DNS
  -Azure Firewall or 3rd Party NVA (Note: we won't be providing guidance on 3rd Party NVA monitoring, NVA vendors are in the best position to provide you that)
  -Key Vaults

 As for what thresholds should be set we should set?

 Look to the documentation Microsoft has provided for the Azure resources, there's a wealth of information to get you started, some of those recommedations are short simple metric queries, some are slightly more complex log alerts and sometimes there's a lot to read through such as with [Storage Accounts](https://learn.microsoft.com/en-us/azure/storage/blobs/blob-storage-monitoring-scenarios).

 An important part that's missed often is Service Health alerts, getting those can save you a lot of headaches and needless troubleshooting if you know first that there's an issue with the Azure resource service and not how you're using it.

We also thought to look at this using a layered approach within Azure Landing Zone.
Identify platform metrics we think you should care about.
Next, what Service Health Alerts for resources that are important to us.
After that, what log alerts should be used.

![Monitoring Layers](.github\media\Layers.png)

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

- Where possible we're going to focus on queries which use the [ScheduledQueryRules API](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-log-api-switch) and [Metric alerts for Logs](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-metric-logs).

- ActivityLog alerts we may create additional alerts based on data found in the ActivityLog Alerts that are not Service Health related.

## <a name='Prerequisites'></a>Prerequisites

- VSCode
- Bicep Extension
- Azure subscriptions where you want to apply alerts.
- Management Groups that manage the Azure subscriptions
- Must have [permission](https://learn.microsoft.com/en-us/azure/governance/policy/overview#azure-rbac-permissions-in-azure-policy) to assign policy initiatives/defintions to management groups
- Azure CLI
- Azure PowerShell (optional if you want to use it to deploy the code.)

## <a name='MetricAlertPolicyDeploymentSteps'></a>Metric Alert Policy Deployment Steps

The intention of the policies is to provide a common set of metrics and thresholds to monitor all Azure Landing Zone resources which is why you will want to deploy this as high up in your Azure Management group structure to ensure that all subscriptions are included and the steps below will cover that specific scenario. If there are other scenarios you'd like to see or have applied the policies at a different level within your Azure Management group structure send us feedback through GitHub Issues. <<Link>>

1. Update the parameters.json to suit your environment.
2. Login to the subscription you want to deploy the metric alerts to.
3. From the Azure CLI type:
```az deployment mg create --name <'ManagementGroupName'> --location <'EastUS'> --management-group-id <'ManagementGroupName'> --template c:\\azuredeploy.json --parameters @parameters.json```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

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
