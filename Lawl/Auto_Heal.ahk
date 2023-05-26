; Auto Heal ; READ PLEASE
; ATTENTION: "Options > Interface": set HUD size to MINIMUM and Transparency to 100%

; Settings
Hotkey_Use    = {1}
HP_Percent   := 30

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
    currentBarPosX := -1
    currentBarPosY := -1
    currentBarWidth := -1

    CoordMode, Pixel, Client
    WinGetPos, X, Y, W, H, ahk_exe %WindowExe%
    iterations := W / 2

    ; Get bar pos Y
    CoordMode, Pixel, Client
    PixelSearch, foundX, foundY, 100, 0, 100, 20, 0x333A44, 10, Fast
    currentBarPosY := foundY

    Loop, %iterations%
    {
        CoordMode, Pixel, Client

        CoordMode, Pixel, Client
        PixelSearch, foundX, foundY, A_Index, currentBarPosY, A_Index, currentBarPosY, 0x333A44, 5, Fast

        If (ErrorLevel == 0) {
            If (currentBarPosX == -1) {
                currentBarPosX := A_Index
            }

            currentBarWidth := A_Index - currentBarPosX
        }
    }

    barPosX := currentBarPosX
    barPosY := currentBarPosY
    barWidth := currentBarWidth
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

    pixelX := barPosX + (barWidth * HP_Percent / 100)
    pixelY := barPosY

    CoordMode, Pixel, Client
    PixelSearch, foundX, foundY, pixelX, pixelY, pixelX, pixelY * 2, 0x010195, 50, Fast
    ;Tooltip, barPosX %barPosX% | barPosY: %barPosY% | barWidth %barWidth% | foundX: %foundX% | foundY: %foundY%

    If (ErrorLevel) {
        Send, %Hotkey_Use%
        Sleep, 800
    }

    Return
}
