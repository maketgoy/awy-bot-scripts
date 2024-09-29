; Aim target on Battle List

Hotkey = {f}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatIcon := GetFile("Elderan Online\Icons\Mixin\chat_on.png")
battleIcon := GetFile("Elderan Online\Icons\Window\battle.png")
redbox1Icon := GetFile("Elderan Online\Icons\Mixin\redbox.png")
redbox2Icon := GetFile("Elderan Online\Icons\Mixin\redbox2.png")

If CheckChat {
    SetTimer, CheckChatAction, 200
}

#If !isChatOn
Hotkey, % "$" HotkeyClear(Hotkey), AimTargetAction, On
Return

CheckChatAction:
{
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %chatIcon%
    isChatOn := !ErrorLevel
    Return
}

AimTargetAction:
{
    ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, %battleIcon%
    If ErrorLevel {
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
        Return
    }

    MouseBackup()

    Send, %Hotkey%
    Sleep, 50
    Click, %targetX% %targetY%

    MouseRestore()

    Return
}
