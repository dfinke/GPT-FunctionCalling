<#        
    ### The End  That's it! You have a PowerShell function `Get-CurrentWeather` and can use it with Natural Language by integration PowerShell and ChatGPT.  This is a very simple example, but you can use it to build more complex functions and integrate them with ChatGPT.  What are you going to add Natural Language to!?
#>
<#        
    ## All the Code  This is all the individual code snippets from the notebook, wrapped in the function `Invoke-AskWeather`.
#>
function Get-CurrentWeather {
    <#
         .FunctionDescription
             Gets the current weather for a location
         .ParameterDescription location
             The location to get the weather for
         .ParameterDescription format
             The format to get the weather in
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
 
function Invoke-AskWeather {
    param(
        [Parameter(Mandatory)]
        $q
    )
 
    $functions = ConvertFrom-FunctionDefinition (Get-Command Get-CurrentWeather)
 
    $messages = @(
        New-ChatMessageTemplate user $q
    )
 
    $chatResponse = Get-ChatCompletion $messages -functions $functions
    $target = $chatResponse.choices[0]
 
    if ($target.'finish_reason' -eq 'function_call') {
        $functionName = $target.message.'function_call'.name
        $arguments = $target.message.'function_call'.arguments
        $splatParam = $arguments | ConvertFrom-Json -AsHashtable
 
        & $functionName @splatParam
    }
}
