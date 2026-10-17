; Auto loot when walking with WASD or Arrows

; Settings
Hotkey_Loot := "E"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

closeIcon := GetFile("PokeXGames\Icons\close.png")
chatOnIcon := GetFile("PokeXGames\Icons\chat_on.png")
inputFocusIcon := GetFile("PokeXGames\Icons\input_focus.png")

global isSuspended := false

SetTimer, CheckIcons, 100
SetTimer, AutoLoot, 100
Return

CheckIcons:
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %closeIcon%
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

AutoLoot:
    If (isSuspended) {
        Return
    }

    If GetKeyState("w", "P") || GetKeyState("a", "P") || GetKeyState("s", "P") || GetKeyState("d", "P")
    || GetKeyState("Up", "P") || GetKeyState("Down", "P") || GetKeyState("Left", "P") || GetKeyState("Right", "P")
        Send, %Hotkey_Loot%
Return
