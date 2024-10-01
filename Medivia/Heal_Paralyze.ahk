; Heal paralyze status with an hotkey

; Settings
Hotkey = {F1}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

paralyzeIcon := GetFile("Medivia\Icons\Status\paralyze.png")

SetTimer, HealParalyze, 1000
Return

HealParalyze:
{
    ImageSearch, iconX, iconY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransWhite %paralyzeIcon%
    If ErrorLevel {
        Return
    }

    Send, %Hotkey%

    Return
}
