# Custom Linux-like prompt
function Prompt {
    # Prompt style to set
    $prompt_style = "Debian"
    
    # Get info
    $isAdmin = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    $user_name = $env:USERNAME
    $computer_name = $env:COMPUTERNAME
    $current_directory = (Get-Location).Path

    if ($prompt_style -eq "Debian") {
        # Symbol at line end & divider between USERNAME and COMPUTERNAME
        $divider = ":"
        $end_symbol = "$"

        # Define colors
        $user_name_Color = [ConsoleColor]::Green
        $computer_name_Color = [ConsoleColor]::Green
        $current_directory_Color = [ConsoleColor]::Blue

        # Overwrite settings if Administrator
        if ($isAdmin) {
            $user_name_Color = [ConsoleColor]::Red
            $computer_name_Color = [ConsoleColor]::Red
            $current_directory_Color = [ConsoleColor]::DarkRed
        }
    } 
    elseif ($prompt_style -eq "Fish") {
        # Symbol at line end & divider between USERNAME and COMPUTERNAME
        $divider = " "
        $end_symbol = ">"

        # Define colors
        $user_name_Color = [ConsoleColor]::Green
        $computer_name_Color = [ConsoleColor]::Gray
        $current_directory_Color = [ConsoleColor]::DarkGreen

        # Overwrite settings if Administrator
        if ($isAdmin) {
            $user_name_Color = [ConsoleColor]::Red
            $current_directory_Color = [ConsoleColor]::DarkRed
        }
    }
    else {
        Write-Host "Error: The chosen prompt style: '${prompt_style}' is invalid."
        Write-Host "  └─ Open the profile: file:///$env:SYSTEMDRIVE/Users/$env:USERNAME/Documents/Powershell/Microsoft.PowerShell_profile.ps1"
        return ""
    }

    # Replace starting path with '~', if in HOME
    $current_directory = $current_directory -replace [regex]::Escape("$env:USERPROFILE"), "~"

    # Overwrite settings GLOBALLY if Administrator
    if ($isAdmin) {
        #$user_name = "Administrator"
        $end_symbol = "#"
    }

    # Display the prompt
    Write-Host -NoNewline "${user_name}" -ForegroundColor $user_name_Color
    Write-Host -NoNewline "@${computer_name}" -ForegroundColor $computer_name_Color
    Write-Host -NoNewline "${divider}"
    Write-Host -NoNewline "${current_directory}" -ForegroundColor $current_directory_Color
    Write-Host -NoNewline "${end_symbol}"
    return " "
}

# Aliases
Set-Alias grep findstr
Set-Alias poweroff Stop-Computer
Set-Alias reboot Restart-Computer
