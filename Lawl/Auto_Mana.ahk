; Auto Mana ; READ PLEASE
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%

; Settings
Hotkey_Use    = {2}
MP_Percent   := 30
MP_Bar_Width := 500

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

menuIcon := GetFile("Lawl\Icons\menu.png")

mpPosX := 20
mpPosY := 75
mpColor := 0xA80415
mpWidth := MP_Bar_Width

Loop
{
    Sleep, 200

    ImageSearch, menuX, menuY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %menuIcon%
    If (ErrorLevel > 0) {
        Continue
    }

    pixelX := mpPosX + (MP_Bar_Width * MP_Percent / 100)
    PixelSearch, foundX, foundY, pixelX, mpPosY, pixelX, mpPosY, mpColor, 50, Fast

    If (ErrorLevel) {
        Send, %Hotkey_Use%
        Sleep, 200
    }
}
