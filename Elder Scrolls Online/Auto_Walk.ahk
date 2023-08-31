; Auto walk when ScrollLock is ON

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

isActive := false
isRunning := false

SetTimer, Action, 1000
Return

~w::
~a::
~s::
~d::
{
    isActive := false
    Return
}

~t::
{
    isActive := !isActive
    Return
}

Action:
{
    If (isActive) {
        If (!isRunning) {
            isRunning := true
            Send {LShift down}
            Send {w down}
        }
    } Else {
        If (isRunning) {
            isRunning := false
            Send {LShift up}
            Send {w up}
        }
    }

    Return
}
