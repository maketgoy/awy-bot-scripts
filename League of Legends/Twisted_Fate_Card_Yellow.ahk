; Settings
Hotkey = z

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

AdminRequired()

Process, Priority, , A
SetKeyDelay, -1

cardIcon := GetFile("League of Legends\Icons\twisted_fate_card_yellow.png")

Hotkey, $%Hotkey%, PickCard, On
Return

PickCard:
{
    Loop, 10
    {
        ImageSearch, foundX, foundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %cardIcon%
        If (ErrorLevel = 0) {
            Send, {w}
            Break
        }
    }

    Return
}
