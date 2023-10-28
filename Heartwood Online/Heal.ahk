; Auto heal self HP

; Settings
Hotkey  = {1}
Percent := 60

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

hpBarIcon := GetFile("Heartwood Online\Icons\health_self.png")

global barsWidth := 168
global hpCheckX := 0
global hpCheckY := 0

SetTimer, HealAction, 1000
SetTimer, CheckBars, 5000
GoSub, CheckBars
Return

HealAction:
{
    If (hpCheckX > 0 && hpCheckY > 0) {
        PixelGetColor, hpColor, hpCheckX, hpCheckY, RGB

        If (hpColor != "0xE20C0C" && hpColor != "0xB41111") {
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

    hpCheckX := (foundX + 4) + (barsWidth * Percent / 100)
    hpCheckY := (foundY + 16)

    Return
}
