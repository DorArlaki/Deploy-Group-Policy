# PowerShell GPO Script: Uninstall AnyDesk and Cleanup Downloads Folder

This PowerShell script is designed to be deployed via Group Policy Objects (GPO) to uninstall AnyDesk from Windows computers and perform cleanup tasks in user Downloads folders. It ensures that only one instance of `AnyDesk.exe` remains in each user's Downloads folder.

## Usage

### Deployment via Group Policy

1. **Download the Script**: Download the PowerShell script, `UninstallAnyDesk.ps1`, from this repository.

2. **Modify Script (Optional)**: If necessary, you can modify the script to meet your specific requirements. For example, you can change the paths or add additional cleanup tasks.

3. **Deploy with Group Policy**:

   a. Open the Group Policy Management Console (GPMC) on your Windows Server.

   b. Create a new GPO or use an existing one, and edit it.

   c. Navigate to `Computer Configuration` > `Policies` > `Windows Settings` > `Scripts (Startup/Shutdown)`.

   d. In the `Startup` or `Logon` script section, add a new PowerShell script (`UninstallAnyDesk.ps1`) to be run at startup.

   e. Link the GPO to the Organizational Unit (OU) containing the target computers.

4. **Apply GPO**: The GPO will execute the script on the target computers during startup or logon, ensuring that AnyDesk is uninstalled, and the Downloads folder is cleaned up.

## Script Details

- The script begins by uninstalling AnyDesk using the specified uninstaller located at `"C:\Program Files (x86)\AnyDesk\AnyDesk.exe"`.

- It then iterates through user profiles on the computer to clean up the Downloads folder.

- In the Downloads folder, the script ensures that only one instance of `AnyDesk.exe` remains, removing any additional copies.

- You can customize the script further to add additional cleanup tasks or modify the behavior according to your requirements.

## Requirements

- This script is designed to work on Windows computers with PowerShell installed.

- Ensure appropriate permissions for script execution on target computers.

## Troubleshooting

- If you encounter any issues with script execution or customization, please refer to the [GitHub Issues](https://github.com/yourusername/yourrepository/issues) section for help or assistance.

## License

This script is provided under the [MIT License](LICENSE).

Feel free to use, modify, and distribute it as needed within the terms of the license.

---

*Note: Replace the placeholders in this README with your actual script details and repository information.*

For additional assistance or questions, please contact the script author.
