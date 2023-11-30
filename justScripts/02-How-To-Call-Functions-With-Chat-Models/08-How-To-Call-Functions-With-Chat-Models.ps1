<#        
    ### Here's the GPT Response  Key parts: `finish_reason` and `function_call`  Inspecting the `finish_reason`, if it is `function_call`, then we know that the GPT has generated a function call. Now you can use the `function_call` to call the function. In this case `Get-CurrentWeather`
#>
$chatResponse.choices[0] | ConvertTo-Json -Depth 10
