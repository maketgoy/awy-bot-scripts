; Auto order pokemon

; Settings
Hotkey = {MButton}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1
SetDefaultMouseSpeed, 0

orderIcon := GetFile("PokePlanet\Icons\order.png")

key := HotkeyClear(Hotkey)
Hotkey, $%key%, Action, On
Return

Action:
{
    ImageSearch, orderX, orderY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %orderIcon%

    If (ErrorLevel > 0) {
        Notify("Order icon not found.")
        Return
    }

    MouseGetPos, posX, posY
    Click, %orderX%, %orderY%, Right
    Sleep, 100
    Click, %posX%, %posY%, Left

    Sleep, 100
    Return
}

