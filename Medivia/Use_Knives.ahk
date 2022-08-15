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

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    ImageSearch, huntX, huntY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %huntIcon%
    foundHunt := ErrorLevel == 0

    ImageSearch, skinX, skinY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %skinIcon%
    foundSkin := ErrorLevel == 0

    If (!foundHunt && !foundSkin) {
        Notify("Knife not found.")
        Return
    }

    runeX := foundSkin ? skinX : huntX
    runeY := foundSkin ? skinY : huntY

    If (foundHunt) {
        If (huntX < skinX) {
            runeX := huntX
            runeY := huntY
        } Else If (huntY < skinY) {
            runeX := huntX
            runeY := huntY
        }
    }

    MouseGetPos, targetX, targetY
    MouseClick, right, %runeX%, %runeY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 200
    Return
}
