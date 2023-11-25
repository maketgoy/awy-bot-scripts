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
    Send {Click, %PosXDec%, %PosYInc%} ;Num1
    MouseRestore()
    Return
}

!NumpadClear::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %CharPosX%, %CharPosY%} ;Num5
    MouseRestore()
    Return
}

!NumpadDown::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %CharPosX%, %PosYInc%} ;Num2
    MouseRestore()
    Return
}

!NumpadPgdn::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXInc%, %PosYInc%} ;Num3
    MouseRestore()
    Return
}

!NumpadRight::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXInc%, %CharPosY%} ;Num6
    MouseRestore()
    Return
}

!NumpadPgup::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXInc%, %PosYDec%} ;Num9
    MouseRestore()
    Return
}

!NumpadUp::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %CharPosX%, %PosYDec%} ;Num8
    MouseRestore()
    Return
}

!NumpadHome::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXDec%, %PosYDec%} ;Num7
    MouseRestore()
    Return
}

!NumpadLeft::
{
    MouseBackup()
    Send %ItemHotkey%
    Send {Click, %PosXDec%, %CharPosY%} ;Num4
    MouseRestore()
    Return
}
