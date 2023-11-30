<#        
    ### Put It All Together
#>
function Invoke-SQLCopilot {
     [CmdletBinding()]
     param(
         [Parameter(Mandatory)]
         $q
     )
 
     $messages = @(
         # This helps the system understand the context of the question. THink steerability
         New-ChatMessageTemplate -Role system -Content '
 Answer user questions by generating Microsoft SQL queries against the Chinook Music Database. 
 - Do not user the LIMIT keyword, use TOP
     - SELECT TOP number FROM table_name WHERE condition
     - SELECT TOP (5) employee_id, last_name, first_name FROM employees 
 - Make sure the column and table names are correct and exist
 - The SQL syntax needs to work on Microsoft SQL Server    
     '
         New-ChatMessageTemplate -Role user -Content $q
     )
 
     $chatResponse = Get-ChatCompletion -messages $messages -functions $functions
     
     Invoke-ExecuteFunctionCall $chatResponse.choices[0].message
 }

