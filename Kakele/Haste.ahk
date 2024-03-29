; Auto Haste
Hotkey_Spell = {r}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

buttonCloseIcon := GetFile("Kakele\Icons\button_close.png")
statusPzIcon := GetFile("Kakele\Icons\status_pz.png")
statusHasteIcon := GetFile("Kakele\Icons\status_haste.png")

SetTimer, Action, 1000
Return

Action:
{
    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %buttonCloseIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusPzIcon%
    If (ErrorLevel == 0) {
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
