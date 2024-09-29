; Auto spend mana with %

; Settings
Percent   := 90
Hotkey     = {F1}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Elderan Online\Icons\Mixin\bars.png")
inputIcon := GetFile("Elderan Online\Icons\Mixin\input.png")

SetTimer, AutoSpendManaAction, 1000
Return

AutoSpendManaAction:
{
    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %inputIcon%
        If !ErrorLevel {
            Return
        }
    }
r
    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack %barsIcon%
    If ErrorLevel {
        Return
    }

    barsWidth := 179
    mpX := (barsX + 1) + (barsWidth * Percent / 100)
    mpY := (barsY + 15)

    If Percent && Hotkey {
        PixelGetColor, mpColor, mpX, mpY, Fast RGB

        If (mpColor == 0x4444FF) {
            Send, %Hotkey%
        }
    }
}
