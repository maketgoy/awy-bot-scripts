; Auto Mana

; Settings
MP_Percent := 30
Hotkey_Use = {2}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

mpPosX := 20
mpPosY := 75
mpWidth := 535
noMpColor := 0x0A0B0D

Loop
{
    Loop, % mpWidth
    {
        currentPosX := A_Index + mpPosX
        PixelGetColor, color, %currentPosX%, %mpPosY%

        if (color == noMpColor) {
            currentMpPercent := A_Index / mpWidth * 100

            if (currentMpPercent <= MP_Percent) {
                Send, %Hotkey_Use%
            }

            Break
        }
    }

    Sleep, 100
}
