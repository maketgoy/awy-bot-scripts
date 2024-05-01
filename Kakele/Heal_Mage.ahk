; Heal HP and MP detecting Mana Shield

; Settings
HP_Hotkey        = {1}
MP_Hotkey        = {2}
Sacrifice_Hotkey = {e}
HP_Percent      := 60
MP_Percent      := 80

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Kakele\Icons\hp_mp_bars.png")
buttonCloseIcon := GetFile("Kakele\Icons\button_close.png")
statusManaShieldIcon := GetFile("Kakele\Icons\status_mana_shield.png")

global hasOpenedMenu := false
global hasManaShield := false
global barsWidth := 200
global hpX := 0
global hpY := 0
global mpX := 0
global mpY := 0

SetTimer, CheckBars, 5000
SetTimer, CheckStatus, 500
SetTimer, Action, 100
GoSub, CheckBars
Return

CheckStatus:
{
    ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusManaShieldIcon%
    hasManaShield := ErrorLevel == 0

    ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %buttonCloseIcon%
    hasOpenedMenu := ErrorLevel == 0

    Return
}

CheckBars:
{
    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %barsIcon%
    If (ErrorLevel > 0) {
        Return
    }

    hpX := barsX + 3 + (barsWidth * HP_Percent / 100)
    hpY := barsY + 1

    mpX := barsX + 3 + (barsWidth * MP_Percent / 100)
    mpY := barsY + 32

    Return
}

Action:
{
    If (hasOpenedMenu) {
        Return
    }

    PixelGetColor, hpColor, hpX, hpY, RGB
    PixelGetColor, mpColor, mpX, mpY, RGB

    wait := false

    ; NO FILLED HP BAR COLOR 0x101520
    ; NO FILLED MP BAR COLOR 0x121924

    If (hpColor == 0x101520) {
        Send, %HP_Hotkey%
        wait := true
    }

    If (mpColor == 0x121924) {
        If (hasManaShield && hpColor != 0x101520) {
            Send, %Sacrifice_Hotkey%
        } Else {
            Send, %MP_Hotkey%
        }

        wait := true
    }

    If (wait) {
        Sleep, 500
    }

    Return
}
