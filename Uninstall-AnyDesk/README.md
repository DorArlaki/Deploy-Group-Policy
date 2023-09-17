# AnyDesk Silent Uninstall GPO Script

This PowerShell script is intended to be deployed as a Group Policy Object (GPO) for silently uninstalling the AnyDesk application on Windows computers within a domain. The script automates the process, ensuring that there is no user interaction required during the uninstallation.

## Prerequisites

Before deploying this script as a GPO, ensure the following prerequisites are met:

1. **PowerShell Execution Policy**: PowerShell scripts must be allowed to run on the target computers. Ensure that the execution policy on target computers is appropriately configured to allow script execution. You can set the execution policy to "Unrestricted" or "Bypass" depending on your security requirements.

2. **Administrative Privileges**: The script must be executed with administrative privileges on target computers. Make sure the GPO is configured to run with the necessary permissions.

3. **Active Directory Domain**: Ensure that the target computers are part of an Active Directory domain and are properly organized within Organizational Units (OUs) where the GPO can be applied.

## GPO Deployment Steps

Follow these steps to deploy the script as a GPO:

1. **Save the Script**: Save this script as "UninstallAnyDesk.ps1."

2. **Configure the GPO**: In your Active Directory environment, create or modify a GPO to apply this script. You can name the GPO appropriately, such as "Uninstall AnyDesk."

3. **Edit the GPO**: Open the GPO for editing and navigate to "Computer Configuration" > "Policies" > "Windows Settings" > "Scripts (Startup/Shutdown)."

4. **Add the Script**: Double-click on "Startup." Click "Add" and provide the UNC path to the "UninstallAnyDesk.ps1" script. For example: `\\Server\Share\UninstallAnyDesk.ps1`.

5. **Apply the GPO**: Link the GPO to the Organizational Unit (OU) containing the target computers where AnyDesk needs to be uninstalled. Ensure that the GPO has the necessary permissions to execute scripts.

6. **GPO Behavior**: Configure the GPO to run scripts during computer startup. This ensures that the script is executed silently without any user interaction.

7. **Testing**: Before deploying the GPO in a production environment, thoroughly test it on a limited number of target computers to ensure it works as expected.

## Script Behavior

- The script checks if AnyDesk is running and terminates any running processes.
- It defines the path to the AnyDesk installation directory by default as "C:\Program Files (x86)\AnyDesk."
- It removes the AnyDesk installation directory, waits for a moment, and checks if the directory still exists.
- If the installation directory is still present, it forcefully deletes it.
- You can enable additional cleanup or logging as needed by uncommenting the relevant lines in the script.

## Important Notes

- Use this script responsibly and ensure that it aligns with your organization's policies and procedures.
- Always backup important data and configurations before running scripts that modify or uninstall software.
- Test the GPO and script in a controlled environment before deploying them in a production environment to avoid unexpected issues.

## License

This script is provided as-is without any warranties. You may use and modify it according to your needs, but use it at your own risk. There is no official support provided for this script.

---

For more information and support, contact the script author or your organization's IT department.
