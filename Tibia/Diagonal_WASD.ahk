; Diagonal walk using combination of WASD

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

global moving := false
global lastKey := 0

SetTimer, Movement, 100
Return

$w::
$a::
$s::
$d::
    key := StrReplace(A_ThisHotkey, "$", "")

    If (!moving) {
        Send, {%key%}
        Sleep, 50
        SetTimer, Movement, On
    }

    lastKey := key
Return

$w up::
$a up::
$s up::
$d up::
    If (lastKey == StrReplace(StrReplace(A_ThisHotkey, "$", ""), " up", "")) {
        lastKey := 0
    }
Return

Movement:
{
    moving := false

    If (GetKeyState("Ctrl", "P")) {
        SetTimer, Movement, Off
        Return
    }

    If (GetKeyState("Alt", "P")) {
        SetTimer, Movement, Off
        Return
    }

    If (GetKeyState("Shift", "P")) {
        SetTimer, Movement, Off
        Return
    }

    wPressed := GetKeyState("w", "P")
    aPressed := GetKeyState("a", "P")
    sPressed := GetKeyState("s", "P")
    dPressed := GetKeyState("d", "P")

    If (!wPressed && !aPressed && !sPressed && !dPressed) {
        SetTimer, Movement, Off
        Return
    }

    key := 0

    If (wPressed && aPressed) {
        key := "NumpadHome"
    } Else If (wPressed && dPressed) {
        key := "NumpadPgUp"
    } Else If (sPressed && aPressed) {
        key := "NumpadEnd"
    } Else If (sPressed && dPressed) {
        key := "NumpadPgDn"
    } Else If (lastKey) {
        key := lastKey
    } Else If (wPressed) {
        key := "w"
    }  Else If (aPressed) {
        key := "a"
    } Else If (sPressed) {
        key := "s"
    } Else If (dPressed) {
        key := "d"
    }

    If (key) {
        moving := true
        Send, {Blind}{%key%}
    } Else {
        SetTimer, Movement, Off
    }

    Return
}
