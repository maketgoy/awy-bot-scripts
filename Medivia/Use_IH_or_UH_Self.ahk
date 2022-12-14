; Set hotkey to use item on cursor position.
; Uses IH or UH, it depends on the first item on screen (from LEFT to RIGHT / TOP to BOTTOM)
; Only when you are in battle.

; Settings
Self_PosX = 0
Self_PosY = 0
Hotkey_Run = {XButton1}
Check_Chat := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

icons := [ GetFile("Medivia\Icons\Rune\ih.png")
    , GetFile("Medivia\Icons\Rune\uh.png") ]

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
