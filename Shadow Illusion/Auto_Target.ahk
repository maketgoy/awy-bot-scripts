; Auto target creatures on Battle List

Hotkey = {Space}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

pzIcon := GetFile("Shadow Illusion\Icons\Status\protect.png")
inputIcon := GetFile("Shadow Illusion\Icons\Mixin\input.png")
battleIcon := GetFile("Shadow Illusion\Icons\Window\battle.png")
redbox1Icon := GetFile("Shadow Illusion\Icons\Mixin\redbox.png")
redbox2Icon := GetFile("Shadow Illusion\Icons\Mixin\redbox2.png")

SetTimer, AutoTargetAction, 500
Return

AutoTargetAction:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %inputIcon%
        If !ErrorLevel {
            Return
        }
    }

    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %pzIcon%
    If !ErrorLevel {
        Return
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
