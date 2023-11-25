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
    Send {Click, %PosXDec%, %PosYInc%, right} ;Num1
    MouseRestore()
    Return
}

^NumpadClear::
{
    MouseBackup()
    Send {Click, %CharPosX%, %CharPosY%, right} ;Num5
    MouseRestore()
    Return
}

^NumpadDown::
{
    MouseBackup()
    Send {Click, %CharPosX%, %PosYInc%, right} ;Num2
    MouseRestore()
    Return
}

^NumpadPgdn::
{
    MouseBackup()
    Send {Click, %PosXInc%, %PosYInc%, right} ;Num3
    MouseRestore()
    Return
}

^NumpadRight::
{
    MouseBackup()
    Send {Click, %PosXInc%, %CharPosY%, right} ;Num6
    MouseRestore()
    Return
}

^NumpadPgup::
{
    MouseBackup()
    Send {Click, %PosXInc%, %PosYDec%, right} ;Num9
    MouseRestore()
    Return
}

^NumpadUp::
{
    MouseBackup()
    Send {Click, %CharPosX%, %PosYDec%, right} ;Num8
    MouseRestore()
    Return
}

^NumpadHome::
{
    MouseBackup()
    Send {Click, %PosXDec%, %PosYDec%, right} ;Num7
    MouseRestore()
    Return
}

^NumpadLeft::
{
    MouseBackup()
    Send {Click, %PosXDec%, %CharPosY%, right} ;Num4
    MouseRestore()
    Return
}
