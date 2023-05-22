; Auto Heal
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%

; Settings
Hotkey_Use    = {1}
HP_Percent   := 30
HP_Bar_Width := 520

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

hpPosX := 20
hpPosY := 48
hpColor := 0x01018A
hpWidth := HP_Bar_Width

Loop
{
    pixelX := hpPosX + (HP_Bar_Width * HP_Percent / 100)
    PixelGetColor, color, %pixelX%, %hpPosY%

    if (color != hpColor) {
        Send, %Hotkey_Use%
        Sleep, 200
    }

    Sleep, 200
}
