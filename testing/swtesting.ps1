$stopwatch = new-object system.diagnostics.stopwatch
$ts = new-object System.TimeSpan

write-progress -id 2 -activity "testing" -status "testing"

$stopwatch.start()
for ($i = 1; $i -lt 10; $i++)
{
	$ts = $stopwatch.Elapsed
	$et = "{0:00}:{1:00}:{2:00}" -f $ts.hours, $ts.minutes, $ts.seconds
		write-progress -id 1 -activity "counting" -status $et
	sleep 5
	
}