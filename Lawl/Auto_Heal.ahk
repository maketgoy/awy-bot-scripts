; Auto Heal
; ATTENTION: Set HUD Transparency to 100% on "Options > Interface"

; Settings
Hotkey_Use    = {1}
HP_Percent   := 30
HP_Bar_Width := 520

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

hpPosX := 20
hpPosY := 50
hpWidth := HP_Bar_Width

Loop
{
    iterations := (hpWidth / 10) + 1

    Loop, % iterations
    {
        baseCalc := A_Index * 10
        currentPosX := hpPosX + baseCalc
        PixelGetColor, color, %currentPosX%, %hpPosY%

        if (color == 0x0A0B0D || color == 0x0B0C0F) {
            currentHpPercent := baseCalc / hpWidth * 100

            if (currentHpPercent <= HP_Percent) {
                Send, %Hotkey_Use%
            }

            Break
        }
    }

    Sleep, 100
}
