; Auto loot when walking with WASD or Arrows

; Settings
Hotkey_Use := "x"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetTimer, Action, 100
Return

Action:
    if GetKeyState("w", "P") || GetKeyState("a", "P") || GetKeyState("s", "P") || GetKeyState("d", "P")
    || GetKeyState("Up", "P") || GetKeyState("Down", "P") || GetKeyState("Left", "P") || GetKeyState("Right", "P")
        Send, %Hotkey_Use%
Return
