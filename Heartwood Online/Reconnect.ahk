; Auto reconnect and ressurect

; Settings
Reconnect := True
Ressurect := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

btnReconnectIcons := [ GetFile("Heartwood Online\Icons\button_close.png")
    , GetFile("Heartwood Online\Icons\button_ok.png")
    , GetFile("Heartwood Online\Icons\button_steam.png")
    , GetFile("Heartwood Online\Icons\button_play.png") ]

btnRessurectIcon := GetFile("Heartwood Online\Icons\button_ressurect.png")

If (Reconnect) {
    SetTimer, ReconnectAction, 1000
}

If (Ressurect) {
    SetTimer, RessurectAction, 2000
}

Return

ReconnectAction:
{
    ImageSearch, buttonX, buttonY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransWhite %btnCloseIcon%
    If (ErrorLevel == 0) {
        MouseClick, left, buttonX, buttonY, 1, 0
    }

     For key, btnIcon in btnReconnectIcons
    {
        ImageSearch, buttonX, buttonY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransWhite %btnIcon%

        If (ErrorLevel == 0) {
            MouseClick, left, buttonX, buttonY, 1, 0
        }
    }

    Return
}

RessurectAction:
{
    ImageSearch, ressurectX, ressurectY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransWhite %btnRessurectIcon%

    If (ErrorLevel == 0) {
        MouseClick, left, ressurectX + 20, ressurectY, 1, 0
    }

    Return
}
