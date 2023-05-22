; Cast Mana
; ATTENTION: Set HUD Transparency to 100% on "Options > Interface"

; Settings
Hotkey_Use    = {3}
MP_Percent   := 100
MP_Bar_Width := 500

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

mpPosX := 20
mpPosY := 75
mpWidth := MP_Percent

Loop
{
    iterations := (mpWidth / 10) + 1

    Loop, % iterations
    {
        baseCalc := A_Index * 10
        currentPosX := baseCalc + mpPosX
        PixelGetColor, color, %currentPosX%, %mpPosY%

        if (color == 0x0A0B0D || color == 0x0B0C0F) {
            currentMpPercent := baseCalc / mpWidth * 100

            if (currentMpPercent >= MP_Percent) {
                Send, %Hotkey_Use%
            }

            Break
        }
    }

    Sleep, 1000
}
