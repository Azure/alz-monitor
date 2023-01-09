# Convert
Get-ChildItem ./ -recurse | Where-Object {$_.name -like "*.bicep"} | foreach {bicep build $_.name}

# Validate Template 
# https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/test-toolkit
Import-Module ./arm-ttk.psd1

Test-AzTemplate -TemplatePath ./deploy-aa_totaljob_alert.json
