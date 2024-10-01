; Auto spend mana with %

; Settings
Percent   := 90
Hotkey     = {F1}
CheckChat := True

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Medivia\Icons\Window\bars.png")
inputIcon := GetFile("Medivia\Icons\Mixin\input.png")

SetTimer, TrainML, 1000
Return

TrainML:
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

    barsWidth := 177
    mpX := barsX + (barsWidth * Percent / 100)
    mpY := barsY + 33

    If Percent && Hotkey {
        PixelGetColor, mpColor, mpX, mpY, Fast RGB

        If (mpColor == 0x6D2FFC || mpColor == 0x6D2FFB || mpColor == 0x5E29DA || mpColor == 0x1B152B || mpColor == 0x1A0C3B || mpColor == 0x421C98) {
            Send, %Hotkey%
        }
    }
}
