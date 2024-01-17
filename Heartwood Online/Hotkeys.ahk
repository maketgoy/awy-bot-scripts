; Custom hotkeys

; Settings
Spell_1   = {q}
Spell_2   = {f}
Spell_3   = {e}
Spell_4   = {r}
Loot      = {x}
Mount     = {z}
Teleport  = {t}
Inventory = {Tab}
Map       = {CapsLock}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, % "$" HotkeyClear(Spell_1), ActionSpell1, On
Hotkey, % "$" HotkeyClear(Spell_2), ActionSpell2, On
Hotkey, % "$" HotkeyClear(Spell_3), ActionSpell3, On
Hotkey, % "$" HotkeyClear(Spell_4), ActionSpell4, On
Hotkey, % "$" HotkeyClear(Loot), ActionLoot, On
Hotkey, % "$" HotkeyClear(Mount), ActionMount, On
Hotkey, % "$" HotkeyClear(Teleport), ActionTeleport, On
Hotkey, % "$" HotkeyClear(Inventory), ActionInventory, On
Hotkey, % "$" HotkeyClear(Map), ActionMap, On
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

ActionLoot:
Send, {e}
Return

ActionMount:
Send, {z}
Return

ActionTeleport:
Send, {t}
Return

ActionInventory:
Send, {i}
Return

ActionMap:
Send, {m}
Return
