; Detect char in movement
; You can replace settings variables when importing the script to another

; Settings
WalkDelay := 800

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

global IsMoving := false
walkingTime := 0

SetTimer, CheckMovement, 100
Return

;    upPressed := GetKeyState("Up", "P")
;    leftPressed := GetKeyState("Left", "P")
;    downPressed := GetKeyState("Down", "P")
;    rightPressed := GetKeyState("Right", "P")

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

    IsMoving := walkingTime >= WalkDelay
    ;SetOverlay(IsMoving ? "TRUE" : "FALSE", "IsMovig", "Status")

    Return
}
