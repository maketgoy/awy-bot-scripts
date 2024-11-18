; Auto target first creature on Battle List

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

battleIcon := GetFile("Medivia\Icons\Window\battle.png")
redbox1Icon := GetFile("Medivia\Icons\Mixin\redbox.png")
redbox2Icon := GetFile("Medivia\Icons\Mixin\redbox2.png")

SetTimer, AutoTarget, 500
Return

AutoTarget:
{
    ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, %battleIcon%
    If ErrorLevel {
        Return
    }

    ImageSearch, , , battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redbox1Icon%
    If !ErrorLevel {
        Return
    }

    ImageSearch, , , battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redbox2Icon%
    If !ErrorLevel {
        Return
    }

    ImageSearch, targetX, targetY, battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redboxIcon%
    If ErrorLevel {
        targetX := battleX + 10
        targetY := battleY + 50

        MouseBackup()
        MouseClick, left, targetX, targetY
        MouseRestore()
    }

    Return
}
