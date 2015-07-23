$csvfile = import-csv "file.csv"

$split = 75

$csvfile_split = $csvfile.length / $split
$floor = [math]::Floor($csvfile_split)
$ceiling = [math]::Ceiling($csvfile_split)
$excess = $csvfile.length % $split

$start = 0
$end = $split - 1

switch ($excess -gt 0)
{
    $true   { $upper = $floor}
    $false  { $upper = $celing }
}

for ($i = 1; $i -le $upper; $i++) {
    $csvfile[$($start)..$($end)] | export-csv "split$($i).csv" -notypeinformation
    $start += $split
    $end += $split

}
