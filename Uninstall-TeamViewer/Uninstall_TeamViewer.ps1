# Specify the path to TeamViewer's uninstaller
$uninstallerPath = "C:\Program Files\TeamViewer\uninstall.exe"

# Check if the uninstaller executable exists
if (Test-Path -Path $uninstallerPath) {
    try {
        # Run the uninstaller silently
        $process = Start-Process -FilePath $uninstallerPath -ArgumentList "/S" -PassThru

        # Wait for the uninstaller process to finish
        $process.WaitForExit()

        # Check if the uninstallation was successful
        if ($process.ExitCode -eq 0) {
            Write-Host "TeamViewer has been successfully uninstalled."
        } else {
            Write-Host "Failed to uninstall TeamViewer. Exit code: $($process.ExitCode)"
        }
    } catch {
        Write-Host "Error uninstalling TeamViewer: $($_.Exception.Message)"
    }
} else {
    Write-Host "TeamViewer uninstaller not found at the specified path."
}