; Press a key to loot all around
; Set AutoUseDelay to 0 to disable auto use

; Settings
Hotkey        = {x}
AutoUseDelay := 0

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

ClickCount := 12
ClickGap   := 20
CenterX := (A_ScreenWidth / 2) - (ClickCount / 2 * ClickGap)
CenterY := (A_ScreenHeight / 2) - (ClickCount / 2 * ClickGap)

If (AutoUseDelay) {
    SetTimer, Action, %AutoUseDelay%
}

Hotkey, % "$" HotkeyClear(Hotkey), Action, On
Return

Action:
{
    MouseBackup()
    MouseLock()

    Loop, %ClickCount%
    {
        posY := CenterY + (A_Index - 1) * ClickGap

        Loop, %ClickCount%
        {
            posX := CenterX + (A_Index - 1) * ClickGap

            MouseClick, left, posX, posY, 1, 0
        }
    }

    MouseRelease()
    MouseRestore()

    Return
}
