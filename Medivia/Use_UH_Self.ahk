; Set hotkey to use item on cursor position.

; Settings
Self_PosX = 0
Self_PosY = 0
Hotkey_Run = {XButton1}
Check_Chat := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Rune\uh.png")
inputIcon := GetFile("Medivia\Icons\Mixin\input.png")
battleIcon := GetFile("Medivia\Icons\Status\battle.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    If (!Self_PosX || !Self_PosY) {
        Notify("Set the positions first.")
        Return
    }

    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%
    If (ErrorLevel != 0) {
        itemName := StrReplace(StrSplit(itemIcon, "\").pop(), ".png")
        Notify(itemName " not found.")
        Return
    }

    If (Check_Chat) {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransBlack %inputIcon%
        If (ErrorLevel == 0) {
            Return
        }
    }

    MouseBackup()
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %Self_PosX%, %Self_PosY%, 1, 0
    MouseRestore()

    Sleep, 200
    Return
}
