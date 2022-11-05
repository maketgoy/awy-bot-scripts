; Set hotkey to force exit Medivia
; + is for SHIFT
; ^ is for CTRL
; ! is for ALT

; Settings
Hotkey_Run = ^+{q}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, Action, On
Return

Action:
{
    Send, ^{q}
    Sleep, 200
    Process, Close, medivia.exe
    Return
}
