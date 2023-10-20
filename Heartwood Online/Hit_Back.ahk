; Auto hit back enemies, use spells and loot

; Settings
Toggle_On_Off = {XButton2}
AutoAttack   := true
AttackRed    := true
AttackYellow := true
AutoLoot     := true
UseSpells    := [2, 3]
StandDelay   := 500

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

healthRedIcon := GetFile("Heartwood Online\Icons\health_enemy.png")
healthYellowIcon := GetFile("Heartwood Online\Icons\health_enemy_yellow.png")
lootNeedIcon := GetFile("Heartwood Online\Icons\button_need.png")

; Conditions
isPaused := false
isAllKilled := true
isWalking := false
walkingTime := 0

; Enemies
Gap     := 120
CenterX := (A_ScreenWidth / 2)
CenterY := (A_ScreenHeight / 2) - 50
FromX   := CenterX - Gap
ToX     := CenterX + Gap
FromY   := CenterY - Gap
ToY     := CenterY + Gap

Hotkey, % "$" HotkeyClear(Toggle_On_Off), ActionPauseResume, On

SetTimer, SearchEnemy, 100
SetTimer, CheckMovement, 100
SetTimer, CheckButtonLootNeed, 1000

Return

CheckMovement:
{
    wPressed := GetKeyState("w", "P")
    aPressed := GetKeyState("a", "P")
    sPressed := GetKeyState("s", "P")
    dPressed := GetKeyState("d", "P")

    If (wPressed || aPressed || sPressed || dPressed) {
        walkingTime := Min(walkingTime + 100, StandDelay * 2)
    } Else {
        walkingTime := Max(walkingTime - 100, 0)
    }

    isWalking := walkingTime > StandDelay

    Return
}

CheckButtonLootNeed:
{
    ImageSearch, buttonX, buttonY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransWhite %lootNeedIcon%

    If (ErrorLevel == 0) {
        MouseClick, left, %buttonX%, %buttonY%, 1, 0
    }

    Return
}


SearchEnemy:
{
    If (isWalking) {
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

        SetTimer, ActionCastSpells, -1
    } Else If (!isAllKilled) {
        isAllKilled := true

        If (AutoLoot) {
            SetTimer, ActionLootItems, -1
        }

        If (AutoAttack && !isWalking) {
            MouseMove, CenterX, 0, 0
        }
    }

    Return
}

ActionCastSpells:
{
    Random, randomIndex, 1, % UseSpells.MaxIndex()
    hotkey := UseSpells[randomIndex]

    If (!isWalking && !isAllKilled) {
        Sleep, 100
        Send, {%hotkey%}
    }

    Return
}

ActionLootItems:
{
    Loop, 5
    {
        Sleep 200
        Send, {e}
    }

    Return
}

ActionPauseResume:
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
