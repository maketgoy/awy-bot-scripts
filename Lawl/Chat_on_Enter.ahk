; Open/close chat using Enter button

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

menuIcon := GetFile("Lawl\Icons\menu.png")

~Enter::
Sleep, 10

ImageSearch, menuX, menuY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %menuIcon%
If (ErrorLevel > 0) {
    Return
}

Send, {Esc}
Return
