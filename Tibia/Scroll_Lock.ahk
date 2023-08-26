; Repeat use for a hotkey when ScrollLock is ON

; Settings
Hotkey_Use = {F1}
Delay     := 1000

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetTimer, Action, %Delay%
Return

Action:
{
    If (GetKeyState("ScrollLock", "T")) {
        Send, %Hotkey_Spell%
    }

    Return
}
