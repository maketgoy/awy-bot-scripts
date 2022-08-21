; Set hotkey to use item on cursor position.
; Uses Hunter's Knife or Skinning Knife, it depends on the first item on screen (from LEFT to RIGHT / TOP to BOTTOM)

; Settings
Hotkey_Run = {MButton}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

huntIcon := GetFile("Medivia\Icons\Tool\hunters_knife.png")
skinIcon := GetFile("Medivia\Icons\Tool\skinning_knife.png")

items := ["hunters_knife", "skinning_knife"]

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    itemX := False
    itemY := False

    For key, value in items
    {
        icon := GetFile("Medivia\Icons\Tool\" value ".png")

        ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %icon%
        If (ErrorLevel > 0) {
            Continue
        }

        If (!itemY || iconY < itemY) {
            itemX := iconX
            itemY := iconY
        }
    }

    If (!itemX && !itemY) {
        Notify("Knife not found.")
        Return
    }

    MouseGetPos, targetX, targetY
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 200
    Return
}
