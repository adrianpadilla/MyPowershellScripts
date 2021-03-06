<#
  .SYNOPSIS
  Writes files with scripted SQL server objects with grant permission statements.
  
  .DESCRIPTION
  This script works for scenarios where the schema of a database is scripted out. This script takes a folder containing such files and append a grant permission statement,
  for bulk grant designation.
  
  .EXAMPLE
  Write-GrantPermissionToSQLFiles 'C:\Scripts' 'EXECUTE' 'CustomerRole'
  
  .PARAMETER folderWithSqlScripts
  The path to the folder containing the sql files.
  
  .PARAMETER permission
  The type of permission that needs to be granted. Values "INSERT","SELECT","UPDATE", "DELETE", "EXECUTE".
  
  .PARAMETER roleName
  The database role the permissions is granted to.
  
  #>
Param(
   [string] $folderWithSqlScripts,
   [ValidateSet("INSERT","SELECT","UPDATE", "DELETE", "EXECUTE")]
   [string] $permission,
   [string] $roleName
)

$permission = $permission.ToUpperInvariant()
Set-Location $folderWithSqlScripts

foreach($file in Get-ChildItem $folderWithSqlScripts)
{
	$objectName = $file.BaseName
	
	$permissionSet = '
GO
GRANT {0}
ON OBJECT::[dbo].[{1}] TO [{2}]
AS [dbo];
GO' -f $permission, $objectName, $roleName

	Write-Host 'Writing file' $file
	Add-Content $file $permissionSet
}

