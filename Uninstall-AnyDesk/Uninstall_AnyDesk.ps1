# Check if AnyDesk is running and terminate it
$AnyDeskProcesses = Get-Process -Name AnyDesk -ErrorAction SilentlyContinue
if ($AnyDeskProcesses) {
    $AnyDeskProcesses | ForEach-Object {
        $_.Kill()
        $_.WaitForExit()
    }
}

# Define the path to the AnyDesk installation directory (update this path if needed)
$AnyDeskPath = "C:\Program Files (x86)\AnyDesk"

# Check if AnyDesk is installed
if (Test-Path $AnyDeskPath) {
    try {
        # Remove the AnyDesk installation directory forcefully
        Remove-Item -Path $AnyDeskPath -Force -Recurse
        Write-Host "AnyDesk installation directory has been successfully deleted."
    } catch {
        $ErrorMessage = $_.Exception.Message
        Write-Host "Error uninstalling AnyDesk: $ErrorMessage"
    }
} else {
    Write-Host "AnyDesk was not found installed."
}

# Get all user profiles on the computer
$UserProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false }

foreach ($UserProfile in $UserProfiles) {
    # Define the path to the user's Downloads folder
    $DownloadsFolder = Join-Path -Path $UserProfile.LocalPath -ChildPath "Downloads"

    # Check if the Downloads folder exists
    if (Test-Path -Path $DownloadsFolder) {
        try {
            # Get all files with names that start with "AnyDesk(" and end with ").exe"
            $FilesToRemove = Get-ChildItem -Path $DownloadsFolder -Filter "AnyDesk*.exe"

            # Check if any matching files were found
            if ($FilesToRemove.Count -gt 0) {
                foreach ($File in $FilesToRemove) {
                    # Try to remove each matching file
                    try {
                        Remove-Item -Path $File.FullName -Force
                        Write-Host "File $($File.Name) has been successfully deleted from $($UserProfile.LocalPath)\Downloads."
                    } catch {
                        Write-Host "Error deleting file $($File.Name): $($_.Exception.Message)"
                    }
                }
            } else {
                Write-Host "No matching files found for deletion in $($UserProfile.LocalPath)\Downloads."
            }
        } catch {
            Write-Host "Error: $($error[0])"
        }
    } else {
        Write-Host "Downloads folder not found for $($UserProfile.LocalPath)."
    }
}

Write-Host "AnyDesk removal and cleanup completed."
