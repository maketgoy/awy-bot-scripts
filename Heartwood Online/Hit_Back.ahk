; Auto hit back enemies

; Settings
Toggle_On_Off = {XButton2}
WalkDelay    := 500
UseSpells    := true

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

chatIcon := GetFile("Heartwood Online\Icons\chat_open.png")
healthIcon := GetFile("Heartwood Online\Icons\health_enemy.png")

isPaused := false
walkingTime := 0
isAllKilled := true

Gap     := 120
CenterX := (A_ScreenWidth  / 2)
CenterY := (A_ScreenHeight / 2) - 33
FromX   := CenterX - Gap
ToX     := CenterX + Gap
FromY   := CenterY - Gap
ToY     := CenterY + Gap

Hotkey, % "$" HotkeyClear(Toggle_On_Off), Pause_Resume, On

SetTimer, SearchEnemy, 100
SetTimer, CheckMovement, 100

Return

Pause_Resume:
{
    isPaused := !isPaused

    If (isPaused) {
        SetTimer, SearchEnemy, Off
        SetOverlay("OFF")
    } Else {
        SetTimer, SearchEnemy, 100
        SetOverlay("ON")
    }

    Notify(isPaused ? "Paused" : "Resumed")

    Return
}

CheckMovement:
{
    wPressed := GetKeyState("w", "P")
    aPressed := GetKeyState("a", "P")
    sPressed := GetKeyState("s", "P")
    dPressed := GetKeyState("d", "P")

    If (wPressed || aPressed || sPressed || dPressed) {
        walkingTime := Min(walkingTime + 100, WalkDelay)
    } Else {
        walkingTime := Max(walkingTime - 100, 0)
    }

    Return
}

SearchEnemy:
{
    If (walkingTime >= WalkDelay) {
        Return
    }

    ImageSearch, enemyX, enemyY, FromX, FromY, ToX, ToY, *TransWhite %healthIcon%

    If (ErrorLevel == 0) {
        isAllKilled := false
        MouseClick, left, % enemyX + 33, % enemyY + 66, 1, 0

        If (UseSpells) {
            Send, {1}
            Sleep, 10
            Send, {2}
            Sleep, 10
            Send, {3}
            Sleep, 10
            Send, {4}
        }
    } Else If (!isAllKilled) {
        isAllKilled := true
        MouseMove, 0, 0, 0
    }

    Return
}
