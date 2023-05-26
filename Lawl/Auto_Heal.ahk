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

menuIcon := GetFile("Lawl\Icons\menu.png")

hpPosX := 20
hpPosY := 48
hpColor := 0x01018A
hpWidth := HP_Bar_Width

Loop
{
    Sleep, 200

    ImageSearch, menuX, menuY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %menuIcon%
    If (ErrorLevel > 0) {
        Continue
    }

    pixelX := hpPosX + (HP_Bar_Width * HP_Percent / 100)
    PixelSearch, foundX, foundY, pixelX, hpPosY, pixelX, hpPosY, hpColor, 50, Fast

    If (ErrorLevel) {
        Send, %Hotkey_Use%
        Sleep, 200
    }
}
