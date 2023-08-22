; Heal HP and MP detecting Mana Shield

; Settings
HP_Hotkey        = {1}
MP_Hotkey        = {2}
Sacrifice_Hotkey = {e}
HP_Percent      := 80
MP_Percent      := 60

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Kakele\Icons\hp_mp_bars.png")
statusManaShieldIcon := GetFile("Kakele\Icons\status_mana_shield.png")

global hasManaShield := false
global barsWidth := 200
global barsX := 0
global barsY := 0
global hpX := 0
global hpY := 0
global mpX := 0
global mpY := 0

SetTimer, CheckManaShield, 1000
SetTimer, CheckBars, 5000
SetTimer, Action, 200
GoSub, CheckBars
Return

CheckManaShield:
{
    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusManaShieldIcon%
    hasManaShield := ErrorLevel == 0
    Return
}

CheckBars:
{
    ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %barsIcon%
    If (ErrorLevel > 0) {
        Return
    }

    barsX := foundX + 3
    barsY := foundY

    hpX := barsX + (barsWidth * HP_Percent / 100)
    hpY := barsY + 1

    mpX := barsX + (barsWidth * MP_Percent / 100)
    mpY := barsY + 32

    Return
}

Action:
{
    PixelGetColor, hpColor, hpX, hpY, RGB
    PixelGetColor, mpColor, mpX, mpY, RGB

    ; Health Color 0xE80000
    ; Mana Color 0x012DE7
    ; Mana Shield Color 0x57C2FF

    If (hpColor != 0xE80000) {
        Send, %HP_Hotkey%
    }

    If (mpColor != 0x012DE7 && mpColor != 0x57C2FF) {
        If (hasManaShield && hpColor == 0xE80000) {
            Send, %Sacrifice_Hotkey%
        } Else {
            Send, %MP_Hotkey%
        }
    }

    Return
}
