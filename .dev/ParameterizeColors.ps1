$infile = "css\theme-blue.css"
$outfile = "css\theme-conductor.css"
$contents = Get-Content $infile

$colors = Get-Item -Path $infile | Select-String -Pattern "#[a-f0-9]{6}" -AllMatches
$colors = $colors.Matches.Value | select -Unique

$defs = [String[]]::new($colors.length);

for ($idx = 0; $idx -lt $colors.length; $idx++) {
  $c = $colors[$idx];
  $col = "--color-{0:d2}" -f $idx
  $defs[$idx] = "  $col`: $c;";
  $name = "var({0})" -f $col;
  $contents = $contents | foreach { $_ -replace $c, $name }
}

@("`:root {", $defs, "}", "", $contents) | Out-File $outfile
