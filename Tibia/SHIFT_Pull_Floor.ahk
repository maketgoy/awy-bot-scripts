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

+NumpadEnd::
{
    MouseBackup()
    MouseClickDrag, left, %PosXDec%, %PosYInc%, %CharPosX%, %CharPosY%, 0 ;Num1
    MouseRestore()
    Return
}

+NumpadClear::
{
    MouseBackup()
    MouseClickDrag, left, %CharPosX%, %CharPosY%, %CharPosX%, %CharPosY%, 0 ;Num5
    MouseRestore()
    Return
}

+NumpadDown::
{
    MouseBackup()
    MouseClickDrag, left, %CharPosX%, %PosYInc%, %CharPosX%, %CharPosY%, 0 ;Num2
    MouseRestore()
    Return
}

+NumpadPgdn::
{
    MouseBackup()
    MouseClickDrag, left, %PosXInc%, %PosYInc%, %CharPosX%, %CharPosY%, 0 ;Num3
    MouseRestore()
    Return
}

+NumpadRight::
{
    MouseBackup()
    MouseClickDrag, left, %PosXInc%, %CharPosY%, %CharPosX%, %CharPosY%, 0 ;Num6
    MouseRestore()
    Return
}

+NumpadPgup::
{
    MouseBackup()
    MouseClickDrag, left, %PosXInc%, %PosYDec%, %CharPosX%, %CharPosY%, 0 ;Num9
    MouseRestore()
    Return
}

+NumpadUp::
{
    MouseBackup()
    MouseClickDrag, left, %CharPosX%, %PosYDec%, %CharPosX%, %CharPosY%, 0 ;Num8
    MouseRestore()
    Return
}

+NumpadHome::
{
    MouseBackup()
    MouseClickDrag, left, %PosXDec%, %PosYDec%, %CharPosX%, %CharPosY%, 0 ;Num7
    MouseRestore()
    Return
}

+NumpadLeft::
{
    MouseBackup()
    MouseClickDrag, left, %PosXDec%, %CharPosY%, %CharPosX%, %CharPosY%, 0 ;Num4
    MouseRestore()
    Return
}
