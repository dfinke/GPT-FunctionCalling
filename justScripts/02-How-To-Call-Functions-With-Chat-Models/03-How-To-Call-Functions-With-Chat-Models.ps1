<#        
    ### Here is the PowerShell code to get the weather  https://github.com/chubin/wttr.in is the REST API to be called
#>
function Get-CurrentWeather {
    <#
         .FunctionDescription
             Gets the current weather for a location
         .ParameterDescription location
             The location to get the weather for
         .ParameterDescription unit
             The unit to get the weather in
     #>
    param (
        [string]$location,
        [ValidateSet('celsius', 'fahrenheit')]
        [string]$unit
    )
     
    $paramUnit = "m"
    if ($unit -eq "fahrenheit") {
        $paramUnit = "u"
    }
 
    Write-Host "Getting the weather for $location in $unit"
    Invoke-RestMethod "https://wttr.in/$($location)?format=4&$paramUnit"
}
