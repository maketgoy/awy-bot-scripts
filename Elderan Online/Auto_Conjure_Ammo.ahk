; Auto target creatures on Battle List

Hotkey = {F1}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatIcon := GetFile("Elderan Online\Icons\Mixin\chat_on.png")
ammoIcon := GetFile("Elderan Online\Icons\Inventory\ammo.png")

SetTimer, Action, 1000
Return

Action:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %chatIcon%
        If !ErrorLevel {
            Return
        }
    }

    ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, %ammoIcon%
    If ErrorLevel {
        Return
    }

    Send, %Hotkey%

    Return
}
