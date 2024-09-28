; Auto target first creature on Battle List

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

redboxIcon := GetFile("Elderan Online\Icons\Mixin\redbox.png")
battleIcon := GetFile("Elderan Online\Icons\Window\battle.png")

SetTimer, AutoTarget, 1000
Return

AutoTarget:
{
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

    Return
}
