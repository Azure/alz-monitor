# Monitoring and Alerting in ALZ

[TOC]

## ALZ Monitor Alert Approach

The overall approach for enabling alerts in ALZ is to use Azure Policy to deploy relevant alerts as resources are created, configure action group(s), and then use Alert Processing Rules to activate alerts and connect them to the Action Group.

There are two general principles/approaches to enabling alerting in ALZ:

### Centralized

With a **centralized** approach to alerting a central Action Group is used for all alerts, which means a single alerting email (distribution group) address or other configured actions.

Metric alerts are deployed with resources (same resource group) and platform alerts like Service Health / Activity are created in a dedicated resource group, typically in the management platform landing zone. A single Alert Action Group in the management landing zone is configured with a central alerting email address, and Alert Processing Rules enabling filters and connecting alerts to the Action Group.

As an example in the context of ALZ, a single centralized action group is deployed in the "AlzMonitoring-RG" resource group in the management platform landing zone. 

### Decentralized

For a **decentralized** approach every subscription has a dedicated Action Group allowing for more granular control of how to direct alert notifications, for example, for connectivity/networking alerts for the platform connectivity subscription, direct the alerts to the network operations team.

Metric alerts are deployed with resources (in the same resource group) and platform alerts like Service Health / Activity are created in a dedicated resource group, typically in the management platform landing zone. Alert Action Groups are created in each landing zone subscription, allowing each operational area and landing zone subscription to have different alerting email addresses (networking, identity, ops, workloads, etc.) or other supported actions. Alert Processing Rules are created to enable filters and connect alerts to the Action Groups.

As an example in the context of ALZ, an action group is deployed in the "AlzMonitoring-RG" resource group in each subscription.

### ALZ Approach

For ALZ the decentralized approach is followed to allow maximum flexibility in directing alerts. For more information review [What are Azure Monitor Alerts?](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview).

- A single Action Group per subscription will be deployed. This allows customers to configure discrete actions per subscription (different email addresses or other supported actions).
- Alert Processing Rules will target the Action Group in the subscription where the alert originated.

As this is a work in progress, the initial configuration provided by ALZ will configure all Action Groups with the same email distribution group/address through Azure Policy. We may investigate and implement alternative or additional actions in the future (e.g. configure alternate email distribution groups depending on the subscription/service or workload owners/etc.).

ALZ Alerts, Action Groups and Alert Processing Rules are deployed using Azure Policy defined in the platform native Azure Policy JSON format.

## ALZ Monitor Alert Policy Definitions

The following policy definition categories will be enabled as part of ALZ deployments for the hubs and landing zones defined by Enterprise Scale:

- Resource Metrics
- Service and Resource Health
- Activity Logs

As this is a work in progress, in the future we may investigate and include:

- Custom log alerts based on Kusto queries against Log Analytics

#### Resource Metrics

Resource Metric alerts are deployed in the same resource group as the created Azure resource. For example, a resource metric alert for Express Route will be created in the same resource group containing the Express Route Gateway. This is done because these alert types are related to the specific resource id, therefore it makes sense to link the alert to the resource in the same resource group.

#### Service and Resource Health

[Service health](https://learn.microsoft.com/en-us/azure/service-health/overview) provides a personalized view of the health of the Azure services and regions you're using. Resource health provides information about the health of your individual cloud resources such as a specific virtual machine instance.

Service and resource health events are written into the activity log. This means we can create a sub set of activity log alerts that can alert on health events. We create these alerts scoped to each subscription with four separate alerts for each of the four service health categories: Incident, Planned Maintenance, Security Advisories and Health Advisories.
A resource health alert will be created for any resource that goes into an unavailable or degraded state which can be platform or user initiated. We will ignore if the state is unknown as this can lead to erroneous alerting.

#### DNS Zone Alerts

1. RecordSetCapacityUtilization alert
1. RecordSetCount alert
1. QueryVolume alert

## ALZ Monitor Alert Processing Rules

[Alert Processing Rules](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-processing-rules) enable the filtering of alerts and assign alerts to the approriate action groups based on filter criteria.

As this is currently a work in progress, for ALZ we will implement a single Action Group per subscription, and deploy a single Alert Processing Rule without filters to action alerts via the Action Group. This may be revised in the future.

As this is a work in progress, we still need to investigate appropriate filters for Alert Processing Rules for optimal alert processing.

Available filters:

- Alert condition
- Alert context (payload)
- Alert rule id
- Alert name
- Description
- Monitor service
- Resource
- Resource group
- Resource type
- Severity
- Signal type

As an example, we could implement a filter on Severity (Critical, Error, Warning) only, ignoring (Informational, Verbose).
