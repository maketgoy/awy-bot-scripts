; Press CTRL + ALT + SHIFT + RIGHT CLICK to change positions

; Settings
Hotkey   = {x}
SqmSize := A_ScreenHeight // 15

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, 2

CharPosX := VarGet("Elderan.CharPosX", 0)
CharPosY := VarGet("Elderan.CharPosY", 0)
SetOverlay(CharPosX "x" CharPosY)

key := HotkeyClear(Hotkey)
Hotkey, ~$%key%, AutoLootAction, On
Return

^+!RButton::
{
    MouseGetPos, CharPosX, CharPosY
    VarSet("Elderan.CharPosX", CharPosX)
    VarSet("Elderan.CharPosY", CharPosY)
    Notify("X: " CharPosX " | Y: " CharPosY)
    Return
}

AutoLootAction:
{
    If (CharPosX <= 0 || CharPosY <= 0) {r
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

    MouseClick, right, PosXDec, PosYInc, 1, 0
    MouseClick, right, CharPosX, PosYInc, 1, 0
    MouseClick, right, PosXInc, PosYInc, 1, 0
    MouseClick, right, PosXInc, CharPosY, 1, 0
    MouseClick, right, PosXInc, PosYDec, 1, 0
    MouseClick, right, CharPosX, PosYDec, 1, 0
    MouseClick, right, PosXDec, PosYDec, 1, 0
    MouseClick, right, PosXDec, CharPosY, 1, 0
    MouseClick, right, CharPosX, CharPosY, 1, 0

    MouseRestore()
    MouseRelease()

    Sleep 100
    Return
}
