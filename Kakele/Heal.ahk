; Heal HP and MP

; Settings
HP_Hotkey  = {1}
HP_Percent := 50
MP_Hotkey  = {2}
MP_Percent := 50

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Kakele\Icons\hp_mp_bars.png")

SetTimer, Action, 200
Return

Action:
{
    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %barsIcon%
    If (ErrorLevel > 0) {
        Return
    }

    barWidth := 200

    hpX := barsX + 3 + (barWidth * HP_Percent / 100)
    hpY := barsY + 1

    mpX := barsX + 3 + (barWidth * MP_Percent / 100)
    mpY := barsY + 32

    PixelGetColor, hpColor, hpX, hpY, RGB
    PixelGetColor, mpColor, mpX, mpY, RGB

    If (hpColor != 0xE80000) {
        Send, %HP_Hotkey%
    }

    If (mpColor != 0x012DE7) {
        Send, %MP_Hotkey%
    }

    Return
}
