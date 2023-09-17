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
    Write-Host "TeamViewer uninstaller not found at the specified path: $uninstallerPath"
}

# Get all user profiles on the computer
$UserProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false }

foreach ($UserProfile in $UserProfiles) {
    # Define the path to the user's Downloads folder
    $DownloadsFolder = Join-Path -Path $UserProfile.LocalPath -ChildPath "Downloads"

    # Check if the Downloads folder exists
    if (Test-Path -Path $DownloadsFolder) {
        Write-Host "Looking for TeamViewer files in: $DownloadsFolder"
        
        # Get all files with names starting with "TeamViewer_Setup_x64" in the Downloads folder
        $teamViewerExecutables = Get-ChildItem -Path $DownloadsFolder | Where-Object { $_.Name -like "TeamViewer_Setup_x64*.exe" }

        foreach ($executable in $teamViewerExecutables) {
            try {
                Remove-Item -Path $executable.FullName -Force
                Write-Host "Removed $($executable.Name) from $($DownloadsFolder)."
            } catch {
                Write-Host "Error removing $($executable.Name) from $($DownloadsFolder): $($_.Exception.Message)"
            }
        }
    } else {
        Write-Host "Downloads folder not found for $($UserProfile.LocalPath)."
    }
}

# Optionally, you can add additional cleanup steps here.

Write-Host "TeamViewer removal and cleanup completed."
