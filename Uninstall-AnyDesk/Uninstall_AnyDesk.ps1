# Define the registry path and key
$registryPath = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Anydesk"
$registryName = "UninstallString"

# Define the new value
$newValue = '"C:\Program Files (x86)\AnyDesk\AnyDesk.exe" --remove'

# Change the registry value
Set-ItemProperty -Path $registryPath -Name $registryName -Value $newValue

# Execute the updated command using Start-Process
Start-Process -FilePath "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" -ArgumentList "--remove"
