<#        
    ### Specifying a function to execute SQL queries  First let's define some helpful utility functions to extract data from a SQL Server database.
#>
function Invoke-SQL {
    param(
        $conn,
        $sql
    )
 
    $SqlCmd = New-Object System.Data.SqlClient.SqlCommand
    $SqlCmd.CommandText = $sql
    $SqlCmd.Connection = $conn
 
    $SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
    $SqlAdapter.SelectCommand = $SqlCmd
     
    $DataSet = New-Object System.Data.DataSet
    $null = $SqlAdapter.Fill($DataSet)
     
    $DataSet.Tables
 
    $conn.Close()
}
