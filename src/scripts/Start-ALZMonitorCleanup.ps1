#requires -module Az.ResourceGraph
<#
.SYNOPSIS
    This script cleans up the resources deployed by the ALZ-Monitor automation, including alerts, policy assignments, policy definitions, and policy assignment role assignments. 
.DESCRIPTION
    
.NOTES
    In order for this script to function the deployed resources must have a tag _deployed_by_alz_monitor with a value of true and Policy resources must have metadata property 
    named _deployed_by_alz_monitor with a value of True. These tags and metadata are included in the automation, but if they are subsequently removed, there may be orphaned
    resources after this script executes. 

    The Role Assignments associated with Policy assignment identities and including _deployed_by_alz_monitor in the description field will also be deleted. 
.LINK
    https://github.com/Azure/alz-monitor
.EXAMPLE

#>

Function _Search-AzGraph {
    # ensure query results with more than 100 resources are returned
    param($query, $managementGroups, $skipToken)

    $optionalParams = @{}
    If ($skipToken) {
        $optionalParams += @{skipToken = $skipToken}
    }

    $result = Search-AzGraph -Query $query -ManagementGroup $managementGroups.id @optionalParams

    $result.Data

    If ($result.count -eq 100 -and $result.SkipToken) {
        _Search-AzGraph -query $query -managementGroups $managementGroups -skipToken $result.SkipToken
    }
}

Function Start-ALZMonitorCleanup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param()

    $ErrorActionPreference = 'Stop'

    # get all management groups -- used in graph query scope
    $managementGroups = Get-AzManagementGroup

    If ($managementGroups.count -eq 0) {
        Write-Error "The command 'Get-AzManagementGroups' returned '0' groups. This script needs to run with Owner permissions on the Azure Landing Zones intermediate root management group to effectively clean up Policies and all related resources."
    }

    # get alert resources to delete
    $alertResourceIds = _Search-AzGraph -Query "Resources | where type in ('Microsoft.Insights/metricAlerts','Microsoft.Insights/activityLogAlerts') and tags['_deployed_by_alz_monitor'] ~= 'True' | project id" -ManagementGroup $managementGroups.Id | 
        Select-Object -ExpandProperty Data | Select-Object -ExpandProperty Id
    
    # delete alert resources
    $alertResourceIds | Foreach-Object {Remove-AzResource -ResourceId $_}

    # get resource group to delete
    $resourceGroupIds = _Search-AzGraph -Query "ResourcesContainers | where type =~ 'Microsoft.Resources/ResourceGroups' and tags['_deployed_by_alz_monitor'] ~= 'True' | project id" -ManagementGroup $managementGroups.Id | 
    Select-Object -ExpandProperty Data | Select-Object -ExpandProperty Id

    # delete resource groups
    $resourceGroupIds | ForEach-Object {Remove-AzResourceGroup -ResourceGroupId $_}

    # get policy assignments to delete
    $policyAssignments = _Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policyAssignments' | project name,metadata=parse_json(properties.metadata),type,identity | where metadata._deployed_by_alz_monitor | project id" -ManagementGroup $managementGroups.Id
    $policyAssignmentIds = $policyAssignments | Select-Object -ExpandProperty Data | Select-Object -ExpandProperty Id

    # delete policy assignments
    $policyAssignmentIds | ForEach-Object {Remove-AzPolicyAssignment -Id $_}

    # get policy set definitions to delete
    $policySetDefinitionIds = _Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policySetDefintions' | project name,metadata=parse_json(properties.metadata),type | where metadata._deployed_by_alz_monitor | project id" -ManagementGroup $managementGroups.Id | 
    Select-Object -ExpandProperty Data | Select-Object -ExpandProperty Id

    # delete policy set definitions
    $policySetDefinitionIds | ForEach-Object {Remove-AzPolicySetDefinition -Id $_}

    # get policy definitions to delete
    $policyDefinitionIds = _Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policyDefintions' | project name,metadata=parse_json(properties.metadata),type | where metadata._deployed_by_alz_monitor | project id" -ManagementGroup $managementGroups.Id | 
    Select-Object -ExpandProperty Data | Select-Object -ExpandProperty Id

    # delete policy definitions
    $policyDefinitionIds | ForEach-Object {Remove-AzPolicyDefinition -Id $_}

    # get policy assignment role assignments to delete
    $policyAssignmentIdentities = $policyAssignments.data.identity.principalId
    ForEach ($identity in $policyAssignmentIdentities) {
        $roleAssignments = Get-AzRoleAssignment -ObjectId $identity

        ForEach ($roleAssignment in $roleAssignments) {

            If ($roleAssignment.Description -like '*_deployed_by_alz_monitor*') {
                $roleAssignment | Remove-AzRoleAssignment
            }
        }
    }
}