; Custom hotkeys

; Settings
Inventory = {Tab}
Map       = {CapsLock}
Target    = {Space}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, % "$" HotkeyClear(Inventory), ActionInventory, On
Hotkey, % "$" HotkeyClear(Map), ActionMap, On
Hotkey, % "$" HotkeyClear(Target), ActionTarget, On
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
