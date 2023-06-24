; Settings
Hotkey = z

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#InstallKeybdHook
#UseHook

If (!A_IsAdmin) {
    MsgBox, Zilean_Double_Bomb: Run Awy Bot has Administrator
}

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
