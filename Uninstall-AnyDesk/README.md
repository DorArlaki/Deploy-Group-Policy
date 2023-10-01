# PowerShell GPO Script: Uninstall AnyDesk and Cleanup Downloads

## Overview

This PowerShell script is designed to streamline the uninstallation of AnyDesk and perform a clean-up of user Downloads folders on Windows computers. The primary goals are to uninstall AnyDesk using the `--remove` option and ensure that only one instance of `AnyDesk.exe` remains in each user's Downloads folder.

## Table of Contents

- [Usage](#usage)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Usage

### Deployment via Group Policy

1. **Download the Script**: Download the PowerShell script, `UninstallAnyDesk.ps1`, from this repository.

2. **Modify Script (Optional)**: Customize the script as needed to align with your organization's requirements. You can change paths or add additional cleanup tasks.

3. **Deploy with Group Policy**:

   a. Open the Group Policy Management Console (GPMC) on your Windows Server.

   b. Create a new GPO or use an existing one, and edit it.

   c. Navigate to `Computer Configuration` > `Policies` > `Windows Settings` > `Scripts (Startup/Shutdown)`.

   d. In the `Startup` or `Logon` script section, add a new PowerShell script (`UninstallAnyDesk.ps1`) to be executed at startup.

   e. Link the GPO to the Organizational Unit (OU) containing the target computers.

4. **Apply GPO**: The GPO will execute the script on the target computers during startup or logon, ensuring that AnyDesk is uninstalled, and the Downloads folder is cleaned up.

## Features

- **Uninstallation**: The script automatically uninstalls AnyDesk using the `--remove` option, ensuring a clean removal.

- **Downloads Folder Cleanup**: It iterates through user profiles and ensures that only one instance of `AnyDesk.exe` remains in each user's Downloads folder.

- **Customizable**: The script can be customized to accommodate specific paths or additional cleanup tasks.

- **Troubleshooting**: Detailed error handling and troubleshooting instructions are provided.

## Requirements

- This script is intended for use on Windows computers with PowerShell installed.

- Ensure that appropriate permissions are granted for script execution on target computers.

## Installation

1. Clone or download this repository to your local machine.

2. Copy the `UninstallAnyDesk.ps1` script to a location accessible by your GPO deployment process.

## Customization

You can customize the script by editing variables such as `$newValue` to adjust the uninstallation behavior or add further cleanup tasks.

## Troubleshooting

If you encounter issues with script execution or customization, please refer to the [GitHub Issues](https://github.com/yourusername/yourrepository/issues) section for assistance.

## Contributing

Contributions and feedback are welcome! If you have suggestions or improvements, please create a pull request or open an issue.

## License

This script is provided under the [MIT License](LICENSE). You are free to use, modify, and distribute it in accordance with the terms of the license.

---

*Note: Replace the placeholders in this README with your script's specific details and repository information.*

For additional assistance or questions, please contact the script author.
