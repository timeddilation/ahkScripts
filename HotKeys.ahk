;
; Script Function:
;	1) Ctrl+UpArrow sends volume-up.
;	2) Ctrl+DownArrow sends volume-down.
;	3) Ctrl+Numpad0 sends volume-mute.
;  The following only apply inside the Minecraft window:
;	1) Mouse Button 4 toggles hold-left-click, most useful for minig large amounts of blocks.
;	2) Double-press W toggles hold-W, making you move forward automatically. Press it again (once) to turn off.
;	3) Numpad Decimal toggles hold-right-click, most useful for AKF fishing.
;	4) Double-press LShift toggles crouching. Press it again (once) to turn off.
;	5) LCtrl will release ^crouch^ if it is toggled.
;

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; set params used in Minecraft window so they do not trigger on first script run
lastTimeW:=a_tickCount
lastTimeLShift:=a_tickCount

; general hotkeys for desktop, present everywhere.
^Up::Send {Volume_Up 2}
^Down::Send {Volume_Down 2}
^Numpad0::Send {Volume_Mute}
::i::I

#IfWinActive, Minecraft
{
	; triggers for hold-left-click, hold-right-click
	XButton1::Send % "{LButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
	NumpadDot::Send % "{RButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
	
	; walk-toggle on quick double-tap of W key
	~W up::
		If (a_tickCount-lastTimeW < 300)
		{
			Send, {W down}
		}
		lastTimeW:=a_tickCount
	Return
	
	; crouch-toggle on quick double-tap of LShift key
	~LShift up::
		If (a_tickCount-lastTimeLShift < 300)
		{
			Send, {LShift down}
			crouchToggled:=true
		}
		lastTimeLShift:=a_tickCount
	Return
	
	; if crouch is toggled, when LCtrl is pressed it will also un-toggle crouch
	If (crouchToggled)
	{
		~LControl::
			Send, {LShift down}{LShift up} ; simulates pressing the LShift key to reset its double-tap timer
			crouchToggled:=false
		Return
	}	
	
}