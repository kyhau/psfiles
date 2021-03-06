
Begin{
# Only get process at the Beginning, include variable creation and functions.
# Write-Host "Starting" $ARGS[0]
    
$ps1Name = "Grep.ps1"
$help = @"
<#
.SYNOPSIS
Unix-like Grep.
Grep.ps1 <lookup-string> [file-name-pattern] [-i|r]

.DESCRIPTION
Unix-like Grep.

.INPUTS
Support pipe objects.

.EXAMPLE
Grep.ps1 "id" readme.txt

.NOTES
Version 1.0
#>
"@
if ($ARGS.length -eq 0) { $help; break }

$lookupStr = ""
$fileStr = ""
$recurseOption = ""
$isCaseSensitive = $True

foreach ($arg in $args) {
    switch -regex ($arg) {
        "-[iI]" { $isCaseSensitive = $False }
        "-[rR]" { $recurseOption = "-recurse" }
        default {
            if ($lookupStr -eq "") { $lookupStr = $arg}
            elseif ($fileStr -eq "") { $fileStr = $arg }
        }
    }
}

if ($fileStr -eq "") { $fileStr = "*" }
} #Begin

Process{
# Get process for each object in the pipe (if ones exist).
#if($_){Write-Host "Process $_"}
Select-String -inputObject $_ $lookupStr 
} #Process

End{
# Always get processed once at the end.
if ($_) { break; }
   
if ($fileStr -eq "") { $fileStr = "*" }
if ($isCaseSensitive -eq $True) { 
    Get-ChildItem $fileStr $recurseOption | Select-String $lookupStr -CaseSensitive
}
else {
    Get-ChildItem $fileStr $recurseOption | Select-String $lookupStr
}
} #End
