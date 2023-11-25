; Press CTRL + ALT + SHIFT + RIGHT CLICK to change positions

; Settings
Hotkey   = {NumpadIns}
SqmSize := A_ScreenHeight // 15

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

CharPosX := VarGet("Tibia.CharPosX", 0)
CharPosY := VarGet("Tibia.CharPosY", 0)
SetOverlay(CharPosX "x" CharPosY)

key := HotkeyClear(Hotkey)
Hotkey, ~$%key%, Action, On
Return

^+!RButton::
{
    MouseGetPos, CharPosX, CharPosY
    VarSet("Tibia.CharPosX", CharPosX)
    VarSet("Tibia.CharPosY", CharPosY)
    Notify("X: " CharPosX " | Y: " CharPosY)
    Return
}

Action:
{
    If (CharPosX <= 0 || CharPosY <= 0) {
        Notify("First press CTRL + ALT + SHIFT + RIGHT CLICK to set character position.")
        Return
    }

    ; Positions
    PosXInc := CharPosX + SqmSize
    PosXDec := CharPosX - SqmSize
    PosYInc := CharPosY + SqmSize
    PosYDec := CharPosY - SqmSize

    MouseLock()
    MouseBackup()

    Send {Shift down}

    MouseClick, right, PosXDec, PosYInc, 1, 0
    MouseClick, right, CharPosX, PosYInc, 1, 0
    MouseClick, right, PosXInc, PosYInc, 1, 0
    MouseClick, right, PosXInc, CharPosY, 1, 0
    MouseClick, right, PosXInc, PosYDec, 1, 0
    MouseClick, right, CharPosX, PosYDec, 1, 0
    MouseClick, right, PosXDec, PosYDec, 1, 0
    MouseClick, right, PosXDec, CharPosY, 1, 0
    MouseClick, right, CharPosX, CharPosY, 1, 0

    ; Shift up twice to be sure
    Send {Shift up}
    Send {Shift up}

    MouseRestore()
    MouseRelease()

    Sleep 100
    Return
}
