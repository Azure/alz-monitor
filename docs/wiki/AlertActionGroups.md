# ALZ Monitor Alert Action Groups

Alert Action Groups define the action to take when an alert is associated with it. For ALZ we will limit this action to sending an email to a provided email (distribution group) address.

[ALZ Monitor Alert Approach](https://github.com/Azure/alz-monitor/wiki/alertapproach.md) defines two approaches to implementing Action Groups.

## Deployment

### Mechanism

Need to determine the best mechanism to deploy action groups in relation to ALZ.

TODO: To be tested and validated, options:

- Code -> ARM/Bicep/Terraform : will potentially be complicated and requires maintenance in multiple repos (RIs)
- Policy : more consistent with overall ALZ approach and much simpler to maintain as it would be managed from the Enterprise-Scale repository (along with all the alert policies). Additionally, using policy enables the automatic creation of an Action Group when the subscription is created - however, need to determine how to specify the email  (distribution group) address.

## Action Groups

Action Groups provide the action capability (what to do with the alert) when an alert is fired. For ALZ we will default to using a provided email address to send the alert details to.

There are two patterns for consideration on how to deploy Action Groups in ALZ:

#### Centralized Action Group

A single centralized action group in the "AlzMonitoring-RG" resource group in the management platform landing zone. This is a simpler approach and only supports a single email (distribution group) address for all alert forwarding. This mayt be too restrictive for certain scenarios.

Policy Scope: Single subscription

#### Decentralized Action Group

An action group in the "AlzMonitoring-RG" resource group in each subscription. This approach is best configured through policy, however, need to validate how to configure email (distribution group) address for alert forwarding.  A single email address could be used across each deployed subscriptions action group, or allows the configuration of different email addresses per subscription/workload/infrastructure area.  The action groups will be triggered through Alert Processing Rules that can only be scoped to subscription at the highest level so would fit into this pattern.

Policy Scope: Management Group/Subscription

### ALZ Decision

The decision is to follow the decentralized approach and provision a single Action Group per subscription. This allows customers to configure discrete actions per subscription (different email addresses or other supported actions), although we will default to a single email address (distribution group) for all Action Groups as part of the initial Azure Landing Zone integration enabled through Azure Policy.

Alert Processing Rules will target the Action Group in the subscription where the alert originated.

The initial configuration provided by ALZ will configure all Action Groups with the same email distribution group/address (through Policy). However, customers may choose to configure alternate email distribution groups depending on the subscription/service or workload owners/etc.
