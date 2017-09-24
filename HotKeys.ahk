;
; Script Function:
;	1) Ctrl+UpArrow sends volume-up.
;	2) Ctrl+DownArrow sends volume-down.
;	3) Ctrl+Numpad0 sends volume-mute.
;  The following only apply inside the Minecraft window:
;	1) Mouse Button 4 toggles hold-left-click, most useful for minig large amounts of blocks.
;	2) Mouse Button 5 toggles hold-W, making you move forward automatically.
;	3) Numpad Decimal toggle hold-right-click, most useful for AKF fishing.
;	4) LShift toggles crouching upon double-pressing it. Press it again (once) to turn off.
;

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; general hotkeys for desktop, present everywhere.
^Up::Send {Volume_Up 2}
^Down::Send {Volume_Down 2}
^Numpad0::Send {Volume_Mute}
::i::I

#IfWinActive, Minecraft
{
	; triggers for hold-left-click, hold-W, hold-right-click
	XButton1::Send % "{LButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
;	XButton2::Send % "{w " ((Cnt2 := !Cnt2) ? "Down}" : "Up}" )
	NumpadDot::Send % "{RButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
	
	; crouch-toggle on quick double-tap of LShift key
	~LShift up::
		If (a_tickCount-lasttime < 300)
		{
			Send, {LShift down}
			If GetKeyState("LShift", "P")
				Send, {LShift up}
;			else If GetKeyState("LControl", "D")
;				Send, {LShift up}
		}
		lasttime:=a_tickCount
	Return
	
	; crouch-toggle on quick double-tap of W key
	~W up::
		If (a_tickCount-lasttime < 300)
		{
			Send, {W down}
			If GetKeyState("W", "P")
				Send, {W up}
		}
		lasttime:=a_tickCount
	Return
	
}