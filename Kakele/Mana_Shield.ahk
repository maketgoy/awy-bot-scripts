; Auto cast mana shield
Hotkey_Spell = {z}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

buttonCloseIcon := GetFile("Kakele\Icons\button_close.png")
statusPzIcon := GetFile("Kakele\Icons\status_pz.png")
statusManaShieldIcon := GetFile("Kakele\Icons\status_mana_shield.png")

SetTimer, Action, 500
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

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusManaShieldIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
