<#        
    ### Natural Language for Weather  Straight text. This is a GPT prompt. Needs to be in this format to work with the OpenAI REST API.
#>
$q = 'what is the weather like today, in Greenland?'
# $q = 'what is the weather like today, in Greenland, farenheight?'
 
$messages = @(
    New-ChatMessageTemplate user $q
)
 
$messages
