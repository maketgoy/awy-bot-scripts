; Keeps focus on the party member with lowest HP

; Settings
global MemberFocusHotkeys := [ "{F1}", "{F2}", "{F3}", "{F4}", "{F5}", "{F6}" ]
global ShowDebug := False

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

global partyIcon := GetFile("Throne and Liberty\Icons\party.png")

global posX := 0
global posY := 0
global gap  := 44

isGreen(color) {
    tolerance := 40

    color1 := 0x5FD095 ; green
    color2 := color

    Loop,2
      {
        param:=A_Index
        StringTrimLeft,color%param%,color%param%,2
        Loop,3
        {
          StringLeft,c%param%%A_Index%,color%param%,2
          value:=c%param%%A_Index%
          c%param%%A_Index%=0x%value%
          StringTrimLeft,color%param%,color%param%,2
        }
      }

      difference := (Abs(c11-c21)+Abs(c12-c22)+Abs(c13-c23))/3

    Return difference < tolerance
}

CheckMembers() {
    ImageSearch, partyX, partyY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack %partyIcon%
    If ErrorLevel {
        Return
    }

    posX := partyX + 59
    posY := partyY + 39

    membersFoundHks := []

    debug := "Aim Party Heal Debug"

    Loop, 6
    {
        checkY := posY + (gap * (A_Index - 1))

        ; first hp bar pixel must be green
        ; Cases:
        ; Member not found
        ; Member is far
        ; Member hp is not green
        PixelGetColor, firstColor, posX, checkY, Fast RGB

        If (firstColor == 0x5FD095 || firstColor == 0x5DCC92) {
            membersFoundHks[A_Index] := MemberFocusHotkeys[A_Index]
        } Else {
            membersFoundHks[A_Index] := false
        }

        If (ShowDebug) {
            debug := debug "`n" (membersFoundHks[A_Index] ? "[x]" : "[  ]") " Member " A_Index " - " firstColor
        }
    }

    If (ShowDebug) {
        Tooltip, %debug%
    }

    Loop, 100
    {
        xIndex := A_Index
        checkX := posX + A_Index

        For memberIndex, memberHK in membersFoundHks
        {
            If (!memberHK) {
                Continue
            }

            memberIndex := A_Index
            checkY := posY + (gap * (memberIndex - 1))

            MouseMove, checkX, checkY
            PixelGetColor, hpColor, checkX, checkY, Fast RGB

            If (!isGreen(hpColor)) {
                ;MsgBox, %hpColor%

                ;Tooltip, Member: %memberIndex% | Hotkey: %memberHK%
                Send, %memberHK%

                Return
            }
        }
    }
}

Loop
{
    CheckMembers()
}

Return
