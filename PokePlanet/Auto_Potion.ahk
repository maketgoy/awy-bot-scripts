; Auto potion on pokemon

; Settings
Hotkey  = {r}
Percent := 20

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

hpIcon := GetFile("PokePlanet\Icons\hp_exp.png")

global barPosX := 0
global barPosY := 0
global barWidth := 272

SetTimer, CheckBar, 1000
SetTimer, Action, 200
GoSub, CheckBar
Return

CheckBar:
{
    ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *10 *TransBlack %hpIcon%

    If (ErrorLevel > 0) {
        Notify("HP bar not found.")
        Return
    }

    ; icon width = 22
    barPosX := iconX + 22
    barPosY := iconY + 2

    Return
}

Action:
{
    If (barPosX <= 0 || barPosY <= 0 || barWidth <= 0) {
        Return
    }

    percentX := barPosX + (barWidth * Percent / 100)

    PixelSearch, foundX, foundY, percentX, barPosY, percentX, barPosY, 0x36369C, 10, Fast

    If (ErrorLevel) {
        Send, %Hotkey%
        Sleep, 500
    }

    Return
}
