$ps1Name = "kt2ms"
$help = @"
$ps1Name
    Convert knots to meters per second.
    1 kt = 1853.248/3600.0 m/s.

    $ps1Name <KT1> [KT2 ... KTn]
"@
if ($ARGS[0] -eq "-h") { $help; break }

$a = $ARGS.length
if ($a -eq 0) { Write-Warning "Missing <KT value>."; break}

foreach ($value in $ARGS)
{
  [decimal]$kt = $value
  $kt * 1853.248 / 3600.0
}
