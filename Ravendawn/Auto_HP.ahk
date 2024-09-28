; Auto heal self HP (only works with UI Scale: 100%)

; Settings
Hotkey = {End}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

hpBarIcon := GetFile("Ravendawn\Icons\hp_icon.png")

SetTimer, HealAction, 1000
Return

HealAction:
{
    ImageSearch, hpCheckX, hpCheckY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %hpBarIcon%
    If (ErrorLevel > 0) {
        Return
    }

    hpCheckX += 80
    hpCheckY += 5

    PixelGetColor, hpColor, hpCheckX, hpCheckY

    rangedColor := SubStr(hpColor, 1, 7)

    If (rangedColor != "0x13138" && rangedColor != "0x14148") {
        Send, %Hotkey%
    }

    Return
}

