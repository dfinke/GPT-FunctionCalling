<#        
    <style> td, th {    border: none!important; } </style>  |||| |---|---|---| |![](attachment:Badge-1.png)|<img src="media/plusSign.jpg" alt="drawing" width="50"/>|<img src="media/PSLogo.png" alt="drawing" width="75"/>|
#>
<#        
    ## How to call functions with model generated arguments  In our next example, we'll demonstrate how to execute functions whose inputs are model-generated, and use this to implement an agent that can answer questions for us about a database. For simplicity we'll use the [Chinook sample database](https://github.com/lerocha/chinook-database).  *Note:* SQL generation can be high-risk in a production environment since models are not perfectly reliable at generating correct SQL.
#>
<#        
    ## Set Your OpenAI Key
#>
$env:OpenAIKey = 'sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
