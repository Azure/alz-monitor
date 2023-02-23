<#
This script is used to trigger remediation on a specific policy set at management group scope. 
It first calls the Azure REST API to get the policy assignments in the management group scope, then it iterates through the policy assignments, checking if it is a policy set definition, and gets the specific one requested 
if so it extract the policy set ID, policy definition ID, and policy definition reference ID. 
Then it triggers the remediation process at management group scope using Azure REST API.

Example: 

Start-ALZMonitorRemediation.ps1 -managementGroupName alz-platform-management -policySetName Alerting-Management

#>

Param(
    [Parameter(Mandatory = $true)] [string] $managementGroupName,
    [Parameter(Mandatory = $true)] [string] $policySetName
)
#Get policy assignments at management group scope
$uri = "https://management.azure.com/providers/Microsoft.Management/managementGroups/$($managementGroupName)/providers/Microsoft.Authorization/policyAssignments?`$filter=atScope()&api-version=2022-06-01"
$result = (Invoke-AzRestMethod -Uri $uri -Method GET).Content | ConvertFrom-Json -Depth 100
#iterate through the policy assignments
$result.value | ForEach-Object {
    #check if the policy assignment is for the specified policy set definition
    If ($($PSItem.properties.policyDefinitionId) -match "/providers/Microsoft.Authorization/policySetDefinitions/$policySetName") {
        #extract policy assignment information
        $polassignId = $PSItem.id
        $name = $PSItem.name
        $policySetId = $PSItem.properties.policyDefinitionId
        $psetUri = "https://management.azure.com$($policySetId)?api-version=2021-06-01"
        $policySet = (Invoke-AzRestMethod -Uri $psetUri -Method GET).Content | ConvertFrom-Json -Depth 100
        $policies = $policySet.properties.policyDefinitions
        #iterate through the policies in the policy set
        Foreach ($policy in $policies) {
            $policyDefinitionId = $policy.policyDefinitionId
            $policyDefinitionReferenceId = $policy.policyDefinitionReferenceId
            $guid = New-Guid
            #create remediation for the individual policy
            $uri = "https://management.azure.com/providers/Microsoft.Management/managementGroups/$($managementGroupName)/providers/Microsoft.PolicyInsights/remediations/$($name)-$($guid)?api-version=2021-10-01"
            $body = @{
                properties = @{
                    policyAssignmentId          = "$polassignId"
                    policyDefinitionReferenceId = $policyDefinitionReferenceId
                }
            }
            $body = $body | ConvertTo-Json -Depth 10
            Invoke-AzRestMethod -Uri $uri -Method PUT -Payload $body
        }
    }
}
