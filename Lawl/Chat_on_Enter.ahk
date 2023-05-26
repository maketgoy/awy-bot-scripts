; Open/close chat using Enter button

menuIcon := GetFile("Lawl\Icons\menu.png")

~Enter::
Sleep, 100

ImageSearch, menuX, menuY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %menuIcon%
If (ErrorLevel > 0) {
    Return
}

Send, {Esc}
Return
