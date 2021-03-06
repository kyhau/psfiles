$ps1Name = "GetEnvironmentVariables"
$help = @"
$ps1Name
    Uses WMI to return information about all the environment variables on a
    computer.

    $ps1Name [-all]
    -all : Display full details.
    
    Version 1.0
"@
if ($ARGS[0] -eq "-h") { $help; break }

$isAll = $False
if ($ARGS[0] -eq "-all") { $isAll = $True }

$computerName = "."

$colItems = Get-WmiObject -class "Win32_Environment" -namespace "root\CIMV2" `
-computername $computerName

foreach ($objItem in $colItems)
{
    Write-Host "Name            : " $objItem.Name
    Write-Host "Value           : " $objItem.VariableValue
    
    if ($isAll -eq $False) { Write-Host; continue }
    Write-Host "System Variable : " $objItem.SystemVariable
    Write-Host "User Name       : " $objItem.UserName
    Write-Host "Caption         : " $objItem.Caption
    Write-Host "Description     : " $objItem.Description
    Write-Host "InstallationDate: " $objItem.InstallDate
    Write-Host "Status          : " $objItem.Status
}
