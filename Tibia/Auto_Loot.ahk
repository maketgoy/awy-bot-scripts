; Press a key to loot all SQM

; Settings
Hotkey   = {NumpadIns}
SqmSize := A_ScreenHeight // 15

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

CenterX := 0
CenterY := 0

key := HotkeyClear(Hotkey)
Hotkey, ~$%key%, Action, On
Return

^+!RButton::
{
    MouseGetPos, CenterX, CenterY
    Notify("X: " CenterX " | Y: " CenterY)
    Return
}

Action:
{
    If (CenterX <= 0 || CenterY <= 0) {
        Notify("First press CTRL + ALT + SHIFT + RIGHT CLICK to set character position.")
        Return
    }

    ; Positions
    PosXInc := CenterX + SqmSize
    PosXDec := CenterX - SqmSize
    PosYInc := CenterY + SqmSize
    PosYDec := CenterY - SqmSize

    MouseLock()
    MouseBackup()

    Send {Shift down}

    MouseClick, right, PosXDec, PosYInc, 1, 0
    MouseClick, right, CenterX, PosYInc, 1, 0
    MouseClick, right, PosXInc, PosYInc, 1, 0
    MouseClick, right, PosXInc, CenterY, 1, 0
    MouseClick, right, PosXInc, PosYDec, 1, 0
    MouseClick, right, CenterX, PosYDec, 1, 0
    MouseClick, right, PosXDec, PosYDec, 1, 0
    MouseClick, right, PosXDec, CenterY, 1, 0
    MouseClick, right, CenterX, CenterY, 1, 0

    ; Shift up twice to be sure
    Send {Shift up}
    Send {Shift up}

    MouseRestore()
    MouseRelease()

    Sleep 100
    Return
}
