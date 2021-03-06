$ps1Name = "m2nm"
$help = @"
$ps1Name
    Convert meters to nautical miles.
    1 nautical mile = 1852 meters.

    $ps1Name <M1> [M2 ... Mn]
"@
if ($ARGS[0] -eq "-h") { $help; break }

$a = $ARGS.length
if ($a -eq 0) { Write-Warning "Missing <M value>."; break}

foreach ($value in $ARGS)
{
  [decimal]$m = $value
  $m / 1852.0
}
