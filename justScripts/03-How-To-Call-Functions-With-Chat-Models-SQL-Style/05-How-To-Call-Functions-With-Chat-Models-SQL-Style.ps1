<#        
    Now can use these utility functions to extract a representation of the database schema.
#>
# You need to change the Server to your own server name and database
 
 $SqlConnection = New-Object System.Data.SqlClient.SqlConnection "Database=Chinook;Server=DESKTOP-RGI79SG\SQLEXPRESS02;Trusted_Connection=True;"
 
 $databaseSchema = Get-DatabaseInfo $SqlConnection
