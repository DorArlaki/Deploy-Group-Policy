# Check if AnyDesk is running and terminate it
$AnyDeskProcess = Get-Process -Name AnyDesk -ErrorAction SilentlyContinue
if ($AnyDeskProcess) {
    $AnyDeskProcess | ForEach-Object {
        $_.Kill()
        $_.WaitForExit()
    }
}

# Define the path to the AnyDesk installation directory
$AnyDeskPath = "C:\Program Files (x86)\AnyDesk"

# Check if AnyDesk is installed
if (Test-Path $AnyDeskPath) {
    try {
        # Remove the AnyDesk installation directory
        Remove-Item -Path $AnyDeskPath -Force -Recurse

        # Wait for a moment
        Start-Sleep -Seconds 5

        # Check if the installation directory is still present (some files might still be in use)
        if (Test-Path $AnyDeskPath) {
            # If AnyDesk folder still exists, force delete it
            Remove-Item -Path $AnyDeskPath -Force -Recurse
        }

        # Perform any additional cleanup or logging as needed
        # For example, you can write a log entry here to record the uninstallation.
        # Write-Output "AnyDesk has been uninstalled on $($env:COMPUTERNAME)" | Out-File -Append -FilePath "C:\Path\To\Uninstall_Log.txt"
        
    } catch {
        # Handle errors and log them
        $ErrorMessage = $_.Exception.Message
        # Write-Output "Error uninstalling AnyDesk: $ErrorMessage" | Out-File -Append -FilePath "C:\Path\To\Uninstall_Log.txt"
    }
} else {
    # Log that AnyDesk was not found
    # Write-Output "AnyDesk was not found on $($env:COMPUTERNAME)" | Out-File -Append -FilePath "C:\Path\To\Uninstall_Log.txt"
}
