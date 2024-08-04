; ------------------------------------------------------- ;
; --- Toogle hidden files in Explorer with CTRL+H
; ------------------------------------------------------- ;

; #NoTrayIcon

^h::
{
    ; Get name of the active window
    activeWindow := WinGetProcessName("A")

    ; Toggle state only if window matches 'explorer.exe'
    if (activeWindow = "explorer.exe") {
        ; Read the current hidden files status
        hiddenFilesStatus := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden")

        ; Toggle the hidden files setting
        if (hiddenFilesStatus = 2) {
            RegWrite(1, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden")
        } else {
            RegWrite(2, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden")
        }

        ; Refresh the window to apply changes
        Send("{F5}")
    } else {
        ; Temporarily disable the hotkey to prevent recursion and retain original action
        Hotkey("^h", "Off")
        Send("{Ctrl down}h{Ctrl up}")
        Hotkey("^h", "On")
    }
}
