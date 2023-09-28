; Auto hit back enemies

; Settings
ExtraHits     := 2
UseSpells     := true
CheckChatOpen := true

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

chatIcon := GetFile("Heartwood Online\Icons\chat_open.png")
healthIcon := GetFile("Heartwood Online\Icons\health_enemy.png")

extraHitsLeft := 0

Gap     := 120
CenterX := (A_ScreenWidth  / 2)
CenterY := (A_ScreenHeight / 2) - 66
FromX   := CenterX - Gap
ToX     := CenterX + Gap
FromY   := CenterY - Gap
ToY     := CenterY + Gap

SetTimer, SearchEnemy, 100
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
    enemyFound := ErrorLevel == 0

    If (enemyFound) {
        extraHitsLeft := ExtraHits
    }

    If (enemyFound || extraHitsLeft) {
        MouseClick, left, % enemyX + 33, % enemyY + 66, 1, 0

        If (UseSpells) {
            Send, {1}
            Sleep, 10
            Send, {2}
            Sleep, 10
            Send, {3}
            Sleep, 10
            Send, {4}
        }

        extraHitsLeft -= 1
    }

    Return
}
