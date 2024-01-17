; Avoid kicking after no action for 15 minutes

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetKeyDelay, 1, 1

AdminRequired()

IsAway := True
Direction := "Down"

SetTimer, AntiIdle, 60000
Gosub, AntiIdle
Return

~*Up::
~*Left::
~*Down::
~*Right::
~*w::
~*a::
~*s::
~*d::
~*NumpadEnd::
~*NumpadDown::
~*NumpadPgDn::
~*NumpadLeft::
~*NumpadClear::
~*NumpadRight::
~*NumpadHome::
~*NumpadUp::
~*NumpadPgUp::
{
    IsAway := False
    Return
}

~^Up::
~^Left::
~^Down::
~^Right::
~^w::
~^a::
~^s::
~^d::
~^NumpadUp::
~^NumpadLeft::
~^NumpadDown::
~^NumpadRight::
{

    Key := StrReplace(A_ThisHotkey, "~", "")
    Key := StrReplace(Key, "^", "")

    If (Key == "w") {
        Key := "Up"
    }

    If (Key == "a") {
        Key := "Left"
    }

    If (Key == "s") {
        Key := "Down"
    }

    If (Key == "d") {
        Key := "Right"
    }

    Direction := StrReplace(Key, "Numpad", "")
    Return
}

AntiIdle:
{
    If (IsAway) {
        MouseLock()

        If (Direction == "Up") {
            ControlSend, , ^{Down}, ahk_exe %WindowExe%
        }

        If (Direction == "Down") {
            ControlSend, , ^{Up}, ahk_exe %WindowExe%
        }

        If (Direction == "Left") {
            ControlSend, , ^{Right}, ahk_exe %WindowExe%
        }

        If (Direction == "Right") {
            ControlSend, , ^{Left}, ahk_exe %WindowExe%
        }

        Sleep, 100
        ControlSend, , ^{%Direction%}, ahk_exe %WindowExe%

        MouseRelease()
    }

    IsAway := True

    Return
}
