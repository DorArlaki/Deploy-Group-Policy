# GPO Automation Scripts

This repository contains scripts designed to streamline IT operations by automating common tasks via Group Policy Objects (GPOs). Below, you'll find details on how to use each script effectively.

## ISL AlwaysOn Uninstaller (PowerShell)

### Purpose

The "ISL-AlwaysOn-Uninstaller.ps1" script is designed to facilitate the removal of ISL AlwaysOn software from Windows computers. It silently uninstalls ISL AlwaysOn and deletes its associated folder.

### Usage

1. Place the script in a directory accessible by the target computers.
2. Run the script via Group Policy or other means.
3. The script will search for the ISL AlwaysOn uninstaller and execute it silently.
4. After successful uninstallation, the script will remove the ISL AlwaysOn folder.

### Notes

- Ensure that the ISL AlwaysOn uninstaller executable is present in one of the specified paths before running the script.
- This script is intended for use in an Active Directory environment.
- It simplifies the process of uninstalling ISL AlwaysOn software across multiple computers.

## Force GPUpdate (Batch)

### Purpose

The "Force-GPUpdate.bat" script allows you to remotely force a Group Policy update on target computers. This is useful when you need to ensure that the latest group policy settings are applied immediately.
Make sure that the gpupdate will run bedor the powershell by selecting "run powershell script last" when inserting the scripts into the GPO.
## Execution Order in GPO

When applying these scripts via Group Policy Objects (GPOs), it's essential to control the execution order to ensure that the batch script (`Force-GPUpdate.bat`) runs before the PowerShell script (`ISL-AlwaysOn-Uninstaller.ps1`). Follow these steps to configure the execution order:

1. Create or edit your GPO in your Active Directory environment.

2. In the GPO, navigate to "Computer Configuration" > "Policies" > "Windows Settings" > "Scripts (Startup/Shutdown)."

3. In the "Scripts (Startup/Shutdown)" section, you can add both scripts. However, it's crucial to set the batch script as the first script to execute.

4. Right-click on the scripts and select "Add a Script." Browse and select the batch script (`Force-GPUpdate.bat`) first.

5. Add the PowerShell script (`ISL-AlwaysOn-Uninstaller.ps1`) afterward.

6. The order in which you add the scripts determines the execution order. Scripts are executed from top to bottom in the list.

7. Confirm the changes and save your GPO configuration.

By setting the batch script as the first script to execute, you ensure that it runs before the PowerShell script, achieving the desired execution order. This is especially important when there are dependencies between scripts.


### Usage

1. Place the script in a directory accessible by the target computers.
2. Run the script via Group Policy or other means.
3. The script will trigger a force update of Group Policy on the target computers.

### Notes

- Use this script to ensure timely application of group policy changes across your network.
- It is particularly useful after making changes to GPOs and needing an immediate update.
