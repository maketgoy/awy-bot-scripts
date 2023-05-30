; Priority is to heal HP instead of MP. READ PLEASE
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%
; Priority is to heal HP instead of MP

; Settings
HP_Hotkey  = {F6}
HP_Percent := 50
MP_Hotkey  = {F7}
MP_Percent := 50

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

global hpBarPosX := 0
global hpBarPosY := 0
global hpBarWidth := 0

global mpBarPosX := 0
global mpBarPosY := 0
global mpBarWidth := 0

global lastWidthCheck := 0
global lastHeightCheck := 0

SetTimer, CheckBars, 500
SetTimer, Action, 200
GoSub, CheckBars
Return

CheckBar:
{
    CoordMode, Pixel, Client
    WinGetPos, X, Y, W, H, ahk_exe %WindowExe%

    ; HP
    CoordMode, Pixel, Client
    PixelSearch, healthX, healthY, 0, 0, 100, 100, 0x010195, 5, Fast
    hpBarPosX := healthX
    hpBarPosY := healthY

    CoordMode, Pixel, Client
    PixelSearch, endX, endY, healthX, healthY, W / 2, healthY, 0x333A44, 10, Fast
    hpBarWidth := endX - hpBarPosX

    ; MP
    CoordMode, Pixel, Client
    PixelSearch, manaX, manaY, 0, 0, 100, 100, 0xA80415, 5, Fast
    mpBarPosX := manaX
    mpBarPosY := manaY

    CoordMode, Pixel, Client
    PixelSearch, endX, endY, manaX, manaY, W / 2, manaY, 0x333A44, 10, Fast
    mpBarWidth := endX - barPosX

    lastWidthCheck := W
    lastHeightCheck := H

    Return
}


Action:
{
    CoordMode, Pixel, Client
    WinGetPos, X, Y, W, H, ahk_exe %WindowExe%

    If (W != lastWidthCheck || H != lastHeightCheck) {
        Return
    }

    ; Heal HP
    If (hpBarPosX > 0 && hpBarPosY > 0 && hpBarWidth > 0) {
        pixelX := hpBarPosX + (hpBarWidth * HP_Percent / 100)
        pixelY := hpBarPosY

        CoordMode, Pixel, Client
        PixelSearch, foundX, foundY, pixelX, pixelY, pixelX, pixelY * 2, 0x010195, 50, Fast

        If (ErrorLevel) {
            Send, %HP_Hotkey%
            Return ; priority is to heal HP instead of MP
        }
    }

    ; Heal MP
    If (mpBarPosX > 0 && mpBarPosY > 0 && mpBarWidth > 0) {
        pixelX := mpBarPosX + (mpBarWidth * MP_Percent / 100)
        pixelY := mpBarPosY

        CoordMode, Pixel, Client
        PixelSearch, foundX, foundY, pixelX, pixelY, pixelX, pixelY * 2, 0xA80415, 50, Fast

        If (ErrorLevel) {
            Send, %MP_Hotkey%
        }
    }

    Return
}
