# Set folder path for CSV and log files
$folderPath = "\\Server\Share\Folder"
$logFilePath = Join-Path -Path $folderPath -ChildPath "ErrorLog.txt"

# Function to log errors
function Log-Error {
    param(
        [string]$ErrorMessage
    )
    $CurrentDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $ErrorLog = "$CurrentDateTime - $ErrorMessage"
    $ErrorLog | Out-File -FilePath $logFilePath -Append
}

# Try block to handle errors gracefully
try {
    # Gather system information
    $systemInfo = Get-WmiObject Win32_ComputerSystem -ErrorAction Stop
    $osInfo = Get-WmiObject Win32_OperatingSystem -ErrorAction Stop
    $cpuInfo = Get-WmiObject Win32_Processor -ErrorAction Stop

    # Extract the name of the operating system
    $osName = $osInfo.Caption

    # Convert RAM size to human-readable format
    $ramSizeGB = [math]::Round($systemInfo.TotalPhysicalMemory / 1GB, 0)
    $ramSizeFormatted = "$ramSizeGB GB"

    # Get the PrimaryOwnerName instead of DisplayName
    $PrimaryOwnerName = $systemInfo.PrimaryOwnerName

    # Construct CSV data
    $csvData = [PSCustomObject]@{
        Hostname = $systemInfo.Name
        PrimaryOwnerName = $PrimaryOwnerName
        Version = "$($osInfo.Version) ($osName)"
        CPU = $cpuInfo.Name
        RAM = $ramSizeFormatted
    }

    # Export to CSV file (Append mode)
    $csvData | Export-Csv -Path (Join-Path -Path $folderPath -ChildPath "PCinfo.csv") -NoTypeInformation -Append
}
catch {
    # Log the error
    Log-Error -ErrorMessage $_.Exception.Message
}
