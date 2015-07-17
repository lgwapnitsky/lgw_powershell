$states_list = import-csv c:\lgwapps\downloads\states_list.csv
[xml]$states_xml = get-content c:\temp\newstates.xml

foreach ($state in $states_list)
{
	if (!(Select-XML -XML $states_xml -XPath "/termsets/termset/term[@name='$($state.abbreviation)']"))
	{
		$newstate = (@($states_xml.termsets.termset.term)[0]).clone()
		$newstate.name=$state.abbreviation
		$newstate.id = [system.guid]::NewGuid().ToString()
		$newstate.label.name = $state.state
		$states_xml.termsets.termset.AppendChild($newstate)
	}
}

$states_xml.save("c:\temp\newstates.xml")