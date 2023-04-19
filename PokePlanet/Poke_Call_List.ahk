; Settings
Hotkey_Poke_1 = {F1}
Hotkey_Poke_2 = {F2}
Hotkey_Poke_3 = {F3}
Hotkey_Poke_4 = {F4}
Hotkey_Poke_5 = {F5}
Hotkey_Poke_6 = {F6}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1
SetDefaultMouseSpeed, 0

listIcon := GetFile("PokePlanet\Icons\poke_list.png")

key1 := HotkeyClear(Hotkey_Poke_1)
Hotkey, ~$%key1%, Action1, On

key2 := HotkeyClear(Hotkey_Poke_2)
Hotkey, ~$%key2%, Action2, On

key3 := HotkeyClear(Hotkey_Poke_3)
Hotkey, ~$%key3%, Action3, On

key4 := HotkeyClear(Hotkey_Poke_4)
Hotkey, ~$%key4%, Action4, On

key5 := HotkeyClear(Hotkey_Poke_5)
Hotkey, ~$%key5%, Action5, On

key6 := HotkeyClear(Hotkey_Poke_6)
Hotkey, ~$%key6%, Action6, On

Return

Action1:
{
    ImageSearch, listX, listY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %listIcon%
    Sleep, 50

    If (ErrorLevel != 0) {
        Notify("Poke list not found.")
    } Else {
        MouseBackup()
        Click, %listX%, %listY%, Left
        MouseRestore()
    }

    Return
}

Action2:
{
    ImageSearch, listX, listY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %listIcon%
    Sleep, 50

    If (ErrorLevel != 0) {
        Notify("Poke list not found.")
    } Else {
        MouseBackup()
        listY += 60
        Click, %listX%, %listY%, Left
        MouseRestore()
    }

    Return
}

Action3:
{
    ImageSearch, listX, listY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %listIcon%
    Sleep, 50

    If (ErrorLevel != 0) {
        Notify("Poke list not found.")
    } Else {
        MouseBackup()
        listY += 120
        Click, %listX%, %listY%, Left
        MouseRestore()
    }

    Return
}

Action4:
{
    ImageSearch, listX, listY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %listIcon%
    Sleep, 50

    If (ErrorLevel != 0) {
        Notify("Poke list not found.")
    } Else {
        MouseBackup()
        listY += 180
        Click, %listX%, %listY%, Left
        MouseRestore()
    }

    Return
}

Action5:
{
    ImageSearch, listX, listY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %listIcon%
    Sleep, 50

    If (ErrorLevel != 0) {
        Notify("Poke list not found.")
    } Else {
        MouseBackup()
        listY += 240
        Click, %listX%, %listY%, Left
        MouseRestore()
    }

    Return
}

Action6:
{
    ImageSearch, listX, listY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %listIcon%
    Sleep, 50

    If (ErrorLevel != 0) {
        Notify("Poke list not found.")
    } Else {
        MouseBackup()
        listY += 300
        Click, %listX%, %listY%, Left
        MouseRestore()
    }

    Return
}

