# ALZ Monitor Alert Approach

The overall approach for enabling alerts in ALZ is to use Azure Policy to deploy relevant alerts as resources are created, configure action group(s), and then use Alert Processing Rules to activate alerts and connect them to the Action Group.

There are two general principles/approaches to enabling alerting in ALZ:

- Centralized
- Decentralized

These options would need to be paramaterized in the reference implementations (Portal Accelerator, ALZ-Terraform and ALZ-Bicp).

## Centralized

The key distinction for a centralized approach is that there is a central Action Group that is used for all alerts, which means a single alerting email (distribution group) address.

Metric alerts are deployed with resources (same resource group). Platform alerts like Service Health / Activity are created in a dedicated resource group, typically in the management platform landing zone. A single Alert Action Group in the management landing zone configured with a central alerting email address, and Alert Processing Rules enabling filters and connecting alerts to the Action Group.

## Decentralized

The key distinction for a decentralized approach is that every subscription has a dedicated Action Group allowing for more granular control of how to direct alert notifications, for example, for connectivity/netorking alerts for the platform connectivity subscription, direct the alerts to the network operations team.

Metric alerts are deployed with resources (in the same resource group). Platform alerts like Service Health / Activity are created in a dedicated resource group, typically in the management platform landing zone. Alert Action Groups are created in each landing zone subsccription, allowing each operational area and landing zone subscription to have different alerting email addresses (networking, identity, ops, workloads, etc.). Alert Processing Rules are created to enable filters and connect alerts to the Action Groups.
