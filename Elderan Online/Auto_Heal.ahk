; Heal HP and MP

; Settings
HP_Percent := 60
HP_Hotkey   = {F5}
MP_Percent := 30
MP_Hotkey   = {F6}
CheckChat  := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Elderan Online\Icons\Mixin\bars.png")
inputIcon := GetFile("Elderan Online\Icons\Mixin\input.png")

global barsWidth := 179
global hpX := 0
global hpY := 0
global mpX := 0
global mpY := 0

SetTimer, CheckBarsActions, 2000
SetTimer, AutoHealAction, 100
GoSub, CheckBarsActions
Return

CheckBarsActions:
{
    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack %barsIcon%
    If ErrorLevel {
        Return
    }

    hpX := (barsX + 1) + (barsWidth * HP_Percent / 100)
    hpY := (barsY + 3)

    mpX := (barsX + 1) + (barsWidth * MP_Percent / 100)
    mpY := (barsY + 15)
}

AutoHealAction:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %inputIcon%
        If !ErrorLevel {
            Return
        }
    }

    If HP_Percent && HP_Hotkey && hpX && hpY {
        PixelGetColor, hpColor, hpX, hpY, Fast RGB

        If (hpColor != 0xFF4444) {
            Send, %HP_Hotkey%
        }
    }

    If MP_Percent && MP_Hotkey && mpX && mpY {
        PixelGetColor, mpColor, mpX, mpY, Fast RGB

        If (mpColor != 0x4444FF) {
            Send, %MP_Hotkey%
        }
    }

    Sleep, 500
}
