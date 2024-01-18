; Custom hotkeys

; Settings
Inventory  = {Tab}
Map        = {CapsLock}
Mount      = ^{r}
PartyFocus = {F1}
Target     = {Space}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

RegisterKey(Inventory, "{i}")
RegisterKey(Map, "{m}")
RegisterKey(Mount, "^{r}")
RegisterKey(PartyFocus, "{Space}")
RegisterKey(Target, "{Tab}")
Return

RegisterKey(PressedKey, TargetKey) {
    If (PressedKey != TargetKey) {
        Fn := Func("SendKey").bind(TargetKey)
        Hotkey, % "$" HotkeyClear(PressedKey), %Fn%, On
    }
}

SendKey(TargetKey) {
    Send, %TargetKey%
}
