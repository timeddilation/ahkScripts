;
; Script Function:
;	1) Ctrl+UpArrow sends volume-up.
;	2) Ctrl+DownArrow sends volume-down.
;	3) Ctrl+Numpad0 sends volume-mute.
;  The following only apply inside the Minecraft window:
;	1) Mouse Button 4 toggles hold-left-click, most useful for minig large amounts of blocks.
;	2) Mouse Button 5 toggles hold-right-click, most useful for AKF fishing.
;	3) Double-press W toggles hold-W, making you move forward automatically. Press it again (once) to turn off, or by pressing S.
;	4) Double-press LShift toggles crouching. Press it again (once) to turn off, or press LCtrl to sprint.
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
	XButton2::Send % "{RButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
	
	; walk-toggle on quick double-tap of W key
	~W up::
		walkToggled:=false
		If (a_tickCount-lastTimeW < 300)
		{
			Send, {W down}
			walkToggled:=true
		}
		lastTimeW:=a_tickCount
	Return
	
	; if walk is toggled, when S is pressed it will also un-toggle walk
	If (walkToggled)
	{
		~S::
			Send, {W down}{W up} ; simulates pressing the W key to reset its double-tap timer
			walkToggled:=false
		Return
	}
	
	; crouch-toggle on quick double-tap of LShift key
	~LShift up::
		crouchToggled:=false
		If (a_tickCount-lastTimeLShift < 300)
		{
			Send, {LShift DownTemp}
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