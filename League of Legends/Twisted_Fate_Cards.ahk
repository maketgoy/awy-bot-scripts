; Leave hotkeys empty to disable each one

; Settings
Hotkey_Yellow = z
Hotkey_Blue   = x
Hotkey_Red    = c

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

AdminRequired()

Process, Priority, , A
SetKeyDelay, -1

skillIcon := GetFile("League of Legends\Icons\twisted_fate_w.png")
yellowIcon := GetFile("League of Legends\Icons\twisted_fate_card_yellow.png")
blueIcon := GetFile("League of Legends\Icons\twisted_fate_card_blue.png")
redIcon := GetFile("League of Legends\Icons\twisted_fate_card_red.png")

global iconToPick := ""

If (Hotkey_Yellow) {
    Hotkey, $%Hotkey_Yellow%, PickYellow, On
}

If (Hotkey_Blue) {
    Hotkey, $%Hotkey_Blue%, PickBlue, On
}

If (Hotkey_Red) {
    Hotkey, $%Hotkey_Red%, PickRed, On
}

SetTimer, PickCard, 100

Return

PickYellow:
  iconToPick := yellowIcon
Return

PickBlue:
  iconToPick := blueIcon
Return

PickRed:
  iconToPick := redIcon
Return

PickCard:
{
    If (!iconToPick) {
        Return
    }

    ImageSearch, foundX, foundY, 0, A_ScreenHeight / 2, A_ScreenWidth, A_ScreenHeight, %skillIcon%

    If (ErrorLevel = 0) {
        Send, {w}
    }

    ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %iconToPick%

    If (ErrorLevel = 0) {
        Send, {w}
        iconToPick := ""
    }

    Return
}

