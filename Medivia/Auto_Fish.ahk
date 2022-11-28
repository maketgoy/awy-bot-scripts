; Set hotkey to use item on cursor position.

Check_Chat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Tool\modified_fishing_rod.png")
inputIcon := GetFile("Medivia\Icons\Mixin\input.png")

waters := [ GetFile("Medivia\Icons\Mixin\water_1.png") ]

SetTimer, Action, 1000
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

    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%
    If (ErrorLevel != 0) {
        itemName := StrReplace(StrSplit(itemIcon, "\").pop(), ".png")
        Notify(itemName " not found.")
        Return
    }

     For key, water in waters
    {
        ImageSearch, waterX, waterY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %icon%
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

    MouseGetPos, targetX, targetY
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 200
    Return
}
