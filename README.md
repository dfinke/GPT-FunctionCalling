# GPT-FunctionCalling

This repo has the code for the demo I did on the VS Code Livestream here:
https://youtu.be/kU9FeBWuZnw

## Dependencies

You need to have the following:

- An OpenAI Key - You can get that here: https://platform.openai.com/account/api-keys
- The [PowerShellAI](https://www.powershellgallery.com/packages/PowerShellAI) module - Run `Install-Module PowerShellAI` in a PowerShell console
- For the SQL demo you need to have SQL Server and the Chinook database installed. You can get that here: https://blog.xojo.com/2016/04/13/the-chinook-sample-database/

I originally created two of the demos using Polyglot Interactive Notebooks in VS Code. An upgrade to the VS Code Python extension broke the notebook functionality so I had to convert them to regular PowerShell files. You can find the original notebooks in the `root` folder and the scripts in `justScripts`.

The `01-ChatRegistration.ps1` can be run from the console once you set the OpenAI Key and install the PowerShellAI module.