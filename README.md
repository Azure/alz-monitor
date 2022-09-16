# Rules of engagement
There are three pipelines as follows:
## .github/workflows/deploy-hub-networking.yml
This pipeline deploys the following:
- Management group structure hubnw with four subscriptions. Three for the various platform areas and one for the landing zones area (corp)
- Log analytics workspace and automation account in the management subscription
- HUB vNet, Azure Firewall, private DNS zones, ER Gateway, VPN gateway and Bastion etc. in connectivity subscription. Note that DDoS is not enabled (cost reasons)
- Spoke vnet peered to hub vnet and UDR i landing zone subscription
- Default ALZ custom role definitions (no assignments)
- ALZ custom policy/initiative definitions
- Default ALZ policy assignments except for DDoS (cost reasons)
The workflow is set for manual runs only, i.e. you need to run it from [here](https://github.com/Azure/alz-monitor/actions/workflows/deploy-hub-networking.yml)


## .github/workflows/deploy-vwan-networking.yml
This pipeline deploys the following:
- Management group structure vwan with four subscriptions. Three for the various platform areas and one for the landing zones area (corp)
- Log analytics workspace and automation account in the management subscription
- vWan hub, Azure Firewall, private DNS zones, ER Gateway, VPN gateway etc in connectivity subscription. Note that DDoS is not enabled (cost reasons)
- Spoke vnet connected to vWan hub and UDR in landing zone subscription
- Default ALZ custom role definitions (no assignments)
- ALZ custom policy/initiative definitions
- Default ALZ policy assignments except for DDoS (cost reasons)
The workflow is set for manual runs only, i.e. you need to run it from [here](https://github.com/Azure/alz-monitor/actions/workflows/deploy-vwan-networking.yml)

## .github/workflows/delete-networking resources.yml
This pipeline deletes the following:
- Resource group containing HUB vNet, Azure Firewall, private DNS zones, ER Gateway, VPN gateway and Bastion etc. in connectivity subscription
- Resource group containing spoke vnet peered to hub vnet and UDR i landing zone subscription
- Resource group containing vWan hub, Azure Firewall, private DNS zones, ER Gateway, VPN gateway etc in connectivity subscription
- Resource group containing Spoke vnet connected to vWan hub and UDR in landing zone subscription
The workflow is set to run every day at 12:00 AM UTC (should be 7pm EST), but can also be run manually from [here](https://github.com/Azure/alz-monitor/actions/workflows/delete-networking-resources.yml)



# Project

> This repo has been populated by an initial template to help get you started. Please
> make sure to update the content to build a great experience for community-building.

As the maintainer of this project, please make a few updates:

- Improving this README.MD file to provide a great experience
- Updating SUPPORT.MD with content about this project's support experience
- Understanding the security reporting process in SECURITY.MD
- Remove this section from the README

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
