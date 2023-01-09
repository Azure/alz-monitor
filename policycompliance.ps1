##add-azaccount -TenantId eb9e9330-b490-4080-9118-7134abf774e1
Get all policies assigned to management group
$mg = 'hubnw'
$uri = "https://management.azure.com/providers/Microsoft.Management/managementGroups/$($mg)/providers/Microsoft.Authorization/policyAssignments?`$filter=atScope()&api-version=2022-06-01"
$result = (Invoke-AzRestMethod -Uri $uri -Method GET).Content | ConvertFrom-Json -Depth 100
$result.value | ForEach-Object {
    If ($($PSItem.properties.policyDefinitionId) -match "/providers/Microsoft.Management/managementGroups/$($mg)/providers/Microsoft.Authorization/policyDefinitions") {
        $polassignId = $PSItem.id
        $name = $PSItem.name
        #$psitem
        $guid = New-Guid
        $uri = "https://management.azure.com/providers/Microsoft.Management/managementGroups/$($mg)/providers/Microsoft.PolicyInsights/remediations/$($name)?api-version=2021-10-01"
        $body = @{
            properties = @{
                policyAssignmentId = "$polassignId"
            }
        }
        $body = $body | ConvertTo-Json -Depth 10

        $uri
        $body

        Invoke-AzRestMethod -Uri $uri -Method PUT -Payload $body
        #Start-Sleep 10
    }
}


# az bicep build --file .\Observability_L100\Deploy\deploy_dine_policies.bicep
# $json = Get-Content .\Observability_L100\Deploy\deploy_dine_policies.json | ConvertFrom-Json -Depth 100
# $json.resources | foreach{ $PSItem.properties.parameters | convertto-json }

# $b = Get-Content .\Observability_L100\Deploy\deploy_dine_policies.bicep
# $str = $b | select-string 'policyDefinitions/' 
# $i = 0
# Foreach ($s in $str) {
#     $s = $s.ToString()
#     $substringStart = $s.IndexOf('/') + 1
#     $substringEnd = $s.Length - ($substringStart + 5)
#     $file = $s.Substring($substringStart, $substringEnd)
#     $file | out-file C:\temp\main.txt -Append
#     test-path .\Observability_L100\Deploy\policyDefinitions\$file
#     $i++
# }
# $i
#$str.Substring($str.IndexOf('policyDefinitions/'), $str.Length)


# $text = ( Get-Content test.txt | Out-String ).Trim() 
# #Note V3 can just use Get-Content test.txt -raw
# $text.Substring(0,$text.IndexOf('\test.something\')) | Set-Content file2.txt