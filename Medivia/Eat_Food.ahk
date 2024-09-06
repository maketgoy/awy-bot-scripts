; Auto eat food. Does not eat on Protect Zones.

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

pzIcon := GetFile("Medivia\Icons\Status\protect.png")
hungryIcon := GetFile("Medivia\Icons\Status\hungry.png")

icons := [ GetFile("Medivia\Icons\Food\brown_mushroom.png")
    , GetFile("Medivia\Icons\Food\green_mushroom.png")
    , GetFile("Medivia\Icons\Food\white_mushroom.png")
    , GetFile("Medivia\Icons\Food\fire_mushroom.png")
    , GetFile("Medivia\Icons\Food\herring.png")
    , GetFile("Medivia\Icons\Food\meat.png")
    , GetFile("Medivia\Icons\Food\ham.png")
    , GetFile("Medivia\Icons\Food\dragon_ham.png")
    , GetFile("Medivia\Icons\Food\frozen_ham.png")
    , GetFile("Medivia\Icons\Food\egg.png")
    , GetFile("Medivia\Icons\Food\apple.png")
    , GetFile("Medivia\Icons\Food\blueberry.png")
    , GetFile("Medivia\Icons\Food\bread.png")
    , GetFile("Medivia\Icons\Food\brown_bread.png")
    , GetFile("Medivia\Icons\Food\carrot.png")
    , GetFile("Medivia\Icons\Food\cheese.png")
    , GetFile("Medivia\Icons\Food\corncob.png")
    , GetFile("Medivia\Icons\Food\cranberry.png")
    , GetFile("Medivia\Icons\Food\grape.png")
    , GetFile("Medivia\Icons\Food\honeycomb.png")
    , GetFile("Medivia\Icons\Food\orange.png")
    , GetFile("Medivia\Icons\Food\roll.png") ]

SetTimer, UseItem, 2000
Gosub, UseItem
Return

UseItem:
{
    itemX := False
    itemY := False

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %pzIcon%
    If (ErrorLevel = 0) {
        Return
    }

    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %hungryIcon%
    If (ErrorLevel > 0) {
        Return
    }

    For key, icon in icons
    {
        ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *25 *TransWhite %icon%
        If (ErrorLevel > 0) {
            Continue
        }

        itemX := iconX
        itemY := iconY
    }

    If (!itemX || !itemY) {
        Notify("Food not found.")
        Return
    }

    MouseBackup()
    Click, %itemX% %itemY% 1 Right
    MouseRestore()

    Return
}
