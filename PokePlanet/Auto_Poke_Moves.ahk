; Use Scroll Lock to turn auto moves

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

UseKey := 0
SetTimer, Action, 200
Return

XButton1::
{
    UseKey := UseKey ? 0 : 1
    Notify("Auto Poke Moves " (UseKey ? "On" : "Off"))
    Return
}

Action:
{
    If (!UseKey) {
        Return
    }

    Send, %UseKey%
    UseKey++

    If (UseKey > 7) {
        UseKey := 1
    }

    Return
}
