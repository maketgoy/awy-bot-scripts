; Custom hotkeys

; Settings
Inventory  = {i}
Map        = {m}
Target     = {Tab}
PartyFocus = {Space}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, % "$" HotkeyClear(Inventory), ActionInventory, On
Hotkey, % "$" HotkeyClear(Map), ActionMap, On
Hotkey, % "$" HotkeyClear(Target), ActionTarget, On
Hotkey, % "$" HotkeyClear(PartyFocus), ActionPartyFocus, On
Return

ActionInventory:
Send, {i}
Return

ActionMap:
Send, {m}
Return

ActionTarget:
Send, {Tab}
Return

ActionPartyFocus:
Send, {Space}
Return
