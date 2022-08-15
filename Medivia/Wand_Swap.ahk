; Settings
Hotkey_1 = NumpadIns
Hotkey_2 = NumpadDiv
Hotkey_3 = NumpadMult
Hotkey_4 = NumpadSub
Hotkey_5 = NumpadAdd
Icon_1 := GetFile("Medivia\Icons\Wand\moonlight.png")
Icon_2 := GetFile("Medivia\Icons\Wand\serpent.png")
Icon_3 := GetFile("Medivia\Icons\Wand\fireweaver.png")
Icon_4 := GetFile("Medivia\Icons\Wand\stormcaller.png")
Icon_5 := GetFile("Medivia\Icons\Wand\frostwarden.png")

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

global invIcon := GetFile("Medivia\Icons\inventory.png")

Hotkey, ~$%Hotkey_1%, SetWand1, On
Hotkey, ~$%Hotkey_2%, SetWand2, On
Hotkey, ~$%Hotkey_3%, SetWand3, On
Hotkey, ~$%Hotkey_4%, SetWand4, On
Hotkey, ~$%Hotkey_5%, SetWand5, On
Return

SetWand1:
SetWand(Icon_1)
Return

SetWand2:
SetWand(Icon_2)
Return

SetWand3:
SetWand(Icon_3)
Return

SetWand4:
SetWand(Icon_4)
Return

SetWand5:
SetWand(Icon_5)
Return

SetWand(icon) {
    ImageSearch, slotX, slotY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %invIcon%

    If (ErrorLevel = 1) {
        Notify("Open your inventory first.")
        Return
    }

    slotX += 20
    slotY += 80

    Loop, 10
    {
        ImageSearch, wandX, wandY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %icon%

        If (ErrorLevel = 0) {
            MouseLock()
            MouseBackup()
            MouseClickDrag, left, wandX, wandY, slotX, slotY, 0
            MouseRestore()
            MouseRelease()

            Break
        }

        Sleep, 50
    }
}
