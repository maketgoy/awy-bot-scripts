; Press CTRL + ALT + SHIFT + Mouse Middle to get positions

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

^+!MButton::
{
    MouseGetPos, PosX, PosY

    posText := "X: " PosX " | Y: " PosY
    clipboard := posText

    Notify(posText " | copied to clipboard.")
    Return
}
