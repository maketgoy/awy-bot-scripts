; Repeat use for a hotkey when CapsLock is ON

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
    If (GetKeyState("CapsLock", "T")) {
        Send, %Hotkey_Use%
    }

    Return
}
