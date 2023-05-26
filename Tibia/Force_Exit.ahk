; Set hotkey to force exit Tibia
; + is for SHIFT
; ^ is for CTRL
; ! is for ALT

; Settings
Hotkey = ^+{q}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

key := HotkeyClear(Hotkey)
Hotkey, ~$%key%, Action, On
Return

Action:
{
    Send, ^{q}
    Sleep, 200
    Process, Close, %WindowExe%
    Return
}
