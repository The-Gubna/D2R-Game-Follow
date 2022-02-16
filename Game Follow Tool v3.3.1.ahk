#SingleInstance Force
#Persistent
SetBatchLines, -1
 
;<========== | HOTKEYS | ==========>
Hotkey F9, Join1
Hotkey F10, Join2
Hotkey F11, Retry
Hotkey ^F12, Exit
 
;<========== | GUI | ==========>
Gui,+AlwaysOnTop
Gui +LastFound +OwnDialogs +AlwaysOnTop
Gui, Font, s11
Gui, font, bold
Gui, Add, Button, x5 y5 w125 h40 gJoin1 , Join - Lobby`n(F9)
Gui, Add, Button, x5 y50 w125 h40 gJoin2 , Join - Game`n(F10)
Gui, Add, Button, x5 y95 w125 h40 gRetry , Retry`n(F11)
Gui, Add, Button, x5 y140 w125 h40 gExit , Exit`n(CTRL+F12)
Gui, font, bold
Gui, Font, s12
Gui, Add, Text, x10 y180 w100 h40, Followed:
Gui, Add, Text, x90 y180 w125 h30 vCounter
Gui, Show,w130 h170, v3.3.1
Gui -caption
 
GuiControl,,Counter, 0
 
;<========== | WINDOW POSITION | ==========>
WinGetPos X, Y, Width, Height, A
MaxX := A_ScreenWidth - Width
MaxY := A_ScreenHeight - Height -0
 
WinMove A, ,%MaxX%, %MaxY%
 
IniWrite,******************* OPEN PROGRAM *******************`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
 
;<========== | USER INPUT | ==========>
InputBox, gamename, Game Name,,,200, 100
InputBox, gamenumber, Game Number,,,200, 100
InputBox, gamepass, Game Password,,,200, 100
 
count = 0
++gamenumber
 
pause
 
;Joins game from lobby(rarely used)
Join1:
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
sendinput %gamename%%gamenumber%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
Random, x, 1440, 1640 ;Password box
Random, y, 147, 164 ;Password box
Click, %x%, %y%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
sendinput %gamepass%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
send, {enter}
IniWrite,%A_Hour%:%A_Min%:%A_Sec% | Joined | Lobby   | %gamename%%gamenumber%`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
++gamenumber
return
 
;Joins game from current game you are in(most commonly used)
Join2:
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
sendinput %gamename%%gamenumber%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
Random, x, 1440, 1640 ;Password box
Random, y, 147, 164 ;Password box
Click, %x%, %y%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
sendinput %gamepass%
Random, SleepAmount, 250, 600
Sleep, %SleepAmount%
send, {enter}
IniWrite,%A_Hour%:%A_Min%:%A_Sec% | Joined | In-Game | %gamename%%gamenumber%`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
++gamenumber
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
IniWrite,%A_Hour%:%A_Min%:%A_Sec% | +++++ Retry Join Game +++++`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
return
 
GuiClose:
 
   SetFormat, Float, 03.0
   count += 0.0
 
IniWrite,%A_MM%/%A_DD%/%A_YYYY% [%A_Hour%:%A_Min%:%A_Sec%] | Games Followed | %count%`n, %A_YYYY% - %A_MMM%.ini, Total Games Followed
IniWrite,******************* EXIT PROGRAM *******************`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
MsgBox , 64, Thank You, Thank you for using my Game Follow Tool.`nMade by Gubna`nDiscord: Gubna#0001, 10
ExitApp
return
 
F12::
 
   SetFormat, Float, 03.0
   count += 0.0
 
IniWrite,%A_MM%/%A_DD%/%A_YYYY% [%A_Hour%:%A_Min%:%A_Sec%] | Games Followed | %count%`n, %A_YYYY% - %A_MMM%.ini, Total Games Followed
IniWrite,%A_Hour%:%A_Min%:%A_Sec% | <><><><><><><> RELOADED <><><><><><><><>`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
Reload
return
 
exit:
 
   SetFormat, Float, 03.0
   count += 0.0
 
IniWrite,%A_MM%/%A_DD%/%A_YYYY% [%A_Hour%:%A_Min%:%A_Sec%] | Games Followed | %count%`n, %A_YYYY% - %A_MMM%.ini, Total Games Followed
IniWrite,******************* EXIT PROGRAM *******************`n, %A_YYYY% - %A_MMM%.ini, Games Followed | %A_MM%/%A_DD%/%A_YYYY%
MsgBox , 64, Thank You, Thank you for using my Game Follow Tool.`nMade by Gubna`nDiscord: Gubna#0001, 10
ExitApp
return
