<#        
    ## Install PowerShellAI
#>
$module = 'PowerShellAI'
$moduleExists = Get-Module -list $module 
if ($null -eq $moduleExists) {
    Install-Module -Name $module -Force
}
else {
    Write-Host "Module $module already installed" -ForegroundColor Green
}
 
Import-Module PowerShellAI -Force
