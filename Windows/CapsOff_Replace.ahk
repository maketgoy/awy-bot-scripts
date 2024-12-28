; Keeps CapsLock disabled and replaces it with another hotkey

; Settings
ReplaceWithHK := "{m}"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

$CapsLock::
Send, %ReplaceWithHK%
SetCapsLockState, Off
Return
