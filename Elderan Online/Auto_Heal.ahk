; Heal HP and MP
; You need to open "Health Info" window
; All values are considered as PERCENTAGE
; You can use HP or MP and combine both

; Settings
CheckChat := True
Healings  := [0
    ,{ HP: "0-30", Hotkey: "{F3}" }
    ,{ HP: "31-60", Hotkey: "{F2}" }
    ,{ HP: "61-80", Hotkey: "{F1}" }
    ,{ MP: "0-20", Hotkey: "{F4}" }
,0]

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

barsIcon := GetFile("Elderan Online\Icons\Mixin\bars.png")
inputIcon := GetFile("Elderan Online\Icons\Mixin\input.png")

global barsWidth := 179
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
    ImageSearch, barsX, barsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack %barsIcon%
    If ErrorLevel {
        Return
    }

    hpBarX := barsX + 1
    hpBarY := barsY + 3

    mpBarX := barsX + 1
    mpBarY := barsY + 15
}

AutoHealAction:
{
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
            If (hpColor != 0xFF4444) {
                Continue
            }

            hpLowX := hpBarX + (barsWidth * hpLowThan / 100)
            PixelGetColor, hpColor, hpLowX, hpBarY, Fast RGB
            If (hpColor == 0xFF4444) {
                Continue
            }
        }

        If item.MP {
            mpSplit := StrSplit(item.MP, "-")
            mpGtrThan := 0 + (mpSplit.Length() == 2 ? mpSplit[1] : 0)
            mpLowThan := 0 + (mpSplit.Length() == 2 ? mpSplit[2] : mpSplit[1])

            mpGtrX := mpBarX + (barsWidth * mpGtrThan / 100)
            PixelGetColor, mpColor, mpGtrX, mpBarY, Fast RGB
            If (mpColor != 0x4444FF) {
                Continue
            }

            mpLowX := mpBarX + (barsWidth * mpLowThan / 100)
            PixelGetColor, mpColor, mpLowX, mpBarY, Fast RGB
            If (mpColor == 0x4444FF) {
                Continue
            }
        }

        Send, % item.Hotkey
    }

    Return
}
