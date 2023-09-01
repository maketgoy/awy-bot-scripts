; Repeat use for a hotkey when NumLock is ON

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
    If (GetKeyState("NumLock", "T")) {
        Send, %Hotkey_Use%
    }

    Return
}
