; Settings
Hotkey_Run = x

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

AdminRequired()

Process, Priority, , A

Hotkey, $%Hotkey_Run%, Combo, On
Return

Combo:
{
    MouseLock()

    Send, {e}
    Sleep, 350

    Send, {w}
    Send, {q}

    Sleep, 500
    MouseRelease()

    Return
}
