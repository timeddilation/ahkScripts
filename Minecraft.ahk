
; Script Function:
;  The following only apply inside the Minecraft window:
;   1) Mouse Button 3 toggles hold-W, making you move forward automatically. Use with F1 for automated mining action!
;   2) Mouse Button 4 toggles hold-left-click.
;   3) Numpad Decimal toggle hold-right-click
;   4) LShift toggles crouching upon double-pressing it. Press it again (once) to turn off.
;

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#IfWinActive, Minecraft
{
   ; The following autopilot code was borrowed from jaceguay at http://www.autohotkey.com/forum/topic59506.html
   XButton1::Send % "{LButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
   XButton2::Send % "{w " ((Cnt2 := !Cnt2) ? "Down}" : "Up}" )
   NumpadDot::Send % "{RButton " ((Cnt := !Cnt) ? "Down}" : "Up}" )
   
   ;The following crouch-toggle code was borrowed from Lanser at http://www.autohotkey.com/forum/topic16058.html
   ~LShift up::
     Goto, Crouch
   
   Crouch:
     If (a_tickCount-lasttime < 400)
     {
       Loop
       {
         Send, {LShift down}
         If IsKeyPressed("LShift")
           Send, {LShift up}
         Break
       }
     }
     lasttime:=a_tickCount
   Return
   
   IsKeyPressed(v_KeyName)
     {
       GetKeyState, state, %v_KeyName%, P
       If state = D
       {
         Return 1
       }
       Return 0
     }
}