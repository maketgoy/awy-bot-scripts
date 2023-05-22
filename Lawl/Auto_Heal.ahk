; Auto Heal

; Settings
HP_Percent := 30
Hotkey_Use = {1}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

hpPosX := 20
hpPosY := 50
hpWidth := 520
noHpColor := 0x0A0B0D

Loop
{
    iterations := (hpWidth / 10) + 1

    Loop, % iterations
    {
        baseCalc := A_Index * 10
        currentPosX := hpPosX + baseCalc
        PixelGetColor, color, %currentPosX%, %hpPosY%

        if (color == noHpColor) {
            currentHpPercent := baseCalc / hpWidth * 100

            if (currentHpPercent <= HP_Percent) {
                Send, %Hotkey_Use%
            }

            Break
        }
    }

    Sleep, 100
}
