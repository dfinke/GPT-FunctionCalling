<#        
    ## Install PowerShellAI
#>
$module = 'PowerShellAI'
 $moduleExists = Get-Module -list $module 
 if($null -eq $moduleExists) {
     Install-Module -Name $module -Force
 }
 
 Import-Module PowerShellAI -Force
