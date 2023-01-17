# ExpressRoute Circuits

## Policy Details

Policy Definition Name and GitHub Path for each alert policy definition

## Alert Processing Rules

<<TBD>>

## Action Groups

<<TBD>>

## Metric Alerts

Add Severity column
    Describe that higher severity would have shorter frequency value.
Delete Mandatory columns
Delete Dimension columns.
Add a colum which points to the policy file in the Repo.
| Component | Metric | Aggregator | Operator | Threshold | WindowSize | Frequency | Dimensions | Mandatory | Recommended |<div style="width:240px">References</div>|
|:----------|:------:|:----------:|:--------:|:---------:|:----------:|:---------:|:----------:|:---------:|:----------:|:---------------------------------------|
| microsoft.network/expressroutecircuits | BgpAvailability         | Average      | LessThan    | 90  | PT5M | PT1M |  Peering Type | No | Y | Common alert set by Customers, based on telemetry gathered by PG.<br/>[Monitor ExpressRoute Alerts](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts)<br/>[ExpressRoute KQL Queries](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries) |
| microsoft.network/expressroutecircuits | ArpAvailability         | Average | LessThan    | 90  | PT5M | PT1M |  Peer | No | Y | Common alert set by Customers, based on telemetry gathered by PG.<br/>[Monitor ExpressRoute Alerts](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts)<br/>[ExpressRoute KQL Queries](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries) |
| microsoft.network/expressroutecircuits | QosDropBitsInPerSecond  | Average | GreaterThan | 100 | PT5M | PT1M | No    | No | N |                                                                                                                                                                                                                                                         |
| microsoft.network/expressroutecircuits | QosDropBitsOutPerSecond | Average | GreaterThan | 100 | PT5M | PT1M | No    | No | N |


## Activity Log Alerts

| Component | Metric |<div style="width:300px">Query</div> |Aggregator | Operator | Threshold | WindowSize | Frequency | Dimensions | Mandatory | Documented |<div style="width:240px">References</div>|
|:----------|:------:|:----------:|:----------:|:--------:|:---------:|:----------:|:---------:|:----------:|:---------:|:----------:|:---------------------------------------|
|||||||||||||

## Log Alerts


| Component | Metric |<div style="width:300px">Query</div> | Aggregator | Operator | Threshold | WindowSize | Frequency | Dimensions | Mandatory | Documented |<div style="width:240px">References</div>|
|:----------|:------:|:------|:----------:|:--------:|:---------:|:----------:|:---------:|:----------:|:---------:|:----------:|:---------------------------------------|
| microsoft.network/expressroutecircuits | BgpAvailability         |`AzureMetrics`<br/>`| where MetricName == "BgpAvailability"`<br/> `| summarize by Average, bin(TimeGenerated, 5m), Resource` <br/> `| render timechart` |0       | LessThan    | 90  | PT5M | PT1M |  Peer | No | Y | [Monitor ExpressRoute Alerts](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts)<br/>[ExpressRoute KQL Queries](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries) |
| microsoft.network/expressroutecircuits | ArpAvailability         |`AzureMetrics`<br/>`| where MetricName == "ArpAvailability"`<br/> `| summarize by Average, bin(TimeGenerated, 5m), Resource` <br/> `| render timechart` |Average | LessThan    | 90  | PT5M | PT1M |  Peer | No | Y | [Monitor ExpressRoute Alerts](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts)<br/>[ExpressRoute KQL Queries](https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries) |
| microsoft.network/expressroutecircuits | BitsInPerSecond  |`AzureMetrics`<br/> `| where MetricName == "BitsInPerSecond"` <br/> `| summarize by Average, bin(TimeGenerated, 1h), Resource` <br/> `| render timechart` |Average | GreaterThan | 100 | PT5M | PT1M | No    | No | N |                                                                                                                                                                                                                                                         |
| microsoft.network/expressroutecircuits | BitsOutPerSecond |```AzureMetrics | where MetricName == "BitsInPerSecond"| summarize by Average, bin(TimeGenerated, 1h), Resource| render timechart``` |Average | GreaterThan | 100 | PT5M | PT1M | No    | No | N |
| microsoft.network/expressroutecircuits | QosDropBitsInPerSecond | `AzureMetrics| where MetricName == "QosDropBitsInPerSecond"` <br/> `| summarize by Average, bin(TimeGenerated, 1h), Resource` <br/> `| render timechart` | Average | GreaterThan | 100 | PT5M | PT1M | No    | No | N |
| microsoft.network/expressroutecircuits | QosDropBitsOutPerSecond | ```AzureMetrics | where MetricName == "QosDropBitsInPerSecond" | summarize by Average, bin(TimeGenerated, 1h), Resource | render timechart```  | Average | GreaterThan | 100 | PT5M | PT1M | No    | No | N |



# Key Vault

## Policy Details

Policy Definition Name and GitHub Path for each alert policy definition

## Alert Processing Rules

<<TBD>>

## Action Groups

<<TBD>>

## Metric Alerts



| Component | Metric | Aggregator | Operator | Threshold | WindowSize | Frequency | Dimensions | Mandatory | Documented |<div style="width:240px">References</div>|
|:----------|:------:|:----------:|:--------:|:---------:|:----------:|:---------:|:----------:|:---------:|:----------:|:---------------------------------------|
| Microsoft.KeyVault/vaults | Availability | Average | LessThan | 90 | PT5M  | PT1M | No | Yes | Yes | - [General Key Vault Alerts](https://learn.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault#alerts)<br/>- [Configuring Key Vault Alerts](https://learn.microsoft.com/en-us/azure/key-vault/general/alert) <br/> - [Key Vault Monitoring Reference](https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference)<br/>- [Monitoring Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault)<br/>- [Key Vault Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview)|
| Microsoft.KeyVault/vaults | SaturationShoebox | Average | GreaterThan | 75 | PT5M | PT1M | No | Yes | Yes | - [General Key Vault Alerts](https://learn.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault#alerts)<br/>- [Configuring Key Vault Alerts](https://learn.microsoft.com/en-us/azure/key-vault/general/alert)<br/> - [Key Vault Monitoring Reference](https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference)<br/>- [Monitoring Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault)<br/>- [Key Vault Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview) |
| Microsoft.KeyVault/vaults | ServiceApiLatency | Average    | GreaterThan | 1000      | PT5M       | PT1M      | No              | Yes       | Y          | - [General Key Vault Alerts](https://learn.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault#alerts)<br/>- [Configuring Key Vault Alerts](https://learn.microsoft.com/en-us/azure/key-vault/general/alert)<br/>- [Key Vault Monitoring Reference](https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference)<br/>- [Monitoring Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault)<br/>- [Key Vault Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview) |
| Microsoft.KeyVault/vaults | ServiceApiResult  | Average    | GreaterThan | dynamic   | PT5M       | PT1M      | StatusCodeClass | Yes       | N          |



## Activity Log Alerts

| Component | Metric | Aggregator | Operator | Threshold | WindowSize | Frequency | Dimensions | Mandatory | Documented |<div style="width:240px">Reference</div>|
|:----------|:------:|:----------:|:--------:|:---------:|:----------:|:---------:|:----------:|:---------:|:----------:|:---------------------------------------|

## Log Alerts

| Component                 | Measure | Alert | Criteria | <div style="width:240px">Query </div> | Operational Dashboard | Mandatory | <div style="width:240px">References </div>                                                |
|:--------------------------|:-------:|:-----:|:--------:|:--------------------------------------|:---------------------:|:---------:|:-------------------------------------------------------------------------------------|
| Microsoft.KeyVault/vaults | Expiry  |  Yes  | Count>0  | --Add Query Here--                    |        Count>0        |    Yes    | Need to review but easier to set up than using eventgrid as already collecting logs. |


