; Auto target creatures on Battle List

Hotkey = {Space}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

inputIcon := GetFile("Elderan Online\Icons\Mixin\input.png")
battleIcon := GetFile("Elderan Online\Icons\Window\battle.png")
redbox1Icon := GetFile("Elderan Online\Icons\Mixin\redbox.png")
redbox2Icon := GetFile("Elderan Online\Icons\Mixin\redbox2.png")

SetTimer, AutoTargetAction, 1000
Return

AutoTargetAction:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %inputIcon%
        If !ErrorLevel {
            Return
        }
    }

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

    Send, %Hotkey%

    Return
}
