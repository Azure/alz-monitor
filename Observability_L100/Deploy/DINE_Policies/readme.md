# Contains the policies to Audit (and Deploy if out of compliance) the existence of the following alerts



## Policy Definitions

### Service and Resource Health

[Service health](https://learn.microsoft.com/en-us/azure/service-health/overview) provides a personalized view of the health of the Azure services and regions you're using. Resource health provides information about the health of your individual cloud resources such as a specific virtual machine instance.

Service and resource health events are written into the activity log. This means we can create a sub set of activity log alerts that can alert to the health events. As with all activity log alerts these will be raised as severity 4 alerts. We create these alerts scoped to each subscription. Four separate alerts for the four service health categories of Incident, Planned Maintenance, Security Advisories and Health Advisories.
A resource health alerts will be created for any resource that goes into an unavailable or degraded state and that can be platform or user initiated. We will ignore if the state is unknown as this can lead to erroneous alerting.

For activity log alerts will be looking for any delete activity log events for the following resources within the subscriptions: Key vault, Log Analytics workspaces, Azure Firewall and Network Security Groups





### DNS Zone Alerts

1. RecordSetCapacityUtilization alert
1. RecordSetCount alert
1. QueryVolume alert

