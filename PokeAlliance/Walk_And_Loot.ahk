; Auto loot when walking with WASD or Arrows

; Settings
Hotkey_Loot := "x"
Chat_Off_Delay := 800

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

closeIcon := GetFile("PokeAlliance\Icons\close.png")
chatOnIcon := GetFile("PokeAlliance\Icons\chat_on.png")

global lastChatSeen := 0
global isChatOn := false
global isWindowOpen := false

SetTimer, CheckIcons, 100
SetTimer, AutoLoot, 100
Return

CheckIcons:
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %closeIcon%
    If (ErrorLevel == 0) {
        isWindowOpen := true
        Return
    } Else {
        isWindowOpen := false
    }

    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %chatOnIcon%

    If (ErrorLevel == 0) {
        ; Encontrou a imagem -> atualiza o timestamp da última vez que foi visto
        lastChatSeen := A_TickCount
        isChatOn := true
    } Else {
        ; Só altera para OFF se já se passou o tempo do delay desde a última vez que viu
        if (A_TickCount - lastChatSeen > Chat_Off_Delay) {
            isChatOn := false
        }
    }
Return

AutoLoot:
    ; Trava principal: só roda o loot se o chat estiver 100% OFF
    If (!isWindowOpen && !isChatOn) {
        if GetKeyState("w", "P") || GetKeyState("a", "P") || GetKeyState("s", "P") || GetKeyState("d", "P")
        || GetKeyState("Up", "P") || GetKeyState("Down", "P") || GetKeyState("Left", "P") || GetKeyState("Right", "P")
            Send, %Hotkey_Loot%
    }
Return
