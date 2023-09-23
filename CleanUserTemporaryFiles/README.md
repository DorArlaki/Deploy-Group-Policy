# 🚀 Deploy Group Policy: RemoveTempFile Script 🚀

Welcome to the Deploy Group Policy RemoveTempFile Script! This PowerShell script is designed to help you efficiently clean up temporary files from user profiles on Windows computers through Group Policy. Keep your systems clutter-free!

## 📋 Overview

This script performs the following actions:
- Scans user profiles on Windows computers to identify and remove unnecessary temporary files.
- Logs any errors specific to each user for reference.
- Optionally, you can add additional cleanup steps that apply to all users.

## 🛠️ Usage

### Pre-Requisites
1. Ensure your target Windows computers have PowerShell enabled.
2. Configure this script to run through Group Policy.

### Deploying with Group Policy
1. Copy the PowerShell script (`RemoveTempFile.ps1`) to a location accessible to your target machines.
2. Configure a Group Policy Object (GPO) in your Active Directory environment.
3. Add this script to the GPO and set it to run during user login or computer startup.

**Important Note:**
- Share the GPO ShareScripts folder on the network.
- Ensure that the GPO ShareScripts folder is shared with the `Domain Computers` group.
- On the security tab of the shared folder, grant the `Domain Computers` group `read and execute` permissions.

## 🚨 Important Notes
- Always run the script with sufficient privileges. Administrative rights are necessary to clean up user profiles.
- This script is designed to remove unnecessary temporary files. Use with caution and ensure it's applied to the correct target machines.

## 🧹 Cleanup
Maintaining clean user profiles on your network helps improve system performance and security.

## 📜 License
This script is provided as-is, without any warranty. You are free to modify and distribute it according to your needs.

## 🙌 Contributing
We welcome contributions! Feel free to open an issue or submit a pull request to improve this script.

## 📧 Contact
If you have any questions or need assistance, don't hesitate to reach out.

Happy Scripting! 😄
