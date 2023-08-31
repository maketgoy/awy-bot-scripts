; Auto walk when ScrollLock is ON

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

isActive := false

SetTimer, Action, 1000
Return

Action:
{
    If (GetKeyState("ScrollLock", "T")) {
        isActive := true
        Send {LShift down}
        Send {w down}
    } Else If (isActive) {
        isActive := false
        Send {LShift up}
        Send {w up}
    }

    Return
}
