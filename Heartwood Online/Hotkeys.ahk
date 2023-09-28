; Custom hotkeys with auto open/close chat

; Hotkeys
Spell_1 = {q}
Spell_2 = {f}
Spell_3 = {e}
Spell_4 = {r}
Map = {CapsLock}
Inventory = {Tab}

; Settings
ChatControl := true

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

chatIcon := GetFile("Heartwood Online\Icons\chat_open.png")

isChatOpen := false
chatInputX := 0
chatInputY := 0

Hotkey, $Enter, ActionChat, On

SetTimer, CheckHotkeys, 200
Return

CheckHotkeys:
{
    ImageSearch, chatInputX, chatInputY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %chatIcon%
    isChatOpen := ErrorLevel == 0

    state := isChatOpen ? "Off" : "On"

    Hotkey, % "$" HotkeyClear(Spell_1), ActionSpell1, %state%
    Hotkey, % "$" HotkeyClear(Spell_2), ActionSpell2, %state%
    Hotkey, % "$" HotkeyClear(Spell_3), ActionSpell3, %state%
    Hotkey, % "$" HotkeyClear(Spell_4), ActionSpell4, %state%
    Hotkey, % "$" HotkeyClear(Map), ActionMap, %state%
    Hotkey, % "$" HotkeyClear(Inventory), ActionInventory, %state%

    Return
}

Return

ActionSpell1:
Send, {1}
Return

ActionSpell2:
Send, {2}
Return

ActionSpell3:
Send, {3}
Return

ActionSpell4:
Send, {4}
Return

ActionMap:
Send, {m}
Return

ActionInventory:
Send, {i}
Return

ActionChat:
If (!ChatControl) {
    Send, {Enter}
    Return
}
If (isChatOpen) {
    MouseBackup()
    MouseClick, left, % chatInputX + 100, %chatInputY%
    Sleep, 10
    Send, {Enter}
    Sleep, 10
    Send, {c}
    MouseRestore()
} Else {
    Send, {c}
    Sleep, 50
    Send, {Enter}
}
Return
