<#        
    ### The Integration of the Chat Models with the PowerShell Functions  The following code is the integration of the chat models with the PowerShell functions.  If the `finish_reason` is `function_call` you can grab the function name and arguments from the message. The `arguments` are JSON. With some PowerShell magic you can convert the JSON to a hashtable.  Now you have the function name and the arguments. using the call operator `&` you can call the function and splat the arguments.
#>
$target = $chatResponse.choices[0]
 
if ($target.'finish_reason' -eq 'function_call') {
    $functionName = $target.message.'function_call'.name
    $arguments = $target.message.'function_call'.arguments
    $splatParam = $arguments | ConvertFrom-Json -AsHashtable
 
    & $functionName @splatParam
}
