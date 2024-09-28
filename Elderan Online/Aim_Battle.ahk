; Use rune on first creature in battle list

Hotkey = {F1}
BattlePosX = 1620
BattlePosY = 130

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, % "$" HotkeyClear(Hotkey), Action, On
Return

Action:
{
    MouseBackup()

    Send, %Hotkey%
    Sleep, 50
    Click, %BattlePosX% %BattlePosY%

    MouseRestore()

    Return
}
