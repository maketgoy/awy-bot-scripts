; Cast Mana

; Settings
MP_Percent := 100
Hotkey_Use = {3}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

mpPosX := 20
mpPosY := 75
mpWidth := 500
noMpColor := 0x0A0B0D

Loop
{
    iterations := (mpWidth / 10) + 1

    Loop, % iterations
    {
        baseCalc := A_Index * 10
        currentPosX := baseCalc + mpPosX
        PixelGetColor, color, %currentPosX%, %mpPosY%

        if (color == noMpColor) {
            currentMpPercent := baseCalc / mpWidth * 100

            if (currentMpPercent >= MP_Percent) {
                Send, %Hotkey_Use%
            }

            Break
        }
    }

    Sleep, 1000
}
