<#        
    The response came back with `finish_reason : function_call` indicating the GPT model determined the function that needs to be invoked.  Looking at `$chatResponse.choices[0].message` we see the name of the function `Invoke-AskDatabase` and the arguments to pass. Remember we set this up when we converted from the PowerShell function `Invoke-AskDatabase` to an OpenAI Function Spec.  ### Let's Invoke the Function
#>
Invoke-ExecuteFunctionCall $chatResponse.choices[0].message
