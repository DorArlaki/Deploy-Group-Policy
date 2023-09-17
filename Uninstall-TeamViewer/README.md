# TeamViewer Removal Script (Startup GPO)

## Overview

Welcome to the TeamViewer Removal Script! This PowerShell script is designed to help you remove TeamViewer from Windows computers by using a startup Group Policy Object (GPO). It ensures a seamless and hassle-free process, performing the following key tasks:

1. **Graceful Termination**: The script forcibly terminates any active TeamViewer processes to prepare for removal.

2. **Silent Uninstallation**: It silently uninstalls TeamViewer, sparing you from interactive uninstallation prompts.

3. **Thorough Cleanup**: The script diligently removes any residual files and registry entries to leave the system clean and pristine.

## Prerequisites

Before deploying this script, ensure you meet the following prerequisites:

- **Administrator Privileges**: To execute this script successfully, administrative privileges are required to facilitate the complete removal of TeamViewer.

## Usage

To make use of this script, follow these step-by-step instructions:

1. **Script Download**: Begin by downloading the `Remove-TeamViewer.ps1` script from this repository and save it to your administrative computer.

2. **Script Configuration**: Open the script in a text editor and verify that the `$uninstallerPath` variable points to the correct path of TeamViewer's uninstaller (`uninstall.exe`).

3. **Group Policy Object (GPO) Creation**:

   - Access the Group Policy Management Console (GPMC) on your domain controller.

   - Either create a new GPO or select an existing one to use for deploying the script.

4. **Adding the Script to GPO**:

   - Navigate to the GPO's "Computer Configuration" > "Policies" > "Windows Settings" > "Scripts (Startup/Shutdown)".

   - Double-click "Startup" to edit the startup scripts.

   - Click "Add" and browse for the `Remove-TeamViewer.ps1` script.

   - Confirm your selection by clicking "OK."

5. **GPO Application**:

   - Link the GPO to the Organizational Unit (OU) that contains the target computer objects.

   - Ensure that the GPO is correctly applied to the intended computers.

6. **GPO Deployment**:

   - Allow some time for Group Policy to refresh on the target computers, or manually trigger a refresh using `gpupdate /force`.

   - The script will execute at system startup, efficiently removing TeamViewer without any user intervention.

7. **Monitoring Execution**:

   - Monitor the script's execution and check for any potential errors using the Windows Event Viewer on the target computers.

## Notes

- This script is specifically designed for removing TeamViewer from Windows computers. It is essential to use it responsibly and in compliance with your organization's policies.

- Be mindful of the potential impact on system startup times when using startup GPOs. We recommend thorough testing in a controlled environment before widespread deployment.

- Always create backups of critical data before executing scripts that modify or uninstall software to ensure data integrity.

## Troubleshooting

If you encounter issues or require assistance, consult the troubleshooting section within the script itself, or seek support from your IT team or relevant community forums. You are not alone in addressing any challenges that may arise.

Now, proceed with confidence and effortlessly remove TeamViewer from your systems using this script! 🚀
