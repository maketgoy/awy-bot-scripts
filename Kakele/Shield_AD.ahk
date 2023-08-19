; Auto shield AD when in battle
Hotkey_Spell = {k}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

buttonCloseIcon := GetFile("Kakele\Icons\button_close.png")
statusPzIcon := GetFile("Kakele\Icons\status_pz.png")
statusBattleIcon := GetFile("Kakele\Icons\status_battle.png")
statusBuffIcon := GetFile("Kakele\Icons\status_shield_ad.png")

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

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusBattleIcon%
    If (ErrorLevel > 0) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusBuffIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
