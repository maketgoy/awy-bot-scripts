; Auto Mana ; READ PLEASE
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%

; Settings
Hotkey   = {2}
Percent := 30

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

global barPosX := -1
global barPosY := -1
global barWidth := -1
global lastWidthCheck := -1
global lastHeightCheck := -1

SetTimer, CheckBar, 500
SetTimer, Action, 200
GoSub, CheckBar
Return

CheckBar:
{
    CoordMode, Pixel, Client
    WinGetPos, X, Y, W, H, ahk_exe %WindowExe%

    CoordMode, Pixel, Client
    PixelSearch, manaX, manaY, 0, 0, 100, 100, 0xA80415, 5, Fast
    barPosX := manaX
    barPosY := manaY

    CoordMode, Pixel, Client
    PixelSearch, endX, endY, manaX, manaY, W / 2, manaY, 0x333A44, 10, Fast
    barWidth := endX - barPosX

    lastWidthCheck := W
    lastHeightCheck := H

    Return
}

Action:
{
    WinGetPos, X, Y, W, H, ahk_exe %WindowExe%

    If (W != lastWidthCheck || H != lastHeightCheck) {
        barWidth := -1
    }

    If (barWidth == -1) {
        Return
    }

    pixelX := barPosX + (barWidth * Percent / 100)
    pixelY := barPosY

    CoordMode, Pixel, Client
    PixelSearch, foundX, foundY, pixelX, pixelY, pixelX, pixelY * 2, 0xA80415, 50, Fast

    If (ErrorLevel) {
        Send, %Hotkey%
        Sleep, 500
    }

    Return
}
