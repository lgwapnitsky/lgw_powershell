

set fso = CreateObject("Scripting.FileSystemObject")
set stdOut = fso.GetStandardStream(1)
set stderr = fso.GetStandardStream(2)
set objShell = CreateObject("Wscript.shell")
set exec = objShell.Exec("powershell -noprofile -file .\network.ps1")
exec.StdIn.Close()
WScript.Echo(exec.StdOut.ReadAll())
