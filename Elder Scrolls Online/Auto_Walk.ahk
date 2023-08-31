; Auto walk when ScrollLock is ON

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetTimer, Action, 1000
Return

Action:
{
    If (GetKeyState("ScrollLock", "T")) {
        Send {LShift down}
        Send {w down}
    } Else {
        Send {LShift up}
        Send {w up}
    }

    Return
}
