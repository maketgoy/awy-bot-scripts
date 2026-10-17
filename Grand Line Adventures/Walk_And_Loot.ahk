; Auto loot when walking with WASD or Arrows

; Settings
Hotkey_Loot := "e"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatOnIcon := GetFile("Grand Line Adventures\Icons\chat_on.png")
inputIcon := GetFile("Grand Line Adventures\Icons\input.png")
mapOpenIcon := GetFile("Grand Line Adventures\Icons\map_open.png")

global isSuspended := false

SetTimer, CheckIcons, 100
SetTimer, AutoLoot, 100
Return

CheckIcons:
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

    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %inputIcon%
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
