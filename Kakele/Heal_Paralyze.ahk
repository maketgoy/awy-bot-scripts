; Auto Haste
Hotkey_Spell = {r}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

buttonCloseIcon := GetFile("Kakele\Icons\button_close.png")
statusParalyzeIcon := GetFile("Kakele\Icons\status_paralyze.png")

SetTimer, Action, 500
Return

Action:
{
    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %buttonCloseIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusParalyzeIcon%
    If (ErrorLevel > 0) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
