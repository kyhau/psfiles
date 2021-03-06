$ps1Name = "GetDirectorySize"
$help = @"
$ps1Name
    Return the total directory size including sub directories.

    $ps1Name <Directory Name>
    
    Version 1.0
"@
if ($ARGS[0] -eq "-h") { $help; break }

$a = $ARGS.length
if ($a -eq 0) { Write-Warning "Missing <Directory Name>."; break}

$dirName = $ARGS[0]

$totalSize = Get-ChildItem -path $dirName -recurse -errorAction "SilentlyContinue" | Measure-Object -property length -sum

$totalSize.sum
if ($totalSize.Sum -ge 1GB) {
  "{0:n2}" -f  ($totalSize.sum / 1GB) + " GigaBytes"
}
elseif ($totalSize.sum -ge 1MB) {
  "{0:n2}" -f  ($totalSize.sum / 1MB) + " MegaBytes"
}
else {
  "{0:n2}" -f  ($totalSize.sum / 1KB) + " KiloBytes"
}
