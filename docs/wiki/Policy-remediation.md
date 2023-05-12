# Policy remediation
The policies are all deploy-if-not-exists, by default, meaning that any new deployments will be influenced by them. Therefore, if you are deploying in a greenfield scenario and will afterwards be deploying any of the covered resource types, including subscriptions, then the policies will take effect and the relevant alert rules, action groups and alert processing rules will be created. 
If you are in a brownfield scenario on the other hand, policies will be reporting non-compliance for resources in scope, but to remediate non-compliant resources you will need to initiate remediation. This can be done either through the portal, on a policy-by-policy basis or you can run the script found in .github/script/Start-ALZMonitorRemediation to remediate all ALZ-Monitor policies in scope as defined by management group pre-fix.
> Note: This script requires PowerShell 7.0 or higher and the Az.Resources PowerShell module.

To use the script do the following:
- Log on to Azure PowerShell with an account with at least Resource Policy Contributor permissions at the pseudo-root management group level
- Navigate to the root of the cloned repo
- To remediate for example the Alerting-Management initiative, assigned to the alz-platform-management Management Group run the following command: .github\script\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-management -policyName Alerting-Management.
- The script will return the output from the rest api calls which should be a status code 201. If the script fails, check the error message and ensure that the management group name and policy name are correct.
- After running the script you should be able to see a number of remediation tasks initiated at the alz-platform-management.
For convenience, assuming that the management hierarchy is fully aligned to ALZ, below are the commands required to remediate all policies assigned through the guidance provided in this repo:

```powershell
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-management -policyName Alerting-Management
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-connectivity -policyName Alerting-Connectivity
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-identity -policyName Alerting-Identity
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz-landingzones -policyName Alerting-LandingZone
  .github\scripts\Start-ALZMonitorRemediation.ps1 -managementGroupName alz -policyName Alerting-ServiceHealth
```