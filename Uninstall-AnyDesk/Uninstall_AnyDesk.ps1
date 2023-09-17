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
        # Remove the AnyDesk installation directory forcefully
        Remove-Item -Path $AnyDeskPath -Force -Recurse
        Write-Host "AnyDesk installation directory has been successfully deleted."

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

# Define the path to the user's Downloads folder
$DownloadsFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Userprofile) + "\Downloads"

try {
    # Get all files with names that start with "AnyDesk(" and end with ").exe"
    $FilesToRemove = Get-ChildItem -Path $DownloadsFolder -Filter "AnyDesk(*).exe"

    # Check if any matching files were found
    if ($FilesToRemove.Count -gt 0) {
        foreach ($File in $FilesToRemove) {
            # Try to remove each matching file
            [System.IO.File]::Delete($File.FullName)
            Write-Host "File $($File.Name) has been successfully deleted."
        }
    } else {
        Write-Host "No matching files found for deletion in $DownloadsFolder."
    }
} catch {
    Write-Host "Error: $($error[0])"
}

# Define the path to the main AnyDesk executable in the user's Downloads folder
$AnyDeskExecutable = Join-Path -Path $DownloadsFolder -ChildPath "AnyDesk.exe"

try {
    # Check if the main AnyDesk executable exists in the user's Downloads folder and remove it
    if (Test-Path -Path $AnyDeskExecutable) {
        [System.IO.File]::Delete($AnyDeskExecutable)
        Write-Host "Main AnyDesk executable has been successfully deleted."
    } else {
        Write-Host "Main AnyDesk executable not found in $DownloadsFolder."
    }
}
catch {
    Write-Host "Error: $($error[0])"
}
