$fileList = $(
    "02-How-To-Call-Functions-With-Chat-Models.ipynb"
    "03-How-To-Call-Functions-With-Chat-Models-SQL-Style.ipynb"
)

foreach ($targetFileName in $fileList) {
    $Path = "$PSScriptRoot\..\"
    $fullName = "$Path\$targetFileName"

    $pathForScripts = "$PSScriptRoot\"
    $pathForScripts += $targetFileName -replace ".ipynb", ""
    $pathForScripts += "\"

    if (!(Test-Path $pathForScripts)) {
        $null = mkdir $pathForScripts
    }
    
    $data = Get-Content $fullName | ConvertFrom-Json -Depth 10

    $fileCount = 0
    $fileContent = $null

    switch ($data.cells) {
        { $_.cell_type -eq "code" } {
            $fileContent += $_.Source #.TrimEnd()
        
            $fileCount++
            $name = $pathForScripts 
            $name += $fileCount.ToString("00") 
            $name += "-" + ($targetFileName.Substring(3) -replace ".ipynb", ".ps1")
            $fileContent | Set-Content $name -Encoding utf8
            $fileContent = $null
        }
        { $_.cell_type -eq "markdown" } {        
            $fileContent += @"
<#        
    $($_.Source.TrimEnd())
#>

"@
        }
        default {
            Write-Host "Unknown cell type: $($_.cell_type)"
        }
    }
}