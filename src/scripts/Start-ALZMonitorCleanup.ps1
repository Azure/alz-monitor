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
    $alertResourceIds = Search-AzGraph -Query "Resources | where type in ('Microsoft.Insights/metricAlerts','Microsoft.Insights/activityLogAlerts') and tags['_deployed_by_alz_monitor'] ~= 'True' | project id" -ManagementGroup $managementGroups.Id | 
        Select-Object -ExpandProperty Id
    
    If ($alertResourceIds.count -eq 100) {
        Write-Error "Placeholder: pagination"
    }

    # get resource group to delete
    $resourceGroupIds = Search-AzGraph -Query "ResourcesContainers | where type =~ 'Microsoft.Resources/ResourceGroups' and tags['_deployed_by_alz_monitor'] ~= 'True' | project id" -ManagementGroup $managementGroups.Id | 
        Select-Object -ExpandProperty Id

    # get policy assignments to delete
    $policyAssignmentIds = Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policyAssignments' | project name,metadata=parse_json(properties.metadata),type | where metadata._deployed_by_alz_monitor | project id" -ManagementGroup $managementGroups.Id | 
    Select-Object -ExpandProperty Id

    # get policy set definitions to delete
    $policySetDefinitionIds = Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policySetDefintions' | project name,metadata=parse_json(properties.metadata),type | where metadata._deployed_by_alz_monitor | project id" -ManagementGroup $managementGroups.Id | 
    Select-Object -ExpandProperty Id

    # get policy definitions to delete
    $policyDefinitionIds = Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policyDefintions' | project name,metadata=parse_json(properties.metadata),type | where metadata._deployed_by_alz_monitor | project id" -ManagementGroup $managementGroups.Id | 
    Select-Object -ExpandProperty Id

    # get policy assignment role assignments
    

}