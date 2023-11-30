<#        
    ### Support functions  - Get-TableNames - Get-ColumnNames - Get-DatabaseInfo
#>
function Get-TableNames {
    param(
        $conn
    )    
     
    Invoke-SQL $conn "SELECT TABLE_Name as Name FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'"
}
 
function Get-ColumnNames {
    param(
        $conn,
        $tableName
    )    
     
    $sql = "SELECT COLUMN_NAME as Name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='$tableName'"
    Invoke-SQL $conn $sql
}
 
function Get-DatabaseInfo {
    param(
        $conn,
        [switch]$Compress,
        [switch]$Raw
    )
     
    $tables = [ordered]@{}
    $tableNames = (Get-TableNames $conn).Name
     
    foreach ($tablename in $tableNames) {
        $columns_names = (Get-ColumnNames $conn $tableName).Name
         
        if ($tables.Contains($tableName)) {
            $tables[$tableName] += $columns_names
        }
        else {
            $tables[$tableName] = @($columns_names)
        }        
    }
 
    if ($Raw) {
        $tables
    }
    else {
        $tables | ConvertTo-Json -Compress:$Compress
    }
}
