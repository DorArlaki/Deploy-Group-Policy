# TeamViewer Removal Script (Startup GPO)

## Overview

This PowerShell script is designed to be deployed as a startup Group Policy Object (GPO) to remove TeamViewer from Windows computers. It performs the following tasks:

1. Forcefully terminates any running TeamViewer processes.
2. Uninstalls TeamViewer silently.
3. Removes residual files and registry entries.

## Prerequisites

Before deploying this script, ensure the following:

- **Administrator Privileges**: The script must be executed with administrative privileges to ensure proper removal of TeamViewer.

## Usage

Follow these steps to deploy the script as a startup GPO:

1. **Download the Script**: Download the `Remove-TeamViewer.ps1` script to your administrative computer.

2. **Edit the Script**: Open the script using a text editor and ensure that the following variables are correctly configured:

   - `$uninstallerPath`: Verify that this variable points to the correct path of TeamViewer's uninstaller (`uninstall.exe`).

3. **Create a GPO**:

   - Open the Group Policy Management Console (GPMC) on your domain controller.
   - Create a new GPO or select an existing one that you want to use for deploying the script.

4. **Add the Script to the GPO**:

   - Navigate to the GPO's "Computer Configuration" > "Policies" > "Windows Settings" > "Scripts (Startup/Shutdown)".
   - Double-click "Startup" to edit the startup scripts.
   - Click "Add" and browse to the location of the `Remove-TeamViewer.ps1` script.
   - Click "OK" to add the script.

5. **Apply the GPO**:

   - Link the GPO to the Organizational Unit (OU) containing the target computer objects.
   - Ensure that the GPO is correctly applied to the target computers.

6. **Deploy the GPO**:

   - Wait for Group Policy to refresh on the target computers (or force a refresh manually using `gpupdate /force`).
   - The script will run at startup, removing TeamViewer silently.

7. **Monitor Execution**:

   - You can monitor the script's execution and check for errors in the Windows Event Viewer on the target computers.

## Notes

- This script is designed for removing TeamViewer from Windows computers. Ensure that it's used responsibly and in compliance with your organization's policies.

- Be cautious when using startup GPOs, as they can affect system startup times. Test the script in a controlled environment before deploying it widely.

- Always backup important data before running scripts that modify or uninstall software.

## Troubleshooting

If you encounter issues or need assistance, refer to the troubleshooting section in the script or seek help from your IT team or community forums.