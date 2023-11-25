; Press CTRL + NumArrows to "use" the relative SQM floor
; You may get positions using "Get_Positions" script

; Settings
CharPosX  := 0
CharPosY  := 0

SqmSize   := A_ScreenHeight // 15

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

; Positions
PosXInc := CharPosX + SqmSize
PosXDec := CharPosX - SqmSize
PosYInc := CharPosY + SqmSize
PosYDec := CharPosY - SqmSize

^NumpadEnd::
{
    MouseBackup()
    Send {Click, %PosXDec%, %PosYInc%, right} ;1
    Send {Esc}
    MouseRestore()
    Return
}

^NumpadClear::
{
	MouseBackup()
    Send {Click, %CharPosX%, %CharPosY%, right} ;5
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadDown::
{
	MouseBackup()
    Send {Click, %CharPosX%, %PosYInc%, right} ;2
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadPgdn::
{
	MouseBackup()
    Send {Click, %PosXInc%, %PosYInc%, right} ;3
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadRight::
{
	MouseBackup()
    Send {Click, %PosXInc%, %CharPosY%, right} ;6
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadPgup::
{
	MouseBackup()
    Send {Click, %PosXInc%, %PosYDec%, right} ;9
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadUp::
{
	MouseBackup()
    Send {Click, %CharPosX%, %PosYDec%, right} ;8
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadHome::
{
	MouseBackup()
    Send {Click, %PosXDec%, %PosYDec%, right} ;7
    Send {Esc}
	MouseRestore()
    Return
}

^NumpadLeft::
{
	MouseBackup()
    Send {Click, %PosXDec%, %CharPosY%, right} ;4
    Send {Esc}
	MouseRestore()
    Return
}
