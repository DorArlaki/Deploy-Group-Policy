# 🚀 Deploy Group Policy: RemoveTempFile PowerShell Script 🚀

Welcome to the Deploy Group Policy RemoveTempFile PowerShell Script! This script is designed to help you efficiently clean up temporary files in the user profiles of Windows computers through Group Policy. Keep your network clean and free up disk space effortlessly!

## 📋 Overview

This script performs the following actions:
- Identifies and removes temporary files from user profiles.
- Logs any errors encountered during the cleanup process for reference.

## 🛠️ Usage

### Pre-Requisites
1. Ensure your target Windows computers have PowerShell enabled.
2. Configure this script to run through Group Policy.

### Deploying with Group Policy
1. Copy the PowerShell script (`RemoveTempFile.ps1`) to a location accessible to your target machines.
2. Configure a Group Policy Object (GPO) in your Active Directory environment.
3. Add this script to the GPO and set it to run during computer startup or shutdown.

**Important Note:**
- The script is designed to clean up temporary files for all users on the target computer.

## 🚨 Important Notes
- Always run the script with sufficient privileges. Administrative rights are necessary for some cleanup actions.
- This script affects all user profiles on the target computer. Ensure it's applied to the correct target machines.

## 🧹 Cleanup
Keep your computers tidy and running smoothly by removing unnecessary temporary files from user profiles.

## 📜 License
This script is provided as-is, without any warranty. You are free to modify and distribute it according to your needs.

## 🙌 Contributing
We welcome contributions! Feel free to open an issue or submit a pull request to improve this script.

## 📧 Contact
If you have any questions or need assistance, don't hesitate to reach out.

Happy Scripting! 😄
