# Known Issues

#### VM Log Alert policies fail to remediate.

***error includes: "failed to resolve table or column expression named"***

#####Cause
The underlying data is not present in the Log Analytics table. For VM Alerts please enable [VM Insights](https://github.com/Azure/alz-monitor/wiki/MonitoringandAlerting#Log-Alerts)