<#        
    ### Call GPT  Now you pass in the message and OpenAI function spec and get back the response.
#>
$chatResponse = Get-ChatCompletion $messages -functions $functions
$chatResponse
