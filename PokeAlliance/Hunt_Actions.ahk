; Automatically do some actions whenever the configured ReviveHotkey is pressed

; Settings
ComboHotkey = {F}
ReviveHotkey = {R}
MedicineHotkey = {T}
PokeStopHotkey = {Z}
OffensiveMode = {NumpadAdd}
DefensiveMode = {NumpadSub}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, % HotkeyClear(ComboHotkey), OnCombo
Hotkey, % "~" . HotkeyClear(ReviveHotkey), OnRevive
Return

OnCombo:
	Send, %PokeStopHotkey%
	Send, %OffensiveMode%
	Send, %MedicineHotkey%
	Send, %ComboHotkey%
Return

OnRevive:
	Send, %DefensiveMode%
	Sleep, 750
	Send, %PokeStopHotkey%
Return
