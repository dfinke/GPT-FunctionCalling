<#        
    ### Executing SQL queries  Now let's implement the function that will actually excute queries against the database.
#>
function Invoke-AskDatabase {
     [CmdletBinding()]
     <#
         .FunctionDescription
         Function to query a SQL Server database with a provided SQL query.
         .PARAMETERDESCRIPTION query
         SQL query extracting info to answer the user's question. SQL should be written using this database schema: $databaseSchema  The query should be returned in plain text, not in JSON.
     #>
     param(        
         [string]$query
     )
     
     Write-Verbose "Querying database with query: $query"
     Invoke-Sql $SqlConnection $query
 }
 
 function Invoke-ExecuteFunctionCall {
     param(
         $message
     )
     
     if ($message.function_call.name -eq "Invoke-AskDatabase") {
         $query = ($message.function_call.arguments | ConvertFrom-Json).query
         $results = Invoke-AskDatabase $query
     }
     else {
         $results = "Error: function $message.function_call.name does not exist"
     }
     
     $results
 }
