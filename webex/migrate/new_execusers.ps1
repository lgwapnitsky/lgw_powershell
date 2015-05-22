$csv = @(import-csv ".\Executive Support Customers June-2014_phly_activeuser_ad.csv")
$csv = $csv + @(import-csv ".\Executive Support Customers June-2014_tmnas_activeuser_ad.csv")

$x = import-csv ..\TMNASSiteUsers.csv -Delimiter "`t"

$y = new-object system.collections.arraylist


