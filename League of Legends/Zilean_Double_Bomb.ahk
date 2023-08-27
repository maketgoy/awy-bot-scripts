; Settings
Hotkey = z

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

AdminRequired()

Process, Priority, , A
SetKeyDelay, -1

Hotkey, $%Hotkey%, Action, On
Return

Action:
{
    Send, {q}
    Sleep, 150
    Send, {w}
    Sleep, 150
    Send, {q}
    Return
}
