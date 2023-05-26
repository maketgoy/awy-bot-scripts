; Auto Mana ; READ PLEASE
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%

; Settings
Hotkey  = {F7}
Percent := 30

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

global barPosX := 0
global barPosY := 0
global barWidth := 0
global lastWidthCheck := 0
global lastHeightCheck := 0

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
    CoordMode, Pixel, Client
    WinGetPos, X, Y, W, H, ahk_exe %WindowExe%

    If (W != lastWidthCheck || H != lastHeightCheck) {
        barWidth := 0
    }

    If (barPosX <= 0 || barPosY <= 0 || barWidth <= 0) {
        Return
    }

    pixelX := barPosX + (barWidth * Percent / 100)
    pixelY := barPosY

    CoordMode, Pixel, Client
    PixelSearch, foundX, foundY, pixelX, pixelY, pixelX, pixelY * 2, 0xA80415, 50, Fast
    ;Tooltip, barPosX %barPosX% | barPosY: %barPosY% | barWidth %barWidth% | foundX: %foundX% | foundY: %foundY%

    If (ErrorLevel) {
        Send, %Hotkey%
        Sleep, 500
    }

    Return
}
