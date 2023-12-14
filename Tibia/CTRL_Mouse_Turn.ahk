gap      := 150
CharPosX := VarGet("Tibia.CharPosX", A_ScreenWidth / 2)
CharPosY := VarGet("Tibia.CharPosY", A_ScreenWidth / 2)

$^LButton::

MouseGetPos, mouseX, mouseY

If (mouseX < (CharPosX - gap)) {
    Send, ^{Left}
}

If (mouseX > (CharPosX + gap)) {
    Send, ^{Right}
}

If (mouseY < (CharPosY - gap)) {
    Send, ^{Up}
}

If (mouseY > (CharPosY + gap)) {
    Send, ^{Down}
}

; CTRL up twice to be sure
Send {Ctrl up}
Send {Ctrl up}

Return
