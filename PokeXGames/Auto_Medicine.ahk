; Auto-use Medicine on negative status conditions (Sleep, Slow, Blindness, etc.)

; Settings
Hotkey_Medicine := "F2"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

negativeStatusIcons := [ GetFile("PokeXGames\Icons\Status\Medicine\cegueira.png")
    , GetFile("PokeXGames\Icons\Status\Medicine\confused.png")
    , GetFile("PokeXGames\Icons\Status\Medicine\fear.png")
    , GetFile("PokeXGames\Icons\Status\Medicine\paralyzed.png")
    , GetFile("PokeXGames\Icons\Status\Medicine\silence.png")
    , GetFile("PokeXGames\Icons\Status\Medicine\stunned.png") ]

SetTimer, CheckMedicine, 100
Return

; Check negative status to medicine
CheckMedicine:
    For index, iconPath in negativeStatusIcons {
        ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %iconPath%

        If (ErrorLevel == 0) {
            Send, %HK_MEDICINE%
            Sleep, 500 ; Cooldown para o status sumir da tela antes da próxima checagem
            Break
        }
    }
Return
