<#        
    We'll define a function specification for the function we'd like the API to generate arguments for. Notice that we are inserting the database schema into the function specification. This will be important for the model to know about.
#>
$functions = ConvertFrom-FunctionDefinition (Get-Command Invoke-AskDatabase)
$functions | ConvertTo-Json -Depth 5
