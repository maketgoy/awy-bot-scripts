; Set hotkey to use item on cursor position.

; Settings
Hotkey_Run = {MButton}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Tool\skinning_knife.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%

    If (ErrorLevel = 1) {
        Notify("Skinning Knife not found.")
        Return
    }

    MouseGetPos, targetX, targetY
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 200
    Return
}
