/*
Author: timedilation [2017-09-25]

To start, center your cursor on the center of the block you want to begin the strucutre on.
Make sure you are holding the block you want to build with
Open F3 debug menu, check your "Facing" coordinents.
Be on, or very close to one of the X-axis cardinal points (0, 90, 180, -90) facing the direction of the first wall.
Be sure to also face exactly down (90.0 on Y-axis)

Between every placed block, the script sends a middle-click input.
This allows the character to always have the building material in-hand when the stack runs out.
If your held stack runs out, as long as you have the building material in your inventory, it will be placed back in-hand.

Make sure you have enough building material to complete the structure
Define the structure's length, width and height in the first 3 parameters
Currently, height must be an even number, it will round down odd numbers after dividing by 2
*/

Length:=11
Width:=15
Height:=6

heightLoop:=Height // 2 ; two layers per loop
BuildLength:=Length - 1
BuildWidth:=Width - 1

^Numpad1:: ; Tells you how many blocks you need
	ActualHeight:=(heightLoop * 2)
	Lengths:=(Length * 2)
	Widths:=(Width * 2)
	Overlapped:=(Lengths + Widths)
	Trimmed:=(Overlapped - 4)
	BlocksNeeded:=(Trimmed * ActualHeight)
	StacskNeeded:=(BlocksNeeded / 64)
	msgbox,  You need %BlocksNeeded% blocks, or %StacskNeeded% stacks
Return

^Numpad2:: ; Begins building
sleep 50
	{ ; make first pillar
	SetKeyDelay, 30, 400
		send {RButton down}{space}
	sleep 100
	SetKeyDelay,0
		send {MButton}
	SetKeyDelay, 30, 400
		send {space}
	sleep 100
	}
	
HeightCounter:=(Height - 2)
MouseGetPos X, Y ; X , Y will be the "zero" position
sleep 500
loop, %heightLoop%
{
	SetKeyDelay, 30, 800
	send {LShift down}{MButton}
	loop, %BuildLength%
		{		
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10		
		}
	MouseMove, X+86, Y R
	loop, %BuildWidth%
		{
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10			
		}
	MouseMove, X+86, Y R
	loop, %BuildLength%
		{
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10			
		}
	MouseMove, X+86, Y R
	loop, %BuildWidth%
		{
			send {Rbutton}
			sleep 50
			send {MButton}{Rbutton}
			sleep 50
			send {MButton}{w}
			sleep 10			
		}
	If (HeightCounter>0)
		{
		MouseMove, X+86, Y R
		SetKeyDelay, 30, 400
			send {RButton down}{space}
		sleep 100
		SetKeyDelay,0
			send {MButton}
		SetKeyDelay, 30, 400
			send {space}
		sleep 100
		HeightCounter:=HeightCounter-2
		}
	If (HeightCounter=0)
		{
		send {LShift up}
		}
	
}
Return

;!z::ExitApp