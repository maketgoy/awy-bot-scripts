; Use CTRL + ALT + RIGHT CLICK to configure the target position.
; Use [ALT + RIGHT CLICK] to mouse click and drag.

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

TargetX := 0
TargetY := 0

^!RButton::
{
    MouseGetPos, TargetX, TargetY
    Notify("X: " TargetX " | Y: " TargetY)
    Return
}

!RButton::
{
    If (TargetX > 0 && TargetY > 0)
    {
        MouseBackup()
        MouseClickDrag, left, %StartX%, %StartY%, %TargetX%, %TargetY%, 0
        MouseRestore()
    } Else {
        Notify("Please use CTRL + ALT + RIGHT CLICK to configure the target position.")
    }

    Sleep, 50
    Return
}
