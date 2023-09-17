# 🚀 Deploy Group Policy: Uninstall AnyDesk Script 🚀

Welcome to the Deploy Group Policy Uninstall AnyDesk Script! This PowerShell script is designed to help you efficiently and effortlessly uninstall AnyDesk from your Windows computers through Group Policy. Say goodbye to unwanted remote desktop software!

## 📋 Overview

This script performs the following actions:
- Checks if AnyDesk is running and gracefully terminates it.
- Removes the AnyDesk installation directory from `C:\Program Files (x86)\AnyDesk`.
- Cleans up AnyDesk executable files from the user's Downloads folder.
- Ensures the main AnyDesk executable is deleted from the Downloads folder.

## 🛠️ Usage

### Pre-Requisites
1. Ensure your target Windows computers have PowerShell enabled.
2. Configure this script to run through Group Policy.

### Deploying with Group Policy
1. Copy the PowerShell script (`Uninstall-AnyDesk.ps1`) to a location accessible to your target machines.
2. Configure a Group Policy Object (GPO) in your Active Directory environment.
3. Add this script to the GPO and set it to run during computer startup or shutdown.

**Important Note:**
- Share the GPO ShareScripts folder on the network.
- Ensure that the GPO ShareScripts folder is shared with the `Domain Computers` group.
- On the security tab of the shared folder, grant the `Domain Computers` group `read and execute` permissions.

## 🚨 Important Notes
- Always run the script with sufficient privileges. Administrative rights are necessary for some actions.
- This script is designed to remove AnyDesk. Use with caution and ensure it's applied to the correct target machines.

## 🧹 Cleanup
Remember, a clean computer is a happy computer! This script helps keep your network clean by removing unwanted AnyDesk installations.

## 📜 License
This script is provided as-is, without any warranty. You are free to modify and distribute it according to your needs.

## 🙌 Contributing
We welcome contributions! Feel free to open an issue or submit a pull request to improve this script.

## 📧 Contact
If you have any questions or need assistance, don't hesitate to reach out.

Happy Scripting!  😄
