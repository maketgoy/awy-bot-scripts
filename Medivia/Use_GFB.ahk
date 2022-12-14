; Set hotkey to use item on cursor position.

; Settings
Hotkey_Run = {PgUp}
Check_Chat := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Rune\gfb.png")
inputIcon := GetFile("Medivia\Icons\Mixin\input.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    If (Check_Chat) {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %inputIcon%
        If (ErrorLevel == 0) {
            Sleep, 200
            Return
        }
    }

    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%
    If (ErrorLevel != 0) {
        itemName := StrReplace(StrSplit(itemIcon, "\").pop(), ".png")
        Notify(itemName " not found.")
        Return
    }

    MouseGetPos, targetX, targetY
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 200
    Return
}
