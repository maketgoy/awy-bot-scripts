; Auto hit back enemies, use spells and loot

; Settings
Toggle_On_Off = {XButton2}
AutoAttack   := true
AttackRed    := true
AttackYellow := true
AutoLoot     := true
UseSpells    := [2, 3]
WalkDelay    := 800
StandDelay   := 400

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

healthRedIcon := GetFile("Heartwood Online\Icons\health_enemy.png")
healthYellowIcon := GetFile("Heartwood Online\Icons\health_enemy_yellow.png")
lootNeedIcon := GetFile("Heartwood Online\Icons\button_need.png")

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
SetTimer, CheckButtonNeed, 1000

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

    If (!AttackRed && !AttackYellow) {
        Return
    }

    If (AttackRed) {
        ImageSearch, enemyX, enemyY, FromX, FromY, ToX, ToY, *TransWhite %healthRedIcon%
    }

    If (AttackYellow && (ErrorLevel > 0 || !AttackRed)) {
        ImageSearch, enemyX, enemyY, FromX, FromY, ToX, ToY, *TransWhite %healthYellowIcon%
    }

    If (ErrorLevel == 0) {
        isAllKilled := false

        If (AutoAttack) {
            MouseClick, left, % enemyX + 33, % enemyY + 100, 1, 0
        }

        If (AutoLoot) {
            Send, {e}
        }

        For key, hotkey in UseSpells
        {
            Sleep, 20
            Send, {%hotkey%}
        }
    } Else {
        If (!isAllKilled) {
            isAllKilled := true

            If (AutoLoot) {
                SetTimer, LootItems, -100
            }

            If (AutoAttack && walkingTime < WalkDelay) {
                MouseMove, CenterX, 0, 0
            }
        }
    }

    Return
}

LootItems:
{
    Loop, 3
    {
        Loop, 5
        {
            Send, {e}
        }

        Sleep 200
    }

    Return
}

CheckButtonNeed:
{
    ImageSearch, buttonX, buttonY, FromX, FromY, ToX, ToY, *TransWhite %lootNeedIcon%

    If (ErrorLevel == 0) {
        MouseClick, left, %buttonX%, %buttonY%, 1, 0
    }

    Return
}
