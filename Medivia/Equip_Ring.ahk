; Set hotkey to use item on cursor position.

; Settings
Hotkey_Run = {NumpadDiv}
Check_Chat := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

invIcon := GetFile("Medivia\Icons\inventory.png")
itemIcon := GetFile("Medivia\Icons\Ring\energy_ring.png")
inputIcon := GetFile("Medivia\Icons\Mixin\input.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, Action, On
Return

Action:
{
    If (Check_Chat) {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack %inputIcon%
        If (ErrorLevel == 0) {
            Sleep, 200
            Return
        }
    }

    ImageSearch, slotX, slotY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %invIcon%
    If (ErrorLevel != 0) {
        Notify("Open your inventory.")
        Sleep, 200
        Return
    }

    slotX += 5
    slotY += 112
    endX := slotX + 30
    endY := slotY + 30

    ImageSearch, ringX, ringY, %slotX%, %slotY%, %endX%, %endY%, *25 *TransWhite %itemIcon%
    If (ErrorLevel == 0) {
        Sleep, 200
        Return
    }

    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%
    If (ErrorLevel != 0) {
        itemName := StrReplace(StrSplit(itemIcon, "\").pop(), ".png")
        Notify(itemName " not found.")
        Return
    }

    MouseLock()
    MouseBackup()
    MouseClickDrag, left, itemX, itemY, slotX, slotY, 0
    MouseRestore()
    MouseRelease()

    Sleep, 200
    Return
}
