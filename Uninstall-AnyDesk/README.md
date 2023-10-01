# PowerShell GPO Script: Uninstall AnyDesk and Cleanup Downloads

## Overview

This PowerShell script simplifies the uninstallation of AnyDesk while performing a cleanup of user Downloads folders on Windows computers. It ensures a clean removal of AnyDesk using the `--remove` option and leaves only one instance of `AnyDesk.exe` in each user's Downloads folder.

## Table of Contents

- [Usage](#usage)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Customization](#customization)
- [Setting up the Shared Folder](#setting-up-the-shared-folder)
- [Removing Shared Delegation](#removing-shared-delegation)
- [Contributing](#contributing)
- [License](#license)

## Usage

### Deployment via Group Policy

1. **Download the Script**: Obtain the PowerShell script, `UninstallAnyDesk.ps1`, from this repository.

2. **Modify Script (Optional)**: Customize the script according to your organization's needs. You can adjust paths or incorporate additional cleanup tasks.

3. **Deploy with Group Policy**:

   a. Open the Group Policy Management Console (GPMC) on your Windows Server.

   b. Create a new GPO or utilize an existing one and edit it.

   c. Navigate to `Computer Configuration` > `Policies` > `Windows Settings` > `Scripts (Startup/Shutdown)`.

   d. In the `Startup` or `Logon` script section, add a new PowerShell script (`UninstallAnyDesk.ps1`) for execution at startup.

   e. Apply the GPO to the Organizational Unit (OU) containing the target computers.

4. **Apply GPO**: The GPO executes the script on the target computers during startup, ensuring AnyDesk is uninstalled, and the Downloads folder is cleaned up.

## Features

- **Uninstallation**: The script facilitates the uninstallation of AnyDesk using the `--remove` option, ensuring a clean and silent removal.

- **Downloads Folder Cleanup**: It scans user profiles and retains only one instance of `AnyDesk.exe` in each user's Downloads folder.

- **Customizable**: The script is adaptable for specific paths or additional cleanup tasks, providing flexibility as per your requirements.

## Requirements

- This script is intended for Windows computers with PowerShell installed.

- Ensure appropriate permissions are granted for script execution on target computers.

## Installation

1. Clone or download this repository to your local machine.

2. Copy the `UninstallAnyDesk.ps1` script to a location accessible by your GPO deployment process.

## Customization

You can customize the script by editing variables, such as `$newValue`, to modify the uninstallation behavior or add further cleanup tasks as needed.

## Setting up the Shared Folder

To deploy this script via Group Policy, you'll need to create a shared folder on a domain computer. Follow these steps to set up the shared folder:

1. **Create a Shared Folder**:

   - Choose a domain computer where you'll host the shared folder.
   - Right-click on the folder you want to share (e.g., `C:\Scripts`) and select "Properties."
   - Navigate to the "Sharing" tab and click the "Advanced Sharing" button.
   - Check the box that says "Share this folder."

2. **Set Share Permissions**:

   - Click the "Permissions" button to configure share permissions.
   - Add "Domain Computers" to the list of groups or users.
   - Ensure that "Domain Computers" has the following permissions:
     - Read

3. **Set Security Permissions**:

   - Navigate to the "Security" tab.
   - Click the "Edit" button to configure security permissions.
   - Add "Domain Computers" to the list of groups or users.
   - Grant "Domain Computers" the following permissions:
     - Read & Execute
     - List Folder Contents
     - Read

4. **Note the Shared Folder Path**:

   - Make a note of the full shared folder path (e.g., `\\ComputerName\SharedFolder`), as you'll need it for the script configuration.

## Removing Shared Delegation

To ensure that shared delegation does not interfere with script execution, follow these steps to remove delegation:

1. **Open Active Directory Users and Computers**:

   - On a domain controller, open "Active Directory Users and Computers."

2. **Locate the Shared Folder**:

   - In the left pane, navigate to the "Users" or "Computers" container where the computer hosting the shared folder resides.

3. **Find the Shared Folder Computer Object**:

   - Locate the computer object representing the machine where you've set up the shared folder.

4. **Open Computer Properties**:

   - Right-click on the computer object and select "Properties."

5. **Navigate to the "Delegation" Tab**:

   - In the computer properties window, navigate to the "Delegation" tab.

6. **Remove Existing Delegation**:

   - Review the list of delegated services.
   - Remove any unwanted delegations that could interfere with script execution.

These steps ensure that the shared folder is properly configured, and shared delegation does not interfere with the script's deployment via Group Policy.

## Contributing

Contributions to enhance this script or address issues are welcome. Please open an issue or create a pull request with your proposed changes.

## License

This script is provided under the [MIT License](LICENSE).

## Acknowledgments

- Special thanks to the PowerShell community for their contributions
