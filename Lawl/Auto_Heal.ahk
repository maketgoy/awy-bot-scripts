; Auto Heal ; READ PLEASE
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%

; Settings
Hotkey  = {F6}
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
    PixelSearch, healthX, healthY, 0, 0, 100, 100, 0x010195, 5, Fast
    barPosX := healthX
    barPosY := healthY

    CoordMode, Pixel, Client
    PixelSearch, endX, endY, healthX, healthY, W / 2, healthY, 0x333A44, 10, Fast
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
        barWidth := -1
    }

    If (barWidth == -1) {
        Return
    }

    pixelX := barPosX + (barWidth * Percent / 100)
    pixelY := barPosY

    CoordMode, Pixel, Client
    PixelSearch, foundX, foundY, pixelX, pixelY, pixelX, pixelY * 2, 0x010195, 50, Fast
    ;Tooltip, barPosX %barPosX% | barPosY: %barPosY% | barWidth %barWidth% | foundX: %foundX% | foundY: %foundY%

    If (ErrorLevel) {
        Send, %Hotkey%
        Sleep, 500
    }

    Return
}
