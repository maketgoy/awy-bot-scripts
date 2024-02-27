; Auto heal self HP

; Settings
Hotkey = {End}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

hpBarIcon := GetFile("Ravendawn\Icons\hp_icon.png")

global hpCheckX := 0
global hpCheckY := 0

SetTimer, HealAction, 1000
SetTimer, CheckBars, 5000
GoSub, CheckBars
Return

HealAction:
{
    If (hpCheckX > 0 && hpCheckY > 0) {
        PixelGetColor, hpColor, hpCheckX, hpCheckY

        rangedColor := SubStr(hpColor, 1, 7)

        If (rangedColor != "0x13138" && rangedColor != "0x14148") {
            Send, %Hotkey%
        }
    }

    Return
}

CheckBars:
{
    ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %hpBarIcon%
    If (ErrorLevel > 0) {
        Return
    }

    hpCheckX := foundX + 60
    hpCheckY := foundY + 5

    Return
}
