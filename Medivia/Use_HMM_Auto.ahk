; If ScrollLock is on,
; Auto target first creature on Battle List and uses HMM on them

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Rune\hmm.png")
redboxIcon := GetFile("Medivia\Icons\Mixin\redbox.png")
battleIcon := GetFile("Medivia\Icons\Window\battle.png")

SetTimer, UseItem, 1000
Return

UseItem:
{
    If (GetKeyState("ScrollLock", "T")) {
        ImageSearch, itemX, itemY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %itemIcon%

        If (ErrorLevel = 1) {
            Notify("HMM not found.")
            Return
        }

        ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %battleIcon%

        If (ErrorLevel == 0) {
            ImageSearch, targetX, targetY, battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redboxIcon%

            If (ErrorLevel > 0) {
                targetX := battleX + 10
                targetY := battleY + 50

                MouseBackup()
                MouseClick, left, %targetX%, %targetY%, 1, 0
                MouseRestore()
            }
        }

        MouseBackup()
        MouseClick, right, %itemX%, %itemY%, 1, 0
        MouseClick, left, %targetX%, %targetY%, 1, 0
        MouseRestore()
    }

    Return
}
