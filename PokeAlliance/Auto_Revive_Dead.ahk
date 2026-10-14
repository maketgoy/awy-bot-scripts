; Auto revive dead pokemon

; Settings
ReviveHotkey = {r}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

pokeHpBar := GetFile("PokeAlliance\Icons\pokemon_death.png")

SetTimer, Action, 200
GoSub, Action
Return

Action:
{
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %pokeHpBar%

    if (ErrorLevel = 0) {
        Send, %ReviveHotkey%
    }

    Return
}
