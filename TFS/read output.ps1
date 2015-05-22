$userinfo = get-content "output.txt" | foreach-object {
	get-userinfo $_ -erroraction SilentlyContinue | select-object email
}

$userinfo | out-file pa.txt


