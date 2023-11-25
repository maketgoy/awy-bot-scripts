; Press ALT + NumArrows to use an item on relative SQM
; You may get positions using "Get_Positions" script

; Settings
CharPosX  := 0
CharPosY  := 0
ItemHotkey = {F1}

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

!NumpadEnd::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXDec%, %PosYInc%} ;1
    Send {Esct}
    MouseRestore()
    Return
}

!NumpadClear::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %CharPosX%, %CharPosY%} ;5
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadDown::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %CharPosX%, %PosYInc%} ;2
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadPgdn::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXInc%, %PosYInc%} ;3
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadRight::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXInc%, %CharPosY%} ;6
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadPgup::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXInc%, %PosYDec%} ;9
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadUp::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %CharPosX%, %PosYDec%} ;8
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadHome::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXDec%, %PosYDec%} ;7
    Send {Esct}
	MouseRestore()
    Return
}

!NumpadLeft::
{
	MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXDec%, %CharPosY%} ;4
    Send {Esct}
	MouseRestore()
    Return
}
