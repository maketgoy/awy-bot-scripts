; Settings
Hotkey_Run = z

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
    Sleep, 200
    Send, {w}
    Sleep, 50
    Send, {q}

    Send, +{RButton}
    Sleep, 50
    Send, +{RButton}
    Sleep, 50

    MouseRelease()

    Return
}
