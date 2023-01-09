# ALZ Monitor Alert Action Groups

Alert Action Groups define the action to take when an alert is associated with it. For ALZ we will limit this action to sending an email to a provide email (distribution group) address.

[ALZ Monitor Alert Approach](https://github.com/Azure/alz-monitor/docs/wiki/alertapproach.md) defines two approaches to implementing Action Groups.

## Deployment

### Mechanism

Need to determine the best mechanism to deploy action groups in relation to ALZ.

TODO: To be tested and validated, options:

- Code -> ARM/Bicep/Terraform : will potentially be complicated and requires maintenance in multiple repos (RIs)
- Policy : more consistent with overall ALZ approach and much simpler to maintain as it would be managed from the Enterprise-Scale repository (along with all the alert policies). Additionally, using policy enables the automatic creation of an Action Group when the subscription is created - however, need to determine how to specify the email  (distribution group) address.

### Centralized Action Group

Propose hosting the action group in the "AlzMonitoring-RG" resource group in the management platform landing zone. This is a simpler approach and only supports a single email (distribution group) address for all alert forwarding. This might be too restrictive for certain scenarios

Policy Scope: Single subscription

### Decentralized Action Group

Propose hosting the action group in the "AlzMonitoring-RG" resource group in each subscription. This approach is best configured through policy, however, need to investigate how to configure email (distribution group) address for alert forwarding.  A single email could be used across each deployed subscription action group with the possibility  and allowing different mails per subscription.  The action groups will be triggered through Alert Processing Rules that can only be scoped to subscription at the highest level so again would fit into this pattern

Policy Scope: Management Group


