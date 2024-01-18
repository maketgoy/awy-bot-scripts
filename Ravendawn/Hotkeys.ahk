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

chatIcon := GetFile("Ravendawn\Icons\chat_open.png")

RegisterKey(Inventory, "{i}")
RegisterKey(Map, "{m}")
RegisterKey(Mount, "^{r}")
RegisterKey(PartyFocus, "{Space}")
RegisterKey(Target, "{Tab}")
Return

RegisterKey(PressedKey, TargetKey) {
    If (PressedKey != TargetKey) {
        Fn := Func("SendKey").bind(PressedKey, TargetKey)
        Hotkey, % "$" HotkeyClear(PressedKey), %Fn%, On
    }
}

SendKey(PressedKey, TargetKey) {
    ; Check chat
    ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %chatIcon%

    ; Chat open
    If (ErrorLevel == 0) {
        Send, %PressedKey%
    } Else {
        Send, %TargetKey%
    }
}
