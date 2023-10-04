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
