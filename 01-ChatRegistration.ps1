function New-Registration { 
    param(
        $university,
        $studentName,
        $year
    )

    "University: $university, Student Name: $studentName, Year: $year"
}

function Update-Registration { 
    param(
        $id,
        $university = "n/a",
        $studentName = "n/a",
        $year = "n/a"
    )

    "Id: $id University: $university, Student Name: $studentName, Year: $year"
}

function Remove-Registration { 
    param(
        $id
    )
    
    "id: $id"
}

$primer = @'
You are an assistant for a system that manages student registrations.
Outputs will be outputed to the student. 

The student can ask for a new registration, update information on an existing registration, delete an registration.
To create a new registration, the student must provide a university, the year it was created, and the student's name.
To update an registration, the student must provide the registration number, and the new information. 
To delete and registration, the student must provide an registration number.

Ensure the student provides explicit confirmation before fulfilling the request.
'@

$functionSpec = @'
Possible functions are New-Registration, Update-Registration, Remove-Registration.
Possible ARGS are university, studentName, year, id.
'@

$decorator = @'
If you need to ask details to the student, or ask confirmation, use OUTPUT.
If you want to perform the requested action : use FUNCTION and ARGS. Do not use FUNCTION and ARGS if the student has not confirmed.
Do not answer anything else than JSON with the two fields. The output must be parsable by json.loads

All your answers must be a json with three fields, OUTPUT, FUNCTION and ARGS. ARGS are also valid JSON
Example:
{
    "OUTPUT" : "an output", 
    "FUNCTION" : "a function to call",
    "ARGS":"the arguments for the function call"
}

Your first output will be OUTPUT: a welcoming question
'@

$script:messages = @()

$script:messages += New-ChatMessageTemplate system $primer
$script:messages += New-ChatMessageTemplate system $functionSpec
$script:messages += New-ChatMessageTemplate system $decorator

function generate($messages) {
    $response = Get-ChatCompletion -messages $script:messages -model 'gpt-4-1106-preview' -temperature 0   
    $response.choices[0].message.content
}

function get_response($chat_input = $null) {
    $script:messages += New-ChatMessageTemplate user $chat_input
    
    $ai_output = generate $script:messages
    $chatResponse = $ai_output | ConvertFrom-Json -AsHashtable
    
    if (![string]::IsNullOrEmpty($chatResponse.FUNCTION)) {
        $fnParams = $chatResponse.ARGS 
        $chatOutput = (& $chatResponse.FUNCTION @fnParams) + " - via $($chatResponse.FUNCTION)"
    }
    else {
        $chatOutput = $chatResponse.OUTPUT
    }

    $script:messages += New-ChatMessageTemplate assistant $ai_output
    
    return $chatOutput
}

"Welcome to the Vehicle Registration Chat System"
"Type 'exit' to end the conversation."

while ($true) {
    $user_input = Read-Host "<$(Get-ChatAPIProvider)> You "
    if ($user_input.ToLower() -eq 'exit') {
        "Assistant: Goodbye!"
        break
    }
    $response = get_response $user_input
    "Assistant: $response"
}