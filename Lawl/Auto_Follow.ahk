; Auto follow: SELECT COLOR

; Settings
FollowPartyColor = green
SqmDistance := 3
SqmSize := 78

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#UseHook
#InstallMouseHook
#InstallKeybdHook

If (!A_IsAdmin) {
    MsgBox, Auto_Follow: Run Awy Bot has Administrator
}

partyIcon := GetFile("Lawl\Icons\party_" FollowPartyColor ".png")

SetTimer, CheckPosition, 250
Return

CheckPosition:
{
    If (GetKeyState("w", "P") || GetKeyState("a", "P") || GetKeyState("s", "P") || GetKeyState("d", "P") || GetKeyState("Left", "P") || GetKeyState("Right", "P") || GetKeyState("Up", "P") || GetKeyState("Down", "P")) {
        Return
    }

    ImageSearch, posX, posY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 *TransBlack %partyIcon%

    If (ErrorLevel > 0) {
        Return
    }

    posX := posX + (SqmSize / 2)
    posY := posY + SqmSize

    checkSqm := SqmSize * SqmDistance
    checkX := A_ScreenWidth / 2
    checkY := A_ScreenHeight / 2

    diffX := Round((posX - checkX) / SqmSize)
    diffY := Round((posY - checkY) / SqmSize)

    leaderDiffX := diffX < 0 ? (diffX + SqmDistance) : (diffX - SqmDistance)
    leaderDiffY := diffY < 0 ? (diffY + SqmDistance) : (diffY - SqmDistance)

    If (diffX != 0) {
        ; Move Left
        If (leaderDiffX < 0) {
            Send {Left down}
            Sleep 100
            Send {Left up}
        }

        ; Move Right
        If (leaderDiffX > 0) {
            Send {Right down}
            Sleep 100
            Send {Right up}
        }
    }

    If (diffY != 0) {
        ; Move Up
        If (leaderDiffY < 0) {
            Send {Up down}
            Sleep 100
            Send {Up up}
        }

        ; Move Down
        If (leaderDiffY > 0) {
            Send {Down down}
            Sleep 100
            Send {Down up}
        }
    }

    ;Tooltip, diffX: %diffX% | leaderOnRightDiff: %leaderOnRightDiff% | leaderOnLeftDiff %leaderOnLeftDiff%
    ;Tooltip, diffX: %diffX% | leaderDiff: %leaderDiff%

    Return
}
