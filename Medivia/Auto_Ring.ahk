; Auto equip a ring when the Ring Slot is empty
; Set object with "Equip Mode" on Medivia

; Settings
Hotkey = {F12}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

invIcon := GetFile("Medivia\Icons\Window\inventory.png")
ringIcon := GetFile("Medivia\Icons\Inventory\ring.png")

SetTimer, AutoRing, 1000
Return

AutoRing:
{
    ImageSearch, invX, invY, 0, 0, A_ScreenWidth, A_ScreenHeight, %invIcon%
    If ErrorLevel {
        Notify("Open your inventory.")
        Return
    }

    ImageSearch, slotX, slotY, invX, invY, invX + 150, invY + 150, %ringIcon%
    If ErrorLevel {
        Return
    }

    Send, %Hotkey%

    Return
}
