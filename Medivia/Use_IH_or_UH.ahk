; Set hotkey to use item on cursor position.
; Uses IH or UH, it depends on the first item on screen (from LEFT to RIGHT / TOP to BOTTOM)

; Settings
Hotkey_Run = {XButton1}
Check_Chat := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

ihIcon := GetFile("Medivia\Icons\Rune\ih.png")
uhIcon := GetFile("Medivia\Icons\Rune\uh.png")
inputIcon := GetFile("Medivia\Icons\Mixin\input.png")

key := HotkeyClear(Hotkey_Run)
Hotkey, ~$%key%, UseItem, On
Return

UseItem:
{
    ImageSearch, ihX, ihY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %ihIcon%
    foundIH := ErrorLevel == 0

    ImageSearch, uhX, uhY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %uhIcon%
    foundUH := ErrorLevel == 0

    If (!foundIH && !foundUH) {
        Notify("IH/UH not found.")
        Return
    }

    If (Check_Chat) {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransBlack %inputIcon%
        If (ErrorLevel == 0) {
            Sleep, 200
            Return
        }
    }

    runeX := foundUH ? uhX : ihX
    runeY := foundUH ? uhY : ihY

    If (foundIH) {
        If (ihX < uhX) {
            runeX := ihX
            runeY := ihY
        } Else If (ihY < uhY) {
            runeX := ihX
            runeY := ihY
        }
    }

    MouseGetPos, targetX, targetY
    MouseClick, right, %runeX%, %runeY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 200
    Return
}
