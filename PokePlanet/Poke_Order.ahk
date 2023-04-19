; Settings
Hotkey_Run = {MButton}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

orderIcon := GetFile("PokePlanet\Icons\order.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, Action, On
Return

Action:
{
    ImageSearch, orderX, orderY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %orderIcon%
    If (ErrorLevel != 0) {
        Notify("Order icon not found.")
        Sleep, 200
        Return
    }

    MouseBackup()
    Click, %orderX%, %orderY%, Right
    Sleep, 50
    Click, %MouseBackupX%, %MouseBackupY%, Left

    Sleep, 200
    Return
}

