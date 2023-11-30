<#        
    ### OpenAI Function Spec Let's use the metadata from the PowerShell function Get-CurrentWeather to create the OpenAI function spec.
#>
$functions = ConvertFrom-FunctionDefinition (Get-Command Get-CurrentWeather)
$functions | ConvertTo-Json -Depth 10
