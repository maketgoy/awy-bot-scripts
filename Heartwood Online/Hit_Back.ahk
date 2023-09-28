; Auto hit back enemies

; Settings
CheckChatOpen := true

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

chatIcon := GetFile("Heartwood Online\Icons\chat_open.png")
healthIcon := GetFile("Heartwood Online\Icons\health_enemy.png")

Gap   := 100
FromX := (A_ScreenWidth  / 2) - Gap
ToX   := (A_ScreenWidth  / 2) + Gap
FromY := (A_ScreenHeight / 2) - Gap
ToY   := (A_ScreenHeight / 2) + Gap

SetTimer, SearchEnemy, 200
Return

SearchEnemy:
{
    If (CheckChatOpen) {
        ImageSearch, chatInputX, chatInputY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransWhite %chatIcon%
        If (ErrorLevel == 0) {
            Return
        }
    }

    ImageSearch, enemyX, enemyY, FromX, FromY, ToX, ToY, *TransWhite %healthIcon%
    If (ErrorLevel == 0) {
        MouseClick, left, % enemyX + 33, % enemyY + 66, 1, 0
    }

    Return
}
