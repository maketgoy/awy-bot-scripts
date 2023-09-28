; Custom hotkeys

; Settings
Spell_1 = {q}
Spell_2 = {f}
Spell_3 = {e}
Spell_4 = {r}
Map = {CapsLock}
Inventory = {Tab}
Chat = {Enter}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatIcon := GetFile("Heartwood Online\Icons\chat_open.png")

Hotkey, % "$" HotkeyClear(Spell_1), ActionSpell1, On
Hotkey, % "$" HotkeyClear(Spell_2), ActionSpell2, On
Hotkey, % "$" HotkeyClear(Spell_3), ActionSpell3, On
Hotkey, % "$" HotkeyClear(Spell_4), ActionSpell4, On
Hotkey, % "$" HotkeyClear(Map), ActionMap, On
Hotkey, % "$" HotkeyClear(Inventory), ActionInventory, On
Hotkey, % "$" HotkeyClear(Chat), ActionChat, On
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
ImageSearch, chatX, chatY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %chatIcon%
If (ErrorLevel > 0) {
    Send, {c}
    Sleep, 50
}
Send, {Enter}
Return
