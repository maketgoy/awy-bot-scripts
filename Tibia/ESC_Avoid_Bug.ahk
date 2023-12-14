~$Esc::
    Critical

    KeyWait, Esc
    KeyWait, Esc, D T0.5
    KeyWait, Esc, D T0.5

    If (!ErrorLevel) {
        MsgBox, YEP
        Send {Alt up}
        Send {Ctrl up}
        Send {Shift up}
        Send {LWin up}
        Send {RWin up}
    }

Return
