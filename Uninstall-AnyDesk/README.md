# PowerShell GPO Script: Uninstall AnyDesk and Cleanup Downloads

## Overview

This PowerShell script simplifies the uninstallation of AnyDesk while performing a cleanup of user Downloads folders on Windows computers. It ensures a clean removal of AnyDesk using the `--remove` option and leaves only one instance of `AnyDesk.exe` in each user's Downloads folder.

## Table of Contents

- [Usage](#usage)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Customization](#customization)
- [Additional Notes](#additional-notes)
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

[Setup and Permissions Guide](/additional-notes)

## Contributing

Contributions to enhance this script or address issues are welcome. Please open an issue or create a pull request with your proposed changes.

## License

This script is provided under the [MIT License](LICENSE).

## Acknowledgments

- Special thanks to the PowerShell community for their contributions and support.

