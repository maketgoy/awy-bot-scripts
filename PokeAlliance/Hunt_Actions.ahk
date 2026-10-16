; Automatically do some actions whenever the configured ReviveHotkey is pressed

; Settings
ComboHotkey = {F}
ReviveHotkey = {R}
MedicineHotkey = {T}
PokeStopHotkey = {Z}
OffensiveMode = {NumpadAdd}
DefensiveMode = {NumpadSub}

Chat_Off_Delay := 800

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

closeIcon := GetFile("PokeAlliance\Icons\close.png")
chatOnIcon := GetFile("PokeAlliance\Icons\chat-on.png")

global lastChatSeen := 0
global isChatOn := false
global isWindowOpen := false
global hotkeysActive := true

SetTimer, CheckIcons, 50

; Ativa as hotkeys no início
Hotkey, % HotkeyClear(ComboHotkey), OnCombo
Hotkey, % "~" . HotkeyClear(ReviveHotkey), OnRevive
Return

CheckIcons:
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %closeIcon%
    If (ErrorLevel == 0) {
        isWindowOpen := true
    } Else {
        isWindowOpen := false

        ; Só procura o chat se nenhuma janela esteve aberta
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %chatOnIcon%

        If (ErrorLevel == 0) {
            lastChatSeen := A_TickCount
            isChatOn := true
        } Else {
            if (A_TickCount - lastChatSeen > Chat_Off_Delay) {
                isChatOn := false
            }
        }
    }

    ; Lógica para desligar/ligar as Hotkeys dinamicamente
    shouldEnable := (!isWindowOpen && !isChatOn)

    If (shouldEnable && !hotkeysActive) {
        Hotkey, % HotkeyClear(ComboHotkey), On
        Hotkey, % "~" . HotkeyClear(ReviveHotkey), On
        hotkeysActive := true
    } Else If (!shouldEnable && hotkeysActive) {
        Hotkey, % HotkeyClear(ComboHotkey), Off
        Hotkey, % "~" . HotkeyClear(ReviveHotkey), Off
        hotkeysActive := false
    }
Return

OnCombo:
    Send, %PokeStopHotkey%
    Send, %OffensiveMode%
    Send, %MedicineHotkey%
    Send, %ComboHotkey%
Return

OnRevive:
    Send, %DefensiveMode%
    Sleep, 750
    Send, %PokeStopHotkey%
Return
