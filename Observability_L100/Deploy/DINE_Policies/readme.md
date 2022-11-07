# Contains the policies to Audit (and Deploy if out of compliance) the existence of the following alerts



## Policy Definitions

### Service and Resource Health

Service and resource health events are written into the activity log. This means we can create a sub set of activity log alerts that can alert to the health events. As with all activity log alerts these will be raised as severity 4 alerts. We create these alerts scoped to each subscription. Four separate alerts for the four service health categories of Incident, Planned Maintenance, Security Advisories and Health Advisories.
A resource health alerts will be created for any  resource that goes into unavailable or degraded state and that can be platform or user initiated. We will ignore if the state is unknown as this can lead to erroneous alerting.

### DNS Zone Alerts

1. RecordSetCapacityUtilization alert
1. RecordSetCount alert
1. QueryVolume alert