# Metric Alerts Details

The following metric alerts have been defined and can deployed within your landing zones via Azure Policy.

The resources, metric alerts and their settings provide you with a starting point to help you address the following monitoring questions:
"What should we monitor in Azure?" and "What alert settings should we use?"  While they are opinionated settings and they are meant to cover the most common Azure Landing Zone components, we encourage you to adjust these settings to suit your monitoring needs based on how you're using Azure.

If you have suggestions for other resources that should be included please open an Issue on this page providing the Azure resource provider and settings you'd like implemented, we can't promise to implement them all but we will look into it.

## Metric Alerts Settings

The values shown for Aggregation, Operator, Threshold, WindowSize, Frequency and Severity have been derived from field experience and what customers have implemented themselves; Alerts are based on Microsoft public guidance where available (indicated by a 'Y' in the Verified column), and on practical application experience where public guidance is not available (indicated by a 'N' in the Verified column). Links to Product Group guidance can be found in the References column and when no guidance is provided we've provided a link to the description of the Metric on learn.microsoft.com.

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-fymr{border-color:inherit;font-weight:bold;text-align:left;vertical-align:top}
.tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-y02l{border-color:inherit;color:#00E;text-align:left;text-decoration:underline;vertical-align:top}
</style>
<table class="tg" style="undefined;table-layout: fixed; width: 1544px">
<colgroup>
<col style="width: 269.316239px">
<col style="width: 283.316239px">
<col style="width: 329.316239px">
<col style="width: 95.316239px">
<col style="width: 148.316239px">
<col style="width: 94.316239px">
<col style="width: 71.316239px">
<col style="width: 64.316239px">
<col style="width: 194.316239px">
</colgroup>
<thead>
  <tr>
    <th class="tg-fymr">AlertName</th>
    <th class="tg-fymr">Component</th>
    <th class="tg-7btt">Metric</th>
    <th class="tg-7btt">Aggregation</th>
    <th class="tg-7btt">Operator</th>
    <th class="tg-7btt">Threshold<br>WindowSize<br>Frequency</th>
    <th class="tg-7btt">Severity</th>
    <th class="tg-7btt">Verified</th>
    <th class="tg-fymr">References</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_bgpavailability_alert.bicep">[DINE] Deploy ExpressRoute Circuits Bgp Availability Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutecircuits</td>
    <td class="tg-c3ow" rowspan="3">BgpAvailability</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">90</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts" target="_blank" rel="noopener noreferrer">Monitor ExpressRoute Alerts</a><br>- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries" target="_blank" rel="noopener noreferrer">ExpressRoute KQL Queries</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_arpavailability_alert.bicep">[DINE] Deploy ExpressRoute Circuits Arp Availability Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutecircuits</td>
    <td class="tg-c3ow" rowspan="3">ArpAvailability</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">90</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts" target="_blank" rel="noopener noreferrer">Monitor ExpressRoute Alerts</a><br>- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries" target="_blank" rel="noopener noreferrer">ExpressRoute KQL Queries</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_qosdropsbitsin_alert.bicep">[DINE] Deploy ExpressRoute Circuits QosDropBitsInPerSecond Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutecircuits</td>
    <td class="tg-c3ow" rowspan="3">QosDropBitsInPerSecond</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts" target="_blank" rel="noopener noreferrer">Monitor ExpressRoute Alerts</a><br>- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries" target="_blank" rel="noopener noreferrer">ExpressRoute KQL Queries</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-ercir_qosdropsbitsout_alert.bicep">[DINE] Deploy ExpressRoute Circuits QosDropBitsOutPerSecond Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutecircuits</td>
    <td class="tg-c3ow" rowspan="3">QosDropBitsOutPerSecond</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#alerts" target="_blank" rel="noopener noreferrer">Monitor ExpressRoute Alerts</a><br>- <a href="https://docs.microsoft.com/en-us/azure/expressroute/monitor-expressroute#sample-kusto-queries" target="_blank" rel="noopener noreferrer">ExpressRoute KQL Queries</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_availability_alert.bicep">[DINE] Deploy KeyVault Availability Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.KeyVault/vaults</td>
    <td class="tg-c3ow" rowspan="3">Availability</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">90</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference" target="_blank" rel="noopener noreferrer">Monitoring KeyVault Reference</a><br>- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault" target="_blank" rel="noopener noreferrer">Monitoring KeyVault</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview" target="_blank" rel="noopener noreferrer">KeyVault Insights Overview</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_capacity_alert.bicep">[DINE] Deploy KeyVault Capacity Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.KeyVault/vaults</td>
    <td class="tg-c3ow" rowspan="3">SaturationShoebox</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">75</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference" target="_blank" rel="noopener noreferrer">Monitoring KeyVault Reference</a><br>- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault" target="_blank" rel="noopener noreferrer">Monitoring KeyVault</a><br><a href="https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview" target="_blank" rel="noopener noreferrer">KeyVault Insights Overview</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_latency_alert.bicep">[DINE] Deploy KeyVault Latency Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.KeyVault/vaults</td>
    <td class="tg-c3ow" rowspan="3">ServiceApiLatency</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">1000</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-y02l" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference" target="_blank" rel="noopener noreferrer">Monitoring KeyVault Reference</a><br>- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault" target="_blank" rel="noopener noreferrer">Monitoring KeyVault</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview" target="_blank" rel="noopener noreferrer">KeyVault Insights Overview</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-kv_requests_alert.bicep">[DINE] Deploy KeyVault Requests Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.KeyVault/vaults</td>
    <td class="tg-c3ow" rowspan="3">ServiceApiResult</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">dynamic</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-y02l" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault-reference" target="_blank" rel="noopener noreferrer">Monitoring KeyVault Reference</a><br>- <a href="https://docs.microsoft.com/en-us/azure/key-vault/general/monitor-key-vault" target="_blank" rel="noopener noreferrer">Monitoring KeyVault</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview" target="_blank" rel="noopener noreferrer">KeyVault Insights Overview</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-aa_totaljob_alert.bicep">[DINE] Deploy Automation Account TotalJob Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Automation/automationAccounts</td>
    <td class="tg-c3ow" rowspan="3">TotalJob</td>
    <td class="tg-c3ow" rowspan="3">Count</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">0</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftautomationautomationaccounts" target="_blank" rel="noopener noreferrer">Azure Automation Azure Monitor Metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_firewallhealth_alert.bicep">[DINE] Deploy AFW FirewallHealth Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/azureFirewalls</td>
    <td class="tg-c3ow" rowspan="3">FirewallHealth</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">90</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-afw_snatportutilization_alert.bicep">[DINE] Deploy AFW SNATPortUtilization Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/azureFirewalls</td>
    <td class="tg-c3ow" rowspan="3">SNATPortUtilization</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">80</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_bgppeerstatus_alert.bicep">[DINE] Deploy VPNG  BGP Peer Status Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">BgpPeerStatus</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingresspacketdropmismatch_alert.bicep">[DINE] Deploy VPNG Ingress Packet Drop Mismatch Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelIngressPacketDropTSMismatch</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">dynamic</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egresspacketdropcount_alert.bicep">[DINE] Deploy VPNG Egress Packet Drop Count Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelEgressPacketDropCount</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">dynamic</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingresspacketdropcount_alert.bicep">[DINE] Deploy VPNG Ingress Packet Drop Count Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelIngressPacketDropCount</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">dynamic</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egresspacketdropmismatch_alert.bicep">[DINE] Deploy VPNG Egress Packet Drop Mismatch Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelEgressPacketDropTSMismatch</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">dynamic</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/firewall/logs-and-metrics#metrics" target="_blank" rel="noopener noreferrer">Overview of Azure Firewall logs and metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutecpuutilization_alert.bicep">[DINE] Deploy VNetG ExpressRoute CPU Utilization Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">ExpressRouteGatewayCpuUtilization</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">90</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutecpuutilization_alert.bicep">[DINE] Deploy VNetG ExpressRoute CPU Utilization Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutegateways</td>
    <td class="tg-c3ow" rowspan="3">ExpressRouteGatewayCpuUtilization</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">80</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/expressroute-monitoring-metrics-alerts#expressroute-gateways" target="_blank" rel="noopener noreferrer">ExpressRoute Monitoring Metrics Alerts for ExpressRoute Gateways</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_capacityutilization_alert.bicep">[DINE] Deploy PDNSZ Capacity Utilization Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/privateDnsZones</td>
    <td class="tg-c3ow" rowspan="3">VirtualNetworkLinkCapacityUtilization</td>
    <td class="tg-c3ow" rowspan="3">Maximum</td>
    <td class="tg-c3ow" rowspan="3">GreaterThanEqualTo</td>
    <td class="tg-c3ow">80</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkprivatednszones" target="_blank" rel="noopener noreferrer">Private DNS Alert Metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_queryvolume_alert.bicep">[DINE] Deploy PDNSZ Query Volume Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/privateDnsZones</td>
    <td class="tg-c3ow" rowspan="3">QueryVolume</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">GreaterThanOrEqual</td>
    <td class="tg-c3ow">500</td>
    <td class="tg-c3ow" rowspan="3">4</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkprivatednszones" target="_blank" rel="noopener noreferrer">Private DNS Alert Metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_recordsetcapacity_alert.bicep">[DINE] Deploy PDNSZ Record Set Capacity Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/privateDnsZones</td>
    <td class="tg-c3ow" rowspan="3">RecordSetCapacityUtilization</td>
    <td class="tg-c3ow" rowspan="3">Maximum</td>
    <td class="tg-c3ow" rowspan="3">GreaterThanOrEqual</td>
    <td class="tg-c3ow">75</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkprivatednszones" target="_blank" rel="noopener noreferrer">Private DNS Alert Metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pdnsz_registrationcapacityutilization_alert.bicep">[DINE] Deploy PDNSZ Registration Capacity Utilization Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/privateDnsZones</td>
    <td class="tg-c3ow" rowspan="3">VirtualNetworkWithRegistrationCapacityUtilization</td>
    <td class="tg-c3ow" rowspan="3">Maximum</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">90</td>
    <td class="tg-c3ow" rowspan="3">2</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkprivatednszones" target="_blank" rel="noopener noreferrer">Private DNS Alert Metrics</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT1H</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_bytesinddosattack_alert.bicep">[DINE] Deploy PIP Bytes in DDoS Attack Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/publicIPAddresses</td>
    <td class="tg-c3ow" rowspan="3">bytesinddos</td>
    <td class="tg-c3ow" rowspan="3">Maximum</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">8000000</td>
    <td class="tg-c3ow" rowspan="3">4</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/monitor-public-ip#alerts" target="_blank" rel="noopener noreferrer">Monitor Public IP Addresses</a><br>- <a href="https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Public IP Addresses  Supported Metrics</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_ddosattack_alert.bicep">[DINE] Deploy PIP DDoS Attack Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/publicIPAddresses</td>
    <td class="tg-c3ow" rowspan="3">ifunderddosattack</td>
    <td class="tg-c3ow" rowspan="3">Maximum</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/monitor-public-ip#alerts" target="_blank" rel="noopener noreferrer">Monitor Public IP Addresses</a><br>- <a href="https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Public IP Addresses - Supported Metrics</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_packetsinddos_alert.bicep">[DINE] Deploy PIP Packets in DDoS Attack Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/publicIPAddresses</td>
    <td class="tg-c3ow" rowspan="3">PacketsInDDoS</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">GreaterThanEqualTo</td>
    <td class="tg-c3ow">40000</td>
    <td class="tg-c3ow" rowspan="3">4</td>
    <td class="tg-c3ow" rowspan="3">Y</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/monitor-public-ip#alerts" target="_blank" rel="noopener noreferrer">Monitor Public IP Addresses</a><br>- <a href="https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Public IP Addresses Supported Metrics</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-pip_vipavailability_alert.bicep">[DINE] Deploy PIP VIP Availability Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/publicIPAddresses</td>
    <td class="tg-c3ow" rowspan="3">VipAvailability</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkpublicipaddresses" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnet_ddosattack_alert.bicep">[DINE] Deploy VNet DDoS Attack Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworks</td>
    <td class="tg-c3ow" rowspan="3">ifunderddosattack</td>
    <td class="tg-c3ow" rowspan="3">Maximum</td>
    <td class="tg-c3ow" rowspan="3">GreaterThanOrEqual</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">1</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworks" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_bandwidthutilization_alert.bicep">[DINE] Deploy VNetG Tunnel Bandwidth Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelAverageBandwidth</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThan</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egress_alert.bicep">[DINE] Deploy VNetG Tunnel Egress Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelEgressBytes</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingress_alert.bicep">[DINE] Deploy VNetG Tunnel Ingress Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelIngressBytes</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_bandwidthutilization_alert.bicep">[DINE] Deploy VPNG Bandwidth Utilization Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">tunnelaveragebandwidth</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">1000000000</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/monitor-vpn-gateway" target="_blank" rel="noopener noreferrer">Monitor VPN Gateway</a><br>- <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/monitor-vpn-gateway-reference" target="_blank" rel="noopener noreferrer">Monitor VPN Gateway Reference</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvpngateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_egress_alert.bicep">[DINE] Deploy VPNG Egress Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">tunnelegressbytes</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">0</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/monitor-vpn-gateway" target="_blank" rel="noopener noreferrer">Monitor VPN Gateway</a><br>- <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/monitor-vpn-gateway-reference" target="_blank" rel="noopener noreferrer">Monitor VPN Gateway Reference</a><a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvpngateways" target="_blank" rel="noopener noreferrer"><span style="color:#905">[</span></a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvpngateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-c3ow">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/8297cc47b5d68fc42abb7fbd4eecd5bcbc5da6a8/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vpng_ingress_alert.bicep">[DINE] Deploy VPNG Ingress Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/vpngateways</td>
    <td class="tg-c3ow" rowspan="3">tunnelingressbytes</td>
    <td class="tg-c3ow" rowspan="3">Total</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">0</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/monitor-vpn-gateway" target="_blank" rel="noopener noreferrer">Monitor VPN Gateway</a><br>- <a href="https://learn.microsoft.com/en-us/azure/vpn-gateway/monitor-vpn-gateway-reference" target="_blank" rel="noopener noreferrer">Monitor VPN Gateway Reference</a><br>- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvpngateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/fdd0ab013ee6f35a53e130384734e20c0a722b54/Observability_L100/Deploy/policyDefinitions/deploy-vpng_ingresspacketdropmismatch_alert.bicep">[DINE] Deploy VPNG Ingress Packet Drop Mismatch Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelIngressPacketDropTSMismatch</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egresspacketdropmismatch_alert.bicep">[DINE] Deploy VNetG Egress Packet Drop Mismatch Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelEgressPacketDropCount</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_ingresspacketdropcount_alert.bicep">[DINE] Deploy VNetG Ingress Packet Drop Count Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelIngressPacketDropCount</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_egresspacketdropmismatch_alert.bicep">[DINE] Deploy VNetG Egress Packet Drop Mismatch Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">TunnelEgressPacketDropTSMismatch</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">GreaterThan</td>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow" rowspan="3">3</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-vnetg_expressroutebitspersecond_alert.bicep">[DINE] Deploy VNetG ExpressRoute Bits Per Second Alert</a></td>
    <td class="tg-0pky" rowspan="3">Microsoft.Network/virtualNetworkGateways</td>
    <td class="tg-c3ow" rowspan="3">ExpressRouteGatewayBitsPerSecond</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnetworkvirtualnetworkgateways" target="_blank" rel="noopener noreferrer">Azure Monitor supported metrics by resource type - Azure Monitor</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_bitsinpersecond_alert.bicep">[DINE] Deploy ERG ExpressRoute Bits In Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutegateways</td>
    <td class="tg-c3ow" rowspan="3">ERGatewayConnectionBitsInPerSecond</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/expressroute-monitoring-metrics-alerts#expressroute-gateways" target="_blank" rel="noopener noreferrer">ExpressRoute Monitoring Metrics Alerts - ExpressRoute-Gateways</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="3"><a href="https://github.com/Azure/alz-monitor/blob/arm-conversion-2023-01-26/src/resources/Microsoft.Authorization/policyDefinitions/deploy-erg_bitsoutpersecond_alert.bicep">[DINE] Deploy ERG ExpressRoute Bits Out Alert</a></td>
    <td class="tg-0pky" rowspan="3">microsoft.network/expressroutegateways</td>
    <td class="tg-c3ow" rowspan="3">ERGatewayConnectionBitsOutPerSecond</td>
    <td class="tg-c3ow" rowspan="3">Average</td>
    <td class="tg-c3ow" rowspan="3">LessThanOrEqual</td>
    <td class="tg-c3ow">1</td>
    <td class="tg-c3ow" rowspan="3">0</td>
    <td class="tg-c3ow" rowspan="3">N</td>
    <td class="tg-0pky" rowspan="3">- <a href="https://docs.microsoft.com/en-us/azure/expressroute/expressroute-monitoring-metrics-alerts#expressroute-gateways" target="_blank" rel="noopener noreferrer">ExpressRoute Monitoring Metrics Alerts - ExpressRoute-Gateways</a></td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
  <tr>
    <td class="tg-baqh">PT5M</td>
  </tr>
</tbody>
</table>

### Activity Log Service Health



| Alert Policy Name                                                                                                                                                                                                                                  | Alert Name                      | PolicyScope     | Category      | properties.incidentType   | Documented   | <div style="width:240px">References</div>                                                                                                                                                                                                                         |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------|:---------------:|:-------------:|:-------------------------:|:------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [[DINE] Deploy Service Health Advisory Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Health.bicep)            | ServiceHealthAdvisoryEvent      | managementGroup | ServiceHealth | ActionRequired            | Y            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Service Health Incident Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Incident.bicep)          | ServiceHealthIncident           | managementGroup | ServiceHealth | Incident                  | Y            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Service Health Maintenance Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Maintenance.bicep)    | ServiceHealthPlannedMaintenance | managementGroup | ServiceHealth | Maintenance               | Y            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Service Health Security Advisory Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-ServiceHealth-Security.bicep) | ServiceHealthSecurityIncident   | managementGroup | ServiceHealth | Security                  | Y            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |

### Activity Log Administrative

The following table lists a number of operational Activity Log alerts to alert your team when certain resources have been deleted.

There isn't any per resource type guidance so what's been provided is some general guidance on alerting on the deletion of specific resources, the list may grow in the future and of course you can create your own following the pattern used for these Activity Log alerts.

| Alert Policy Name                                                                                                                                                                                                                                     | Alert Name                  | PolicyScope     | category       | operationName                                                       | status    | Documented   | <div style="width:240px">References</div>                                                                                                                                                                                                                         |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|:---------------:|:--------------:|:-------------------------------------------------------------------:|:---------:|:------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [[DINE] Deploy Activity Log Azure FireWall Delete Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-AzureFirewall-Del.bicep)       | ActivityAzureFirewallDelete | managementGroup | Administrative | Microsoft.Microsoft.Network/azurefirewalls/delete                   | succeeded | N            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Activity Log Key Vault Delete Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-KeyVault-Del.bicep)                 | ActivityKeyVaultDelete      | managementGroup | Administrative | Microsoft.KeyVault/vaults/delete                                    | succeeded | N            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Activity Log LA Workspace Delete Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-LAWorkspace-Del.bicep)           | ActivityLAWorkspaceDelete   | managementGroup | Administrative | Microsoft.OperationalInsights/workspaces/delete                     | succeeded | N            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Activity Log LA Workspace Regenerate Key Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-LAWorkspace-ReGen.bicep) | ActivityLAWorkspaceRegenKey | managementGroup | Administrative | Microsoft.OperationalInsights/workspaces/regeneratesharedkey/action | succeeded | N            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Activity Log NSG Delete Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-NSG-Del.bicep)                            | ActivityLAWorkspaceDelete   | managementGroup | Administrative | Microsoft.Network/networkSecurityGroups/delete                      | succeeded | N            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
| [[DINE] Deploy Activity Log VPN Gateway Delete Alert](https://github.com/Azure/alz-monitor/blob/448ad43ea7546d6994adde800020abe34b8b4356/src/resources/Microsoft.Authorization/policyDefinitions/deploy-activitylog-VPNGate-Del.bicep)                | ActivityVPNGatewayDelete    | managementGroup | Administrative | Microsoft.Network/vpnGateways/delete                                | succeeded | N            | [Activity Log Service Notifications](https://learn.microsoft.com/en-us/azure/service-health/alerts-activity-log-service-notifications-portal)<br>[Best practices for setting up service health alerts](https://www.microsoft.com/en-us/videoplayer/embed/RE2OtUa) |
