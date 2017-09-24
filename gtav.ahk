/*
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////// GTA Online Quick MACRO’S///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

AutoHotkey Version: v1.1.22.05
Language:           English
Platform:           Windows 10 Home (64 bit) 
Original Author:    twentyafterfour
Modified by:        StArL0rd84

/////////////////////////////////////////////////////////////////////////////////

Introduction:

Remember to run AutoHotkey with administrator privileges or it won't work.

Everthing in this script can be modified to your needs. BUT BE CAREFUL!

/////////////////////////////////////////////////////////////////////////////////

Delays

The interaction menu and phone menu have different delay times due to unknown reasons,
so be sure to remember this if you are gonna change the delay settings below.
Everything is dialed in so the macro's are executed as fast and reliable as posible,
maybe even faster than you will be able to do mannually.

So test every hotkey in GTA before you touch anything.

I have not tested this script on other computers, So the delays might be different for you 
due to the fact that your computer could be slower or faster than mine.
This is pure speculation, but remember you can try to change the delay times if the macros selects 
the wrong things in the menus.

But i hope the delay times, already set, just works for you,
because it can take some knowhow to adjust them just right.  

(Delays are measured in milliseconds) (1000 milliseconds in 1 second)

;Remap Next Track key in bindings (In-game) to a punctuation/period dot.
;Remap Prev Track key in bindings (In-game) to the numpad delete/comma button.

HAVE FUN! c",)

*/

;/////////////////////////////////////////////////////////////////////////////////
;Changing hotkeys:

; Example: A simple input-box that asks for first name and last name:

;/////////////////////////////////////////////////////////////////////////////////
;Delays
#SingleInstance, Force
SetWorkingDir %A_ScriptDir%  	     ;--------------------------------------> Ensures a consistent starting directory.

Global IntMenuDelay := 200		;-------------------------------------------> Additional delay after opening interaction menu.
Global KeySendDelay := 100		;-------------------------------------------> Delay between send key commands.

Global KeyPressDuration := 70		;-------------------------------------------> Duration each key press is held down.
Global PhoneDelay := 500               ;-------------------------------------------> Delay between send key commands.

CFG = GTA Quick.ini

setkeydelay, %KeySendDelay%, %KeyPressDuration% 		;-------------------> Delay between keystrokes and press duration, respectively. (Don't touch, Variables for macros)
;/////////////////////////////////////////////////////////////////////////////////

Gui, Add, Text,, ToggleKey:
Gui, Add, Text,, Snack Key:
Gui, Add, Text,, Armor Key:
Gui, Add, Text,, Get Car Key:
Gui, Add, Text,, Mors Mutual Key:

Gui, Add, Hotkey, vPassiveToggleKey ym ,Numpad0
Gui, Add, Hotkey,vSnackKey,Numpad1
Gui, Add, Hotkey,vArmorKey,Numpad2
Gui, Add, Hotkey,vGetCarKey,Numpad3
Gui, Add, Hotkey,vMorsMutualKey,Numpad9

IfExist, %CFG%
	{ 
	IniRead,Read_PassiveToggleKey,%CFG%,Hotkeys,Passive Toggle
	IniRead,Read_SnackKey,%CFG%,Hotkeys,Snack
	IniRead,Read_ArmorKey,%CFG%,Hotkeys,Armor
	IniRead,Read_GetCarKey,%CFG%,Hotkeys,Get Key
	IniRead,Read_MorsMutualKey,%CFG%,Hotkeys,Mors Mutual


	GuiControl,,PassiveToggleKey,%Read_PassiveToggleKey%
	GuiControl,,SnackKey,%Read_SnackKey%
	GuiControl,,ArmorKey,%Read_ArmorKey%
	GuiControl,,GetCarKey,%Read_GetCarKey%
	GuiControl,,MorsMutualKey,%Read_MorsMutualKey%

	}

Gui, Add, Button, gsave, save
Gui, Show,, GTA Online Quick MACRO’S
return 

save:
Gui, Submit

IfNotExist,%CFG%
	{
	IniWrite,%PassiveToggleKey%,%CFG%,Hotkeys,Passive Toggle
	IniWrite,%SnackKey%,%CFG%,Hotkeys,Snack
	IniWrite,%ArmorKey%,%CFG%,Hotkeys,Armor
	IniWrite,%GetCarKey%,%CFG%,Hotkeys,Get Key
	IniWrite,%MorsMutualKey%,%CFG%,Hotkeys,Mors Mutual
	}

Hotkey, %PassiveToggleKey%, PassiveToggle
Hotkey, %SnackKey%, Snack
Hotkey, %ArmorKey%, SuperHeavyArmor
Hotkey, %GetCarKey%, GetCar
Hotkey, %MorsMutualKey%, MorsMutual
return


#IfWinActive ahk_class grcWindow     ;--------------------------------------> Disables hotkeys when alt-tabbed or GTA is closed.

PassiveToggle:          ;---------------------------------------------------> Code Block/Goto
InteractionMenu()		;---------------------------------------------------> Opens Interaction Menu.
Send {Up}{Enter}{m}     ;-------> Navigation commands.
return        ;-------------------------------------------------------------> End of macro.

;/////////////////////////////////////////////////////////////////////////////////

GetCar:
PhoneUp()		;---------------------------------------------------> Opens Phone.
Send {Right}{Up}{Enter}
Send {Up 5}{Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

MorsMutual:
PhoneUp()
Send {Right}{Up}{Enter}
Send {Up 3}{Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

Lester:
PhoneUp()
Send {Right}{Up}{Return}
Send {Up 6}{Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

SuperHeavyArmor:
InteractionMenu()
Send {Down}{Enter}{Down}{Enter}
Send {Down 4}{Enter}{m}
return				

;/////////////////////////////////////////////////////////////////////////////////

Pegasus:
PhoneUp()
Send {Right}{Up}{Enter}
Send {Up 3}{Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

Lamar:
PhoneUp()
Send {Right}{Up}{Enter}
Send {Up 9}{Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

Snack:
InteractionMenu()
Send {Down}{Enter}   
Send {Down 2}{Enter 2}{m}       
return

;/////////////////////////////////////////////////////////////////////////////////

SocialClub:
Send {HOME}
return

;/////////////////////////////////////////////////////////////////////////////////

QuickRace:
PhoneUp()
Send {Left}{Enter}
Send {Down 3}{Enter}
Send {Down}{Enter}
Send {Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

Merryweather:
PhoneUp()
Send {Right}{Up}{Enter}
Send {Up 5}{Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

VolumeDown:
Send {ESC}
sleep, %PhoneDelay%

Send {Left 3}{Enter 2}
sleep, 500
Send {Down 3}{Enter}
sleep, 500
Send {Down}{Left 2}
Send {ESC 3}
return	

;/////////////////////////////////////////////////////////////////////////////////

VolumeUp:
Send {ESC}
sleep, %PhoneDelay%

Send {Left 3}{Enter}{Enter}
sleep, 500
Send {Down 3}{Enter}
sleep, 500
Send {Down}{Right 2}
Send {ESC 3}
return	

;/////////////////////////////////////////////////////////////////////////////////

NextTrack:
Send {.}              ;--------------------------> Remap this key in bindings In-game to a punctuation dot.
return	

;/////////////////////////////////////////////////////////////////////////////////
; Previous Track (In-game Self Radio Music)

; Remap this in key bindings In-game to the numpad delete/comma button.

;/////////////////////////////////////////////////////////////////////////////////

JoinFriends:
Send {ESC}
sleep, %PhoneDelay%

Send {Right 2}{Enter}
sleep, 2000
Send {Enter}
return	

;/////////////////////////////////////////////////////////////////////////////////

JoinCrewMembers:
Send {ESC}
sleep, %PhoneDelay%

Send {Right}
sleep, 1000
Send {Enter}
sleep, 500
Send {Down 5}{Enter}
sleep, 500
Send {Enter}
sleep, 500
Send {Down}{Enter 2}
return	

;/////////////////////////////////////////////////////////////////////////////////

ImpromptuRace:
Send {m}			
sleep, %IntMenuDelay%

Send {Down 4}  
Send {Enter 2}      
return

;/////////////////////////////////////////////////////////////////////////////////

;Functions

PhoneUp(){
Send {Up}
sleep, %PhoneDelay% 
} 
return

InteractionMenu(){
Send {m}
sleep, %PhoneDelay% 
} 
return

Exitlabel:
ExitApp
return