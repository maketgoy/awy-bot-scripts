; Auto Heal for Grand Line Adventures
; Checks for green buff/heal indicator at X, Y position
; Presses hotkey if indicator is not present

; Settings
GreenHealthPosX := 125
GreenHealthPosY := 115
Hotkey_Use = "^1"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetTimer, CheckHeal, 1000
Return

CheckHeal:
{
    PixelGetColor, color, GreenHealthPosX, GreenHealthPosY, Fast RGB

    green1 := "0xC2CE3E"
    green2 := "0xA2B62C"
    green3 := "0x6E801D"
    green4 := "0x5F6F16"
    green5 := "0x3A450E"
    green6 := "0x212807"

    c := color + 0
    r := (c >> 16) & 0xFF, g := (c >> 8) & 0xFF, b := c & 0xFF

    If (!isColorNear(green1, color) && !isColorNear(green2, color) && !isColorNear(green3, color) && !isColorNear(green4, color) && !isColorNear(green5, color) && !isColorNear(green6, color)) {
        ;Tooltip, SemVida - R:%r% G:%g% B:%b% (%color%)
        Send, %Hotkey_Use%
    } Else {
        ;Tooltip, ComVida - R:%r% G:%g% B:%b% (%color%)
    }

    Return
}

isColorNear(color1, color2) {
    tolerance := 50
    c1 := color1 + 0
    c2 := color2 + 0
    r1 := (c1 >> 16) & 0xFF, g1 := (c1 >> 8) & 0xFF, b1 := c1 & 0xFF
    r2 := (c2 >> 16) & 0xFF, g2 := (c2 >> 8) & 0xFF, b2 := c2 & 0xFF
    difference := (Abs(r1 - r2) + Abs(g1 - g2) + Abs(b1 - b2)) / 3
    Return difference < tolerance
}
