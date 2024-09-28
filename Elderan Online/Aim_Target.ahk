; Aim target on Battle List

Hotkey = {F1}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatIcon := GetFile("Elderan Online\Icons\Mixin\chat_on.png")
redboxIcon := GetFile("Elderan Online\Icons\Mixin\redbox.png")
battleIcon := GetFile("Elderan Online\Icons\Window\battle.png")

Hotkey, % "$" HotkeyClear(Hotkey), AimTarget, On
Return

AimTarget:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %chatIcon%
        If !ErrorLevel {
            Return
        }
    }

    ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, %battleIcon%
    If ErrorLevel {
        Return
    }

    ImageSearch, targetX, targetY, battleX - 10, battleY + 40, battleX + 150, A_ScreenHeight, *TransBlack %redboxIcon%
    If ErrorLevel {
        Return
    }

    MouseBackup()

    Send, %Hotkey%
    Sleep, 50
    Click, %targetX% %targetY%

    MouseRestore()

    Return
}
