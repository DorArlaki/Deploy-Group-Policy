# Define the registry path and key
$registryPath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Anydesk"
$registryName = "UninstallString"

# Define the new value
$newValue = '"C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --remove'

# Change the registry value
Set-ItemProperty -Path $registryPath -Name $registryName -Value $newValue

# Get a list of user profiles
$profiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false }

# Loop through user profiles
foreach ($profile in $profiles) {
    $downloadFolder = Join-Path -Path $profile.LocalPath -ChildPath 'Downloads'
    $anydeskFiles = Get-ChildItem -Path $downloadFolder -Filter 'AnyDesk.exe'

    # Check if there is more than one AnyDesk.exe in the Downloads folder
    if ($anydeskFiles.Count -gt 1) {
        # Remove all but one instance of AnyDesk.exe
        $anydeskFiles | Select-Object -Skip 1 | ForEach-Object {
            Remove-Item -Path $_.FullName -Force
        }
    }
}

# Uninstall AnyDesk for all users using the original script
Start-Process -FilePath "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" -ArgumentList "--remove" -Wait
