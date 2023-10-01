## Additional Notes

### Setting up the Shared Folder

To deploy this script via Group Policy, you'll need to create a shared folder on a domain computer. Follow these steps to set up the shared folder:

1. **Create a Shared Folder**:

   - Choose a domain computer where you'll host the shared folder.
   - Right-click on the folder you want to share (e.g., `C:\Scripts`) and select "Properties."
   - Navigate to the "Sharing" tab and click the "Advanced Sharing" button.
   - Check the box that says "Share this folder."

2. **Set Share Permissions**:

   - Click the "Permissions" button to configure share permissions.
   - Add "Domain Computers" to the list of groups or users.
   - Ensure that "Domain Computers" has the following permissions:
     - Read
![SharingTabAll](https://github.com/DorArlaki/Deploy-Group-Policy/assets/107101354/533dec68-f8d9-4ea9-8eae-affc09c701f5)
3. **Set Security Permissions**:

   - Navigate to the "Security" tab.
   - Click the "Edit" button to configure security permissions.
   - Add "Domain Computers" to the list of groups or users.
   - Grant "Domain Computers" the following permissions:
     - Read & Execute
     - List Folder Contents
     - Read

4. **Note the Shared Folder Path**:

   - Make a note of the full shared folder path (e.g., `\\ComputerName\SharedFolder`), as you'll need it for the script configuration.

### Removing Shared Delegation

To ensure that shared delegation does not interfere with script execution, follow these steps to remove delegation:

1. **Open Active Directory Users and Computers**:

   - On a domain controller, open "Active Directory Users and Computers."

2. **Locate the Shared Folder**:

   - In the left pane, navigate to the "Users" or "Computers" container where the computer hosting the shared folder resides.

3. **Find the Shared Folder Computer Object**:

   - Locate the computer object representing the machine where you've set up the shared folder.

4. **Open Computer Properties**:

   - Right-click on the computer object and select "Properties."

5. **Navigate to the "Delegation" Tab**:

   - In the computer properties window, navigate to the "Delegation" tab.

6. **Remove Existing Delegation**:

   - Review the list of delegated services.
   - Remove any unwanted delegations that could interfere with script execution.

These steps ensure that the shared folder is properly configured and that shared delegation does not interfere with the script's deployment via Group Policy.
