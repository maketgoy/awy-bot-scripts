; Aim target on Battle List

Hotkey = {F1}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

inputIcon := GetFile("Elderan Online\Icons\Mixin\input.png")
battleIcon := GetFile("Elderan Online\Icons\Window\battle.png")
redbox1Icon := GetFile("Elderan Online\Icons\Mixin\redbox.png")
redbox2Icon := GetFile("Elderan Online\Icons\Mixin\redbox2.png")

Hotkey, % "$" HotkeyClear(Hotkey), AimTargetAction, On
Return

AimTargetAction:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %inputIcon%
        If !ErrorLevel {
            Send, %Hotkey%
            Sleep, 200
            Return
        }
    }

    ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, %battleIcon%
    If ErrorLevel {
        Sleep, 200
        Return
    }

    redboxFound := False

    If !redboxFound {
        ImageSearch, targetX, targetY, battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redbox1Icon%
        If !ErrorLevel {
            redboxFound := True
        }
    }

    If !redboxFound {
        ImageSearch, targetX, targetY, battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redbox2Icon%
        If !ErrorLevel {
            redboxFound := True
        }
    }

    If !redBoxFound {
        Sleep, 200
        Return
    }

    MouseBackup()
    Send, %Hotkey%
    Sleep, 100
    MouseClick, left, targetX, targetY
    MouseRestore()

    Sleep, 200
    Return
}
