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

