; Set hotkey to use item on cursor position.
; Uses IH or UH, it depends on the first item on screen (from LEFT to RIGHT / TOP to BOTTOM)

; Settings
Self_PosX = 0
Self_PosY = 0
Hotkey_Run = {XButton1}
OnlyOnBattle = True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

icons := [ GetFile("Medivia\Icons\Rune\ih.png")
    , GetFile("Medivia\Icons\Rune\uh.png") ]

battleIcon := GetFile("Medivia\Icons\Status\battle.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    ImageSearch, battleX, battleY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %battleIcon%
    If (ErrorLevel = 0) {
        Return
    }

    itemX := False
    itemY := False

    For key, icon in icons
    {
        ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %icon%
        If (ErrorLevel > 0) {
            Continue
        }

        If (!itemY || iconY < itemY) {
            itemX := iconX
            itemY := iconY
        } Else If (iconY == itemY && iconX < itemX) {
            itemX := iconX
            itemY := iconY
        }
    }

    If (!itemX || !itemY) {
        Notify("IH/UH not found.")
        Return
    }

    MouseBackup()
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %Self_PosX%, %Self_PosY%, 1, 0
    MouseRestore()

    Sleep, 200
    Return
}
