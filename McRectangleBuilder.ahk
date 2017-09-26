/*
To start, you must build a 2-block-high tower with the material ou want to build with
Make sure you have enough building material to complete the structure
Define the structure length, width and height in the first 3 parameters
*/

Length:=5
Width:=5
Height:=4

^o::
heightLoop:=Height / 2 ; two layers per loop
Length:=Length - 1
Width:=Width - 1
Height:=Height - 2 ; assumes height is minimum of 2

MouseGetPos X, Y ; X , Y will be the "zero" position
sleep 500
SetKeyDelay, 30, 800
loop, %heightLoop%
{
	send {LShift down}{MButton}
	loop, %Length%
		{		
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