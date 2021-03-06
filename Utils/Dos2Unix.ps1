$ps1Name = "Dos2Unix"
$help = @"
$ps1Name
    Produce a copy of the specified input file in ASCII format to the given
    output file or to a new file with extension .ascii.txt in the same
    directory.

    $ps1Name <Input File Name> [Output File Name]
"@
if ($ARGS[0] -eq "-h") { $help; break }

$a = $ARGS.length
if ($a -eq 0) { Write-Warning "Missing <Input File Name>."; break}

$targetFileName = $ARGS[0]
$newFileName = $ARGS[1]
if ($a -eq 1) { $newFileName = $targetFileName + ".ascii.txt" }

Get-Content $targetFileName | Out-File -FilePath $newFileName -Encoding ASCII
