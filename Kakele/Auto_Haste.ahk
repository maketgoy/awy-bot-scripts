; Heal paralyze status with an hotkey
Hotkey_Spell = {r}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

buttonClose := GetFile("Kakele\Icons\button_close.png")
statusHasteIcon := GetFile("Kakele\Icons\status_haste.png")

SetTimer, Action, 1000
Return

Action:
{
    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %buttonClose%
    If (ErrorLevel > 0) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusHasteIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
