; Loot walking on WASD

; Settings
Hotkey_Use = {Tab}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetTimer, Action, 200
Return

Action:
{
    wPressed := GetKeyState("w", "P")
    aPressed := GetKeyState("a", "P")
    sPressed := GetKeyState("s", "P")
    dPressed := GetKeyState("d", "P")

    if (wPressed || aPressed || sPressed || dPressed) {
        Send, %Hotkey_Use%
        Sleep, 200
    }

    Return
}
