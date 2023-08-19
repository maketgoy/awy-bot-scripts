; Auto Haste
Hotkey_Spell = {r}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

buttonCloseIcon := GetFile("Kakele\Icons\button_close.png")
statusHasteIcon := GetFile("Kakele\Icons\status_haste.png")

global standTime := 0

SetTimer, Stand, 1000
SetTimer, Action, 1000
Return

~*Up::
~*Left::
~*Down::
~*Right::
~*w::
~*a::
~*s::
~*d::
{
    standTime := 0
    Return
}

Stand:
{
    If (standTime <= 10000) {
        standTime += 1000
    }
    Return
}

Action:
{
    If (standTime > 10000) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %buttonCloseIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %statusHasteIcon%
    If (ErrorLevel == 0) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
