; Auto spend spirit with %

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

    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack %barsIcon%
    If ErrorLevel {
        Return
    }

    barsWidth := 179
    spX := (barsX + 1) + (barsWidth * Percent / 100)
    spY := (barsY + 27)

    If Percent && Hotkey {
        PixelGetColor, spColor, spX, spY, Fast RGB

        If (spColor == 0x96C3EB) {
            Send, %Hotkey%
        }
    }
}
