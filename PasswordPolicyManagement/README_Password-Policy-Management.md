# Password Policy Management

This repository provides resources and documentation for managing password policies in an Active Directory environment.

## Script: UpdatePasswordPolicy.ps1

### Description

The `UpdatePasswordPolicy.ps1` script is designed to help administrators manage password policies in an Active Directory environment. It accomplishes the following tasks:

1. Disables the "PasswordNeverExpires" attribute for user accounts that have it set to true.
2. Sets the "pwdLastSet" attribute to zero for all users, forcing them to change their passwords at the next logon.

### Prerequisites

Before running this script, ensure the following prerequisites are met:

1. You have administrative privileges in the Active Directory domain.
2. The Active Directory module is available on your computer. You can import it using the following command:

   ```powershell
   Import-Module ActiveDirectory
   ```
### Usage

    - Clone or download this repository to your local machine.

    - Open PowerShell as an administrator.

    - Navigate to the folder containing the script.

    - Run the script:
   ```powershell
    .\UpdatePasswordPolicy.ps1
   ```

    The script will execute and update the password policies for all domain users.

### `Important Note

Please use this script with caution, as it can affect all users in your Active Directory domain. It's recommended to test the script in a non-production environment first.

Feel free to contribute, report issues, or suggest improvements by creating GitHub issues or pull requests.

Repository: Password Policy Management

This script is provided as-is without any warranty. Use it at your own risk.
