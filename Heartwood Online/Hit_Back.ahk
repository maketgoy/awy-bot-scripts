; Auto hit back enemies, use spells and loot

; Settings
Toggle_On_Off = {XButton2}
UseSpells    := [2, 3]
AutoLoot     := true
WalkDelay    := 800
StandDelay   := 400

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

healthIcon := GetFile("Heartwood Online\Icons\health_enemy.png")

; Conditions
isPaused := false
walkingTime := 0
isAllKilled := true

; Enemies
Gap     := 120
CenterX := (A_ScreenWidth / 2)
CenterY := (A_ScreenHeight / 2) - 50
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
        walkingTime := Min(walkingTime + 100, WalkDelay + StandDelay)
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
        MouseClick, left, % enemyX + 33, % enemyY + 100, 1, 0

        For key, hotkey in UseSpells
        {
            Sleep, 20
            Send, {%hotkey%}
        }
    } Else If (!isAllKilled) {
        isAllKilled := true
        SetTimer, AfterKillAll, -200
    }

    Return
}

AfterKillAll:
{
    If (AutoLoot) {
        Send, {e}
        Send, {e}
        Send, {e}
    }

    MouseMove, CenterX, 0, 0

    Return
}
