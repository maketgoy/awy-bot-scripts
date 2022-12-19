; Set hotkey to use item on cursor position.
; Uses Rope, Shovel, Pick, Machete, Advanced Pick, it depends on the first item on screen (from LEFT to RIGHT / TOP to BOTTOM)

; Settings
Hotkey_Run = {MButton}
Check_Chat := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

icons := [ GetFile("Medivia\Icons\Tool\rope.png")
    , GetFile("Medivia\Icons\Tool\shovel.png")
    , GetFile("Medivia\Icons\Tool\pick.png")
    , GetFile("Medivia\Icons\Tool\machete.png")
    , GetFile("Medivia\Icons\Tool\keychain.png")
    , GetFile("Medivia\Icons\Tool\advanced_pick.png")
    , GetFile("Medivia\Icons\Tool\modified_pick.png")
    , GetFile("Medivia\Icons\Tool\enhanced_pick.png")
    , GetFile("Medivia\Icons\Tool\pumpkin_shovel.png")
    , GetFile("Medivia\Icons\Tool\modified_fishing_rod.png") ]

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

    itemX := False
    itemY := False

    For key, icon in icons
    {
        ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %icon%
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

    If (itemX && itemY) {
        MouseGetPos, targetX, targetY
        MouseClick, right, %itemX%, %itemY%, 1, 0
        MouseClick, left, %targetX%, %targetY%, 1, 0
    }

    Sleep, 200
    Return
}
