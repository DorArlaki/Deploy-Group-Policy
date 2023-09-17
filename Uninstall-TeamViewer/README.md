# TeamViewer Removal Script

## Overview

This PowerShell script is designed for administrators to remove TeamViewer from Windows computers using Group Policy. It performs the following tasks:

1. Uninstalls TeamViewer silently.
2. Removes TeamViewer executable files from all user profiles' Downloads folders.
3. Removes TeamViewer default installation folders.
## Prerequisites

Before deploying this script via Group Policy, ensure the following:

- **Administrator Privileges**: The script must be executed with administrative privileges to uninstall TeamViewer.

## Usage

Follow these steps to deploy the script via Group Policy:

1. **Download the Script**: Download the `Remove-TeamViewer.ps1` script from this repository.

2. **Edit the Script (Optional)**: Open the script in a text editor to verify the path to TeamViewer's uninstaller if it's not located in the default path.

3. **Deploy via Group Policy**:

   - Open the Group Policy Management Console (GPMC) on your domain controller.

   - Create a new Group Policy Object (GPO) or select an existing one that you want to use for deploying the script.

   - Navigate to "Computer Configuration" > "Policies" > "Windows Settings" > "Scripts (Startup/Shutdown)".

   - Double-click "Startup" to edit the startup scripts.

   - Click "Add" and browse to the location of the `Remove-TeamViewer.ps1` script.

   - Click "OK" to add the script.

4. **Apply the GPO**:

   - Link the GPO to the Organizational Unit (OU) containing the target computer objects.

   - Ensure that the GPO is correctly applied to the target computers.

5. **Monitor Execution**:

   - The script will run at startup, removing TeamViewer silently.

   - You can monitor the script's execution in the PowerShell terminal.

## Notes

- This script is designed for removing TeamViewer from Windows computers via Group Policy. Ensure that it's used responsibly and in compliance with your organization's policies.

- Be cautious when using scripts that modify or uninstall software. Always backup important data before running such scripts.

