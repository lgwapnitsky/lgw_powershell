
# Define our lovely and oh so CLASSIC
# looking ASCII Keyboard!

[array]$keyboard=$Null
$keyboard+=""
$keyboard+="   _____________________________________________________________"
$keyboard+="   !   !   ! !   !   !   !   ! !   ! !   !   !   !   ! !   !   !"
$keyboard+="   !   !   ! !   !   !   !   ! !   ! !   !   !   !   ! !   !   !"
$keyboard+="   !   !___! !___!   !   !___! !___! !___!   !   !___! !___!   !"
$keyboard+="   !     !     !     !     !     !     !     !     !     !     !"
$keyboard+="   !     !     !     !     !     !     !     !     !     !     !"
$keyboard+="   !_____!_____!_____!_____!_____!_____!_____!_____!_____!_____!"
$keyboard+=""
$keyboard+="        *** Be A True Rockstar and Use WindowsPowerShell ***    "

# Clear the screen and display

CLEAR-HOST
$keyboard
$Host.UI.RawUI.WindowTitle="Windows PowerShell Rockin' Piano!"

# Define Keyboard keys and Tone for Notes

[array]$piano=$NULL
$piano+=@{"Q"=261.626,6,6,"q"}
$piano+=@{"2"=277.183,3,9,"2"}
$piano+=@{"W"=293.994,6,12,"w"}
$piano+=@{"3"=311.127,3,15,"3"}
$piano+=@{"E"=329.628,6,18,"e"}
$piano+=@{"R"=349.994,6,24,"r"}	
$piano+=@{"5"=369.995,3,27,"s"}
$piano+=@{"T"=391.995,6,30,"t"}
$piano+=@{"6"=415.305,3,33,"6"}
$piano+=@{"Y"=440,6,36,"y"}
$piano+=@{"7"=466.164,3,39,"7"}
$piano+=@{"U"=493.883,6,42,"u"}
$piano+=@{"I"=523.251,6,48,"i"}
$piano+=@{"9"=554.365,3,51,"9"}
$piano+=@{"O"=587.330,6,54,"o"}
$piano+=@{"0"=622.254,3,57,"0"}
$piano+=@{"P"=659.255,6,60,"p"}

# Now for the Fun part, playing!
do {
# Wait until some fool hits the keyboard
# We're not going to show the key on the screen
# And yes, we'll include Shift, Control and all the others

$key=$host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Now flush it away so we don't get a pile of keys
# backing up in the queue (Flush? Backup? Ewww)

$host.ui.rawUi.Flushinputbuffer()

# Grab the character from the $key Object and Match
# It Against the Array

$KeyboardData=$Piano.($Key.Character)

# Now IF we found something of value
# PLAY IT

If ($KeyboardData) {

$note=$KeyboardData[0]
$location=$host.ui.rawui.cursorposition
$location.Y=$keyboarddata[1]
$location.X=$keyboarddata[2]

$host.ui.rawui.cursorposition=$location

WRITE-HOST "*"
[console]::beep($note,150)
$host.ui.rawui.cursorposition=$location
WRITE-HOST " "

}

# Key having fun until Somebody tries to ESCape
# Get it? Hit's the ESCape key? Bad Pun?

} until ( $key.VirtualKeyCode -eq 27 )
