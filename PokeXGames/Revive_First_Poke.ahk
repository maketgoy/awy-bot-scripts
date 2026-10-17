; Put the "Revive" in a hotkey of the icon bar and change the usage to:
; "Switch to quick use", then enter the hotkey below:

; Coloque o "Revive" numa hotkey da barra de ícones e mude o uso para:
; "Trocar para uso rápido", depois informe a hotkey abaixo:

; Settings
Hotkey_Revive := "F1"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

;SetKeyDelay, -1, -1
;SetMouseDelay, -1
;SetDefaultMouseSpeed, 0

closeIcon := GetFile("PokeXGames\Icons\close.png")
mapOpenIcon := GetFile("PokeXGames\Icons\map_open.png")
chatOnIcon := GetFile("PokeXGames\Icons\chat_on.png")
inputFocusIcon := GetFile("PokeXGames\Icons\input_focus.png")

global isSuspended := false

Hotkey, % "~$" . Hotkey_Revive, Revive, On

SetTimer, CheckIcons, 100
Return

CheckIcons:
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %closeIcon%
    If (ErrorLevel == 0) {
        isSuspended := true
        Return
    }

    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %mapOpenIcon%
    If (ErrorLevel == 0) {
        isSuspended := true
        Return
    }

    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %chatOnIcon%
    If (ErrorLevel == 0) {
        isSuspended := true
        Return
    }

    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %inputFocusIcon%
    If (ErrorLevel == 0) {
        isSuspended := true
        Return
    }

    isSuspended := false
Return

Revive:
{
    If (isSuspended) {
        Return
    }

    MouseLock()
    MouseBackup()

    Click, 35, 70
    Sleep, 100
    Send, {%Hotkey_Revive%}
    Sleep, 100
    Click, 35, 70

    MouseRestore()
    MouseRelease()

    Return
}
