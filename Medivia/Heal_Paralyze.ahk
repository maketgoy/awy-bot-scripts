; Heal paralyze status with an hotkey
Hotkey_Spell = {F1}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

paralyzeIcon := GetFile("Medivia\Icons\Status\paralyze.png")

SetTimer, Action, 1000
Return

Action:
{
    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %paralyzeIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
