# Specify the possible paths to unins001.exe and unins000.exe
$uninstallExePaths = @(
    "C:\Program Files (x86)\ISL Online\ISL AlwaysOn\unins001.exe",
    "C:\Program Files (x86)\ISL Online\ISL AlwaysOn\unins000.exe"
)

# Find the existing uninstaller executable
$uninstallExePath = $uninstallExePaths | Where-Object { Test-Path $_ -PathType Leaf } | Select-Object -First 1

# Check if any uninstaller executable was found
if ($uninstallExePath) {
    # Run the uninstaller silently without waiting for it to finish
    Start-Process -FilePath $uninstallExePath -ArgumentList "/VERYSILENT", "/SUPPRESSMSGBOXES" -NoNewWindow -Wait
    Write-Host "Uninstallation of ISL AlwaysOn is complete."

    # Specify the path to the ISL AlwaysOn folder
    $islFolder = "C:\Program Files (x86)\ISL Online\ISL AlwaysOn"

    # Delete the ISL AlwaysOn folder
    if (Test-Path $islFolder -PathType Container) {
        Remove-Item -Path $islFolder -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Removed ISL AlwaysOn folder: $islFolder"
    }
} else {
    Write-Host "No uninstaller executable found. ISL AlwaysOn may not be installed."
}