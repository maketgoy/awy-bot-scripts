; Custom hotkeys

; Settings
Spell_1   = {q}
Spell_2   = {f}
Spell_3   = {e}
Spell_4   = {r}
Map       = {CapsLock}
Inventory = {Tab}
Teleport  = {t}
Mount     = {z}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, % "$" HotkeyClear(Spell_1), ActionSpell1, %state%
Hotkey, % "$" HotkeyClear(Spell_2), ActionSpell2, %state%
Hotkey, % "$" HotkeyClear(Spell_3), ActionSpell3, %state%
Hotkey, % "$" HotkeyClear(Spell_4), ActionSpell4, %state%
Hotkey, % "$" HotkeyClear(Map), ActionMap, %state%
Hotkey, % "$" HotkeyClear(Inventory), ActionInventory, %state%
Hotkey, % "$" HotkeyClear(Teleport), ActionTeleport, %state%
Hotkey, % "$" HotkeyClear(Mount), ActionMount, %state%
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

ActionTeleport:
Send, {t}
Return

ActionMount:
Send, {z}
Return
