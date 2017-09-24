
;-----------------------------------------------------------------------------
;			Main Script
;-----------------------------------------------------------------------------
Pause Off

return

~p::ExitApp
^q::
sleep 3000
{
send {1}
loop 29
	{
	send {shift down}
	SetKeyDelay, 30, 800
	click right
	sleep 50
	click right
	sleep 50
	send {w}
	sleep 100
	}
send {shift down}
MouseMove, -26, 0, 11, R
send {2}
loop 30
	{
	send {shift down}
	SetKeyDelay, 30, 800
	click right
	sleep 50
	click right
	sleep 50
	send {w}
	sleep 100
	}
send {shift down}
MouseMove, -26, 0, 11, R
send {3}
loop 30
	{
	send {shift down}
	SetKeyDelay, 30, 800
	click right
	sleep 50
	click right
	sleep 50
	send {w}
	sleep 100
	}
send {shift down}
MouseMove, -26, 0, 11, R
send {4}
loop 30
	{
	send {shift down}
	SetKeyDelay, 30, 800
	click right
	sleep 50
	click right
	sleep 50
	send {w}
	sleep 100
	}
send {shift down}
MouseMove, -26, 0, 11, R
MouseMove,  0, 0, 10, R
send {space}
sleep 25
click right
sleep 100
send {space}
sleep 25
click right
sleep 100
send {5}
;
;-----------------------------------------------------------------------------
;			Second Row
;-----------------------------------------------------------------------------
;
loop 30
{
send {shift down}
SetKeyDelay, 30, 800
click right
sleep 50
click right
sleep 50
send {w}
sleep 100
}
send {shift down}
MouseMove, -26, 0, 11, R
send {6}
loop 30
{
send {shift down}
SetKeyDelay, 30, 800
click right
sleep 50
click right
sleep 50
send {w}
sleep 100
}
send {shift down}
MouseMove, -26.8, 0, 11, R
send {7}
loop 30
{
send {shift down}
SetKeyDelay, 30, 800
click right
sleep 50
click right
sleep 50
send {w}
sleep 100
}
send {shift down}
MouseMove, -26.0, 0, 11, R
send {8}
loop 30
{
send {shift down}
SetKeyDelay, 30, 800
click right
sleep 50
click right
sleep 50
send {w}
sleep 100
}
send {shift down}
MouseMove, -26, 0, 11, R
MouseMove,  0, 0, 10, R
send {space}
sleep 25
click right
sleep 100
send {space}
sleep 25
click right
sleep 100
send {1}
}

return