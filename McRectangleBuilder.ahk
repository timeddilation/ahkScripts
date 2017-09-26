Length:=5
Width:=5
Height:=6

^o::
heightLoop:=Height / 2 ; two layers per loop
Length:=Length - 1
Width:=Width - 1
Height:=Height - 2 ; assumes height is minimum of 2

MouseGetPos X, Y ; X , Y will be the "zero" position
sleep 500
loop, %heightLoop%
{
	send {LShift down}{MButton}
	loop, %Length%
		{
			SetKeyDelay, 30, 800
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10		
		}
	MouseMove, X+86, Y R
	loop, %Width%
		{
			SetKeyDelay, 30, 800
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10			
		}
	MouseMove, X+86, Y R
	loop, %Length%
		{
			SetKeyDelay, 30, 800
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10			
		}
	MouseMove, X+86, Y R
	loop, %Width%
		{
			SetKeyDelay, 30, 800
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10			
		}
	If (Height=0)
		{
		send {LShift up}
		}
	If (Height>0)
		{
		MouseMove, X+86, Y R
		send {space}
		sleep 25
		send {MButton}{Rbutton}
		sleep 100
		send {space}
		sleep 25
		send {MButton}{Rbutton}
		sleep 100
		Height:=Height - 2
		}
	
}

;!z::ExitApp