;Version 3.2
 
#SingleInstance Force
 
Hotkey F9, Join1
Hotkey F10, Join2
Hotkey F11, Retry
 
Gui,+AlwaysOnTop
Gui +LastFound +OwnDialogs +AlwaysOnTop
Gui, Font, s12
Gui, font, bold
Gui, Add, Button, x5 y5 w200 h50 gJoin1 , Join from Lobby`n(F9)
Gui, Font, s12
Gui, font, bold
Gui, Add, Button, x5 y60 w200 h50 gJoin2 , Join from In-Game`n(F10)
Gui, Font, s12
Gui, font, bold
Gui, Add, Button, x5 y115 w200 h50 gRetry , Retry`n(F11)
Gui, Font, s11
Gui, font, bold
Gui, Font, s12
Gui, Add, Text, x155 y170 w150 h30 vCounter
Gui, Add, Text, x10 y170 w140 h25, Games Followed:
Gui, font, bold
Gui, Font, s11
Gui, Add, Link, x11 y190, <a href="http://www.gubna.link/ahk1">Link to Project Post</a>
Gui, Show,w210 h210, Version 3.1
 
WinGetPos X, Y, Width, Height, A
MaxX := A_ScreenWidth - Width
MaxY := A_ScreenHeight - Height -0
 
WinMove A, ,%MaxX%, %MaxY%
 
InputBox, gamename, Game Name,,,200, 100
InputBox, gamenumber, Game Number,,,200, 100
var1 = %gamenumber%
 
pause
 
;Joins game from lobby(rarely used)
Join1:
++var1
++count
GuiControl,,Counter, %count% 
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
CoordMode, Mouse, Screen
Random, x, 1200, 1400 ;Join Game Field
Random, y, 156, 174 ;Join Game Field
Random, SleepAmount, 150, 400
Sleep, %SleepAmount%
Click, %x%, %y%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
sendinput %gamename%%var1%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
send, {enter}
return
 
;Joins game from current game you are in(most commonly used)
Join2:
++var1
++count
GuiControl,,Counter, %count%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
Random, x, 20, 1490
Random, y, 20, 825
Send +{click, r , %x%, %y%}
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
Send, {esc}
Random, SleepAmount, 600, 1000
Sleep, %SleepAmount%
CoordMode, Mouse, Screen
Random, x, 809, 1111 ;Save and Exit
Random, y, 452, 497 ;Save and Exit
Click, %x%, %y%
Random, SleepAmount, 600, 1000
Sleep, %SleepAmount%
CoordMode, Mouse, Screen
Random, x, 1200, 1400 ;Join Game Field
Random, y, 156, 174 ;Join Game Field
Random, SleepAmount, 150, 400
Sleep, %SleepAmount%
Click, %x%, %y%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
sendinput %gamename%%var1%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
send, {enter}
return
 
;Clicks "Join Game", ONLY USE IF YOU GET AN ERROR WHEN JOINING GAME, normally only happens if game isn't made yet or you are rate limited
Retry:
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
CoordMode, Mouse, Screen
Random, x, 1351, 1560 ;Join Game Button
Random, y, 618, 667 ;Join Game Button
Click, %x%, %y%
Random, SleepAmount, 400, 600
Sleep, %SleepAmount%
Random, x, 1351, 1560 ;Join Game Button
Random, y, 618, 667 ;Join Game Button
Click, %x%, %y%
return
 
GuiClose:
MsgBox , 64, Thank You, Thank you for using my Game Follow Tool.`nMade by Gubna`nDiscord: Gubna#0001, 10
ExitApp
 
F12::Reload