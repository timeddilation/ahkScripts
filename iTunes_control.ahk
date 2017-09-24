^F7::
IfWinExist, ahk_class iTunes
ControlSend, ahk_parent, ^{LEFT}  ; < previous
return

^F8::
IfWinExist, ahk_class iTunes
ControlSend, ahk_parent, ^{RIGHT}  ; > next
return

^F9::
IfWinExist, ahk_class iTunes
ControlSend, ahk_parent, {SPACE}  ; play/pause toggle
return