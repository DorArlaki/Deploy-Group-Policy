# PCinfo.ps1

PCinfo.ps1 is a PowerShell script designed to gather system information from Windows computers and log any errors encountered during execution.

## Description

This script collects various system information, including hostname, operating system version, CPU details, and RAM size, and exports the data to a CSV file named "PCinfo.csv". Additionally, it logs any errors encountered during execution to a separate file named "ErrorLog.txt".

## Usage

1. Ensure PowerShell is enabled on the target Windows computers.
2. Copy the PCinfo.ps1 script to a location accessible by the target computers.
3. Edit the script to specify the desired folder path for storing the CSV and log files.
4. Run the script on the target computers either manually or through a scheduled task.

```powershell
# Example usage:
.\PCinfo.ps1
```

# Requirements

    Windows operating system with PowerShell enabled.
    Sufficient permissions to run PowerShell scripts and access system information.

# Important Notes

    Ensure that the folder specified for storing CSV and log files is accessible and has appropriate permissions set.
    Review and customize the script as needed to fit your specific requirements.