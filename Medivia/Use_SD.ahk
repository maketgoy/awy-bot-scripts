; Set hotkey to use item on cursor position.
; If ScrollLock is on, it will use on battle list.

; Settings
Hotkey_Run = {XButton2}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Rune\sd.png")
redboxIcon := GetFile("Medivia\Icons\Mixin\redbox.png")
battleIcon := GetFile("Medivia\Icons\Window\battle.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%

    If (ErrorLevel = 1) {
        Notify("SD not found.")
        Return
    }

    MouseGetPos, targetX, targetY

    If (GetKeyState("ScrollLock", "T")) {
        ImageSearch, targetX, targetY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *TransBlack %redboxIcon%

        If (ErrorLevel != 0) {
            ImageSearch, battleX, battleY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %battleIcon%

            If (ErrorLevel == 0) {
                targetX := battleX + 10
                targetY := battleY + 50
            }
        }
    }

    MouseBackup()
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0
    MouseRestore()

    Sleep, 200
    Return
}
