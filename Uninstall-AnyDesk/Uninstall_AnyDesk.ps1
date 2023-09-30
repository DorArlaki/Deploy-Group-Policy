# Define the name of the service
$serviceName = "AnyDesk"

# Check if the service exists
if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    # Stop the service
    Stop-Service -Name $serviceName -Force

    # Delete the service
    sc.exe delete $serviceName

    Write-Host "Successfully removed $serviceName."
} else {
    Write-Host "$serviceName service not found. It may not be installed."
}

# Check if AnyDesk is installed
$AnyDeskPath = "C:\Program Files (x86)\AnyDesk" # Update this path if needed

if (Test-Path $AnyDeskPath) {
    try {
        # Rename the AnyDesk installation directory
        Rename-Item -Path $AnyDeskPath -NewName "AnyDesk_Backup"
        Write-Host "AnyDesk installation directory has been renamed to AnyDesk_Backup."
    } catch {
        $ErrorMessage = $_.Exception.Message
        Write-Host "Error renaming AnyDesk installation directory: $ErrorMessage"
    }
} else {
    Write-Host "AnyDesk was not found installed."
}
