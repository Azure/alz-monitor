<#
.SYNOPSIS
    This script cleans up the resources deployed by the ALZ-Monitor automation, including alerts, policy assignments, policy definitions, and policy assignment role assignments. 
.DESCRIPTION
    
.NOTES
    In order for this script to function the deployed resources must have a tag _deployed_by_alz_monitor with a value of true and Policy resources must have metadata property 
    named _deployed_by_alz_monitor with a value of True. These tags and metadata are included in the automation, but if they are subsequently removed, there may be orphaned
    resources after this script executes. 

    The Role Assignments associated with Policy assignment identities and including _deployed_by_alz_monitor in the description field will also be deleted. 

    This script leverages the Azure Resource Graph to find object to delete. Note that the Resource Graph lags behind ARM by a couple minutes.
.LINK
    https://github.com/Azure/alz-monitor

.EXAMPLE
    . ./src/scripts/Start-ALZMonitorCleanup.ps1 # import the cleanup function into the current session
    Start-ALZMonitorCleanup -ReportOnly
    # generate a list of the resource IDs which would be deleted by this script

.EXAMPLE
    . ./src/scripts/Start-ALZMonitorCleanup.ps1 # import the cleanup function into the current session
    Start-ALZMonitorCleanup -WhatIf
    # show output of what would happen if deletes executed

.EXAMPLE
    . ./src/scripts/Start-ALZMonitorCleanup.ps1 # import the cleanup function into the current session
    Start-ALZMonitorCleanup
    # delete all resources deployed by the ALZ-Monitor IaC
#>

Function _Search-AzGraph {
    # ensure query results with more than 100 resources are returned
    param($query, $managementGroupNames, $skipToken)

    $optionalParams = @{}
    If ($skipToken) {
        $optionalParams += @{skipToken = $skipToken }
    }

    $result = Search-AzGraph -Query $query -ManagementGroup $managementGroupNames -Verbose:$false @optionalParams

    $result.Data

    If ($result.count -eq 100 -and $result.SkipToken) {
        _Search-AzGraph -query $query -managementGroupNames $managementGroupNames -skipToken $result.SkipToken
    }
}

Function Start-ALZMonitorCleanup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param(
        # output a list of the resources to be deleted
        [switch]$reportOnly,
        # if not specified, every delete will prompt for confirmation
        [switch]$force
    )

    $ErrorActionPreference = 'Stop'

    # get all management groups -- used in graph query scope
    $managementGroups = Get-AzManagementGroup
    Write-Verbose "Found '$($managementGroups.Count)' management groups to query for ALZ-Monitor resources."

    If ($managementGroups.count -eq 0) {
        Write-Error "The command 'Get-AzManagementGroups' returned '0' groups. This script needs to run with Owner permissions on the Azure Landing Zones intermediate root management group to effectively clean up Policies and all related resources."
    }

    # get alert resources to delete
    $alertResourceIds = _Search-AzGraph -Query "Resources | where type in~ ('Microsoft.Insights/metricAlerts','Microsoft.Insights/activityLogAlerts') and tags['_deployed_by_alz_monitor'] =~ 'True' | project id" -ManagementGroupNames $managementGroups.Name | 
    Select-Object -ExpandProperty Id
    Write-Verbose "Found '$($alertResourceIds.Count)' metric and activity log alerts to be deleted."

    # get resource group to delete
    $resourceGroupIds = _Search-AzGraph -Query "ResourceContainers | where type =~ 'microsoft.resources/subscriptions/resourcegroups' and tags['_deployed_by_alz_monitor'] =~ 'True' | project id" -ManagementGroupNames $managementGroups.Name | 
    Select-Object -ExpandProperty Id
    Write-Verbose "Found '$($resourceGroupIds.Count)' resource groups with tag '_deployed_by_alz_monitor=True' to be deleted."

    # get policy assignments to delete
    $policyAssignments = _Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policyAssignments' | project name,metadata=parse_json(properties.metadata),type,identity,id | where metadata._deployed_by_alz_monitor =~ 'true'" -ManagementGroupNames $managementGroups.Name
    $policyAssignmentIds = $policyAssignments | Select-Object -ExpandProperty Id
    Write-Verbose "Found '$($policyAssignmentIds.Count)' policy assignments with metadata '_deployed_by_alz_monitor=True' to be deleted."

    # get policy set definitions to delete
    $policySetDefinitionIds = _Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policysetdefinitions' | project name,metadata=parse_json(properties.metadata),type,id | where metadata._deployed_by_alz_monitor =~ 'true' | project id" -ManagementGroupNames $managementGroups.Name | 
    Select-Object -ExpandProperty Id
    Write-Verbose "Found '$($policySetDefinitionIds.Count)' policy set definitions with metadata '_deployed_by_alz_monitor=True' to be deleted."

    # get policy definitions to delete
    $policyDefinitionIds = _Search-AzGraph -Query "policyresources | where type =~ 'microsoft.authorization/policyDefinitions' | project name,metadata=parse_json(properties.metadata),type,id | where metadata._deployed_by_alz_monitor =~ 'true' | project id" -ManagementGroupNames $managementGroups.Name | 
    Select-Object -ExpandProperty Id
    Write-Verbose "Found '$($policyDefinitionIds.Count)' policy definitions with metadata '_deployed_by_alz_monitor=True' to be deleted."

    # get policy assignment role assignments to delete
    $policyAssignmentIdentities = $policyAssignments.identity.principalId | Sort-Object | Get-Unique
    Write-Verbose "There are '$($policyAssignmentIdentities.Count)' policy assignment identities to check for role assignments with description '_deployed_by_alz_monitor' to be deleted."

    # get policy assignment role assignments to delete
    $roleAssignments = @()
    ForEach ($identity in $policyAssignmentIdentities) {
        $identityRoleAssignments = Get-AzRoleAssignment -ObjectId $identity

        ForEach ($roleAssignment in $identityRoleAssignments) {

            If ($roleAssignment.Description -like '*_deployed_by_alz_monitor*') {
                $roleAssignments += $roleAssignment
            }
        }
    }

    If (!$reportOnly.IsPresent) {
        # delete alert resources
        Write-Verbose "Deleting alert resources..."
        $alertDeleteJobs = @()
        $alertResourceIds | Foreach-Object { $alertDeleteJobs += Remove-AzResource -ResourceId $_ -Force:$force.IsPresent -Confirm:(!$force.isPresent) -AsJob }
        Write-Verbose "Waiting for '$($alertDeleteJobs.count)' delete jobs to complete..."
        $alertDeleteJobs | Wait-Job | Receive-Job

        # delete resource groups
        Write-Verbose "Deleting resource groups..."
        $resourceGroupIds | ForEach-Object { Remove-AzResourceGroup -ResourceGroupId $_ -Force:$force.IsPresent -Confirm:(!$force.isPresent) -AsJob | Out-Null }

        # delete policy assignments
        Write-Verbose "Deleting policy assignments..."
        $assignmentDeleteJobs = @()
        $policyAssignmentIds | ForEach-Object { $assignmentDeleteJobs += Start-Job -ScriptBlock {Remove-AzPolicyAssignment -Id $using:_ -Confirm:(!$using:force.isPresent) -ErrorAction Stop} }
        Write-Verbose "Waiting for '$($assignmentDeleteJobs.count)' delete jobs to complete..."
        $assignmentDeleteJobs | Wait-Job | Receive-Job

        # delete policy set definitions
        Write-Verbose "Deleting policy set definitions..."
        $policySetDeleteJobs = @()
        $policySetDefinitionIds | ForEach-Object { $policySetDeleteJobs += Remove-AzPolicySetDefinition -Id $_ -Force:$force.IsPresent -Confirm:(!$force.isPresent) -AsJob }
        Write-Verbose "Waiting for '$($policySetDeleteJobs.count)' delete jobs to complete..."
        $policySetDeleteJobs | Wait-Job | Receive-Job

        # delete policy definitions
        Write-Verbose "Deleting policy definitions..."
        $definitionDeleteJobs = @()
        $policyDefinitionIds | ForEach-Object { $definitionDeleteJobs += Remove-AzPolicyDefinition -Id $_ -Force:$force.IsPresent -Confirm:(!$force.isPresent) -AsJob }
        Write-Verbose "Waiting for '$($definitionDeleteJobs.count)' delete jobs to complete..."
        $definitionDeleteJobs | Wait-Job | Receive-Job

        # delete policy assignment role assignments
        Write-Verbose "Deleting role assignments..."
        $roleAssignments | ForEach-Object { $_ | Remove-AzRoleAssignment -Force:$force.IsPresent -Confirm:(!$force.isPresent) -AsJob | Out-Null }

    }
    Else {
        $resourceToBeDeleted = $alertResourceIds + $resourceGroupIds + $policyAssignmentIds + $policySetDefinitionIds + $policyDefinitionIds + $roleAssignments.RoleAssignmentId

        return $resourceToBeDeleted
    }
}

If (-NOT(Get-Module -ListAvailable Az.ResourceGraph)) {
    Write-Warning "This script requires the Az.ResourceGraph module."

    $response = Read-Host "Would you like to install the 'Az.ResourceGraph' module now? (y/n)"
    If ($response -match '[yY]') { Install-Module Az.ResourceGraph -Scope CurrentUser }
}