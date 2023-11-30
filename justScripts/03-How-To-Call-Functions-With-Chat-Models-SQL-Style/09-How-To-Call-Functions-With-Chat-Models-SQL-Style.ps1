<#        
    ### Let's ask the GPT model some questions  The `system` prompt is a bit chewy. We're letting the model know we're using Microsoft SQL Server. Also, that it needs to use the TOP keyword. Provide a couple of examples. Then we give the model time to think by telling it the column names, table names and syntax needs to be correct.
#>
$messages = @(
    # This helps the system understand the context of the question. THink steerability
    New-ChatMessageTemplate -Role system -Content '
 Answer user questions by generating Microsoft SQL queries against the Chinook Music Database. 
 - Do not use the LIMIT keyword, use TOP
     - SELECT TOP number FROM table_name WHERE condition
     - SELECT TOP (5) employee_id, last_name, first_name FROM employees 
 - Make sure the column and table names are correct and exist
 - The SQL syntax needs to work on Microsoft SQL Server    
 '
 
    # Here is our question
    New-ChatMessageTemplate -Role user -Content 'Hi, who are the top 5 artists by number of tracks?'
)
 
$chatResponse = Get-ChatCompletion -messages $messages -functions $functions
