# Define the registry path and key
$registryPath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Anydesk"
$registryName = "UninstallString"

# Define the new value to uninstall AnyDesk
$newValue = '"C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --remove'

# Change the registry value to trigger AnyDesk uninstallation
Set-ItemProperty -Path $registryPath -Name $registryName -Value $newValue

# Get all user profiles on the computer
$UserProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false }

foreach ($UserProfile in $UserProfiles) {
    # Define the path to the user's Downloads folder
    $DownloadsFolder = Join-Path -Path $UserProfile.LocalPath -ChildPath "Downloads"

    # Check if the Downloads folder exists
    if (Test-Path -Path $DownloadsFolder) {
        # Get all files with names starting with "AnyDesk" in the Downloads folder
        $AnyDeskExecutables = Get-ChildItem -Path $DownloadsFolder | Where-Object { $_.Name -like "AnyDesk*.exe" }

        # Sort the files by creation time in descending order
        $AnyDeskExecutables = $AnyDeskExecutables | Sort-Object -Property CreationTime -Descending

        $keepOne = $true

        foreach ($executable in $AnyDeskExecutables) {
            if ($keepOne) {
                # Keep the first instance and set the flag to false
                $keepOne = $false
            } else {
                # Remove all other instances
                Remove-Item -Path $executable.FullName -Force
            }
        }
    }
}

# Remove the AnyDesk folder
Remove-Item -Path "C:\Program Files (x86)\AnyDesk" -Recurse -Force

# Uninstall AnyDesk for all users using the original script silently
Start-Process -FilePath "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" -ArgumentList "--remove" -Wait -NoNewWindow
