There are three pipelines as follows:

### <a name='githubworkflowsdeploy-hub-networking.yml'></a>.github/workflows/deploy-hub-networking.yml

This pipeline is started manually only and deploys the following:

* Management group structure hubnw with four subscriptions. Three for the various platform areas and one for the landing zones area (corp)
* Log analytics workspace and automation account in the management subscription
* HUB vNet, Azure Firewall, private DNS zones, ER Gateway, VPN gateway and Bastion etc. in connectivity subscription. Note that DDoS is not enabled (cost reasons)
* Spoke vnet peered to hub vnet and UDR i landing zone subscription
* Default ALZ custom role definitions (no assignments)
* ALZ custom policy/initiative definitions
* ALZ Custom Monitor policy definitions (from ./Observability_L100/Deploy/policyDefinitions), actual deployment happens through ./Observability_L100/Deploy/deploy_dine_policies.bicep.
* Default ALZ policy assignments except for DDoS (cost reasons)
* ALZ Custom Monitor policy assignments, deployment happens through ./Observability_L100/Deploy/policyAssignDeploy.bicep
The workflow is set for manual runs only, i.e. you need to run it from [here](https://github.com/Azure/alz-monitor/actions/workflows/deploy-hub-networking.yml)

### <a name='githubworkflowsdeploy-vwan-networking.yml'></a>.github/workflows/deploy-vwan-networking.yml

This pipeline is started manually only and  deploys the following:

* Management group structure vwan with four subscriptions. Three for the various platform areas and one for the landing zones area (corp)
* Log analytics workspace and automation account in the management subscription
* vWan hub, Azure Firewall, private DNS zones, ER Gateway, VPN gateway etc in connectivity subscription. Note that DDoS is not enabled (cost reasons)
* Spoke vnet connected to vWan hub and UDR in landing zone subscription
* Default ALZ custom role definitions (no assignments)
* ALZ custom policy/initiative definitions
* ALZ Custom Monitor policy definitions (from ./Observability_L100/Deploy/policyDefinitions), actual deployment happens through ./Observability_L100/Deploy/deploy_dine_policies.bicep.
* Default ALZ policy assignments except for DDoS (cost reasons)
* ALZ Custom Monitor policy assignments, deployment happens through ./Observability_L100/Deploy/policyAssignDeploy.bicep
The workflow is set for manual runs only, i.e. you need to run it from [here](https://github.com/Azure/alz-monitor/actions/workflows/deploy-vwan-networking.yml)

### <a name='githubworkflowsdelete-networkingresources.yml'></a>.github/workflows/delete-networking resources.yml

This pipeline can be started manually, but also runs at 7 PM EST every day to delete the following:

* ARM deployments to hubnw management group hierarchy
* Resource group containing HUB vNet, Azure Firewall, private DNS zones, ER Gateway, VPN gateway and Bastion etc. in connectivity subscription
* Resource group containing spoke vnet peered to hub vnet and UDR i landing zone subscription
* ARM deployments to vwan management group hierarchy
* Resource group containing vWan hub, Azure Firewall, private DNS zones, ER Gateway, VPN gateway etc in connectivity subscription
* Resource group containing Spoke vnet connected to vWan hub and UDR in landing zone subscription
The workflow is set to run every day at 12:00 AM UTC (should be 7pm EST), but can also be run manually from [here](https://github.com/Azure/alz-monitor/actions/workflows/delete-networking-resources.yml)