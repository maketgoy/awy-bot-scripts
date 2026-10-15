; Auto loot when walking with WASD or Arrows

; Settings
Hotkey_Use := "x"
Chat_Off_Delay := 800

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatOnIcon := GetFile("PokeAlliance\Icons\chat-on.png")

global isChatOn := false
global lastChatSeen := 0

SetTimer, CheckChatOn, 50
SetTimer, AutoLoot, 100
Return

CheckChatOn:
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %chatOnIcon%

    if (ErrorLevel == 0) {
        ; Encontrou a imagem -> atualiza o timestamp da última vez que foi visto
        lastChatSeen := A_TickCount
        isChatOn := true
    } else {
        ; Só altera para OFF se já se passou o tempo do delay desde a última vez que viu
        if (A_TickCount - lastChatSeen > Chat_Off_Delay) {
            isChatOn := false
        }
    }
Return

AutoLoot:
    ; Trava principal: só roda o loot se o chat estiver 100% OFF
    if (!isChatOn) {
        if GetKeyState("w", "P") || GetKeyState("a", "P") || GetKeyState("s", "P") || GetKeyState("d", "P")
        || GetKeyState("Up", "P") || GetKeyState("Down", "P") || GetKeyState("Left", "P") || GetKeyState("Right", "P")
            Send, %Hotkey_Use%
    }
Return
