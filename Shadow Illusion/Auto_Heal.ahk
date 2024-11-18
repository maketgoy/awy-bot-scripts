; Heal HP and MP
; You need to open "Health Info" window
; All values are considered as PERCENTAGE
; You can use HP or MP and combine both

; Settings
CheckChat := False
Healings  := [0
    ,{ HP: "0-50", Hotkey: "{F3}" }
    ,{ HP: "51-80", Hotkey: "{F2}" }
    ,{ HP: "81-90", Hotkey: "{F1}" }
    ,{ MP: "95-100", Hotkey: "{F8}" }
,0]

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Shadow Illusion\Icons\Mixin\bars.png")
inputIcon := GetFile("Shadow Illusion\Icons\Mixin\input.png")

global barsWidth := 177
global barsFound := false
global hpBarX := 0
global hpBarY := 0
global mpBarX := 0
global mpBarY := 0

SetTimer, CheckBarsAction, 5000
SetTimer, AutoHealAction, 500
GoSub, CheckBarsAction
Return

CheckBarsAction:
{
    barsFound := false

    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack %barsIcon%
    If ErrorLevel {
        Return
    }

    If (barsX > 0 && barsY > 0) {
        barsFound := true

        hpBarX := barsX + 2
        hpBarY := barsY + 2

        mpBarX := barsX + 2
        mpBarY := barsY + 19
    }
}

AutoHealAction:
{
    ; debug
    ;PixelGetColor, mpColor, mpBarX + 50, mpBarY, Fast RGB
    ;Tooltip, Color %mpColor%

    If (!barsFound) {
        Return
    }

    If CheckChat {
        ImageSearch, , , 0, 0, A_ScreenWidth, A_ScreenHeight, %inputIcon%
        If !ErrorLevel {
            Return
        }
    }

    For index, item in Healings
    {
        If not IsObject(item) {
            Continue
        }

        If item.HP {
            hpSplit := StrSplit(item.HP, "-")
            hpGtrThan := 0 + (hpSplit.Length() == 2 ? hpSplit[1] : 0)
            hpLowThan := 0 + (hpSplit.Length() == 2 ? hpSplit[2] : hpSplit[1])

            hpGtrX := hpBarX + (barsWidth * hpGtrThan / 100)
            PixelGetColor, hpColor, hpGtrX, hpBarY, Fast RGB
            If (hpColor != 0xFF5B5B) {
                Continue
            }

            hpLowX := hpBarX + (barsWidth * hpLowThan / 100)
            PixelGetColor, hpColor, hpLowX, hpBarY, Fast RGB
            If (hpColor == 0xFF5B5B) {
                Continue
            }
        }

        If item.MP {
            mpSplit := StrSplit(item.MP, "-")
            mpGtrThan := 0 + (mpSplit.Length() == 2 ? mpSplit[1] : 0)
            mpLowThan := 0 + (mpSplit.Length() == 2 ? mpSplit[2] : mpSplit[1])

            mpGtrX := mpBarX + (barsWidth * mpGtrThan / 100)
            PixelGetColor, mpColor, mpGtrX, mpBarY, Fast RGB
            If (mpColor != 0x5B5BFF) {
                Continue
            }

            mpLowX := mpBarX + (barsWidth * mpLowThan / 100)
            PixelGetColor, mpColor, mpLowX, mpBarY, Fast RGB
            If (mpColor == 0x5B5BFF) {
                Continue
            }
        }

        Send, % item.Hotkey
    }

    Return
}
