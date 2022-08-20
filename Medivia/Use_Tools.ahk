; Set hotkey to use item on cursor position.
; Uses Hunter's Knife or Skinning Knife, it depends on the first item on screen (from LEFT to RIGHT / TOP to BOTTOM)

; Settings
Hotkey_Run = {MButton}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

ropeIcon := GetFile("Medivia\Icons\Tool\rope.png")
shovelIcon := GetFile("Medivia\Icons\Tool\shovel.png")
pickIcon := GetFile("Medivia\Icons\Tool\pick.png")
machete := GetFile("Medivia\Icons\Tool\machete.png")
advPickIcon := GetFile("Medivia\Icons\Tool\advanced_pick.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    itemX := False
    itemY := False

    ImageSearch, ropeX, ropeY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %ropeIcon%
    If (ErrorLevel == 0) {
        If (!itemX || ropeX < itemX) {
            itemX := ropeX
            itemY := ropeY
        }
    }

    ImageSearch, shovelX, shovelY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %shovelIcon%
    If (ErrorLevel == 0) {
        If (!itemX || shovelX < itemX) {
            itemX := shovelX
            itemY := shovelY
        }
    }

    ImageSearch, pickX, pickY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %pickIcon%
    If (ErrorLevel == 0) {
        If (!itemX || pickX < itemX) {
            itemX := pickX
            itemY := pickY
        }
    }

    ImageSearch, pickX, pickY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %pickIcon%
    If (ErrorLevel == 0) {
        If (!itemX || pickX < itemX) {
            itemX := pickX
            itemY := pickY
        }
    }

    ImageSearch, macheteX, macheteY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %macheteIcon%
    If (ErrorLevel == 0) {
        If (!itemX || macheteX < itemX) {
            itemX := macheteX
            itemY := macheteY
        }
    }

    ImageSearch, advPickX, advPickY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %advPickIcon%
    If (ErrorLevel == 0) {
        If (!itemX || advPickX < itemX) {
            itemX := advPickX
            itemY := advPickY
        }
    }

    If (itemX > 0 && itemY > 0) {
        MouseGetPos, targetX, targetY
        MouseClick, right, %runeX%, %runeY%, 1, 0
        MouseClick, left, %targetX%, %targetY%, 1, 0
    }

    Sleep, 200
    Return
}
