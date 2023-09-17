## 📥 Step 2: Place the Downloaded MSI Installer File

**Before you start, make sure you've downloaded the TightVNC MSI installer file from the official website.**

**Step 1:** Download the TightVNC MSI installer from the official website:
[Download TightVNC MSI Installer](https://www.tightvnc.com/download.php)

**Step 2:** Place the downloaded MSI installer file in a shared folder that's accessible from your Active Directory server.

**Here's how:**

1. **Locate the TightVNC MSI installer file on your computer.**

2. **Right-click on the file and select "Copy."**

3. **Now, go to your Active Directory server or a server within your Active Directory environment.**

4. **Create a shared folder on this server where you want to store the TightVNC MSI installer.**

   - Right-click on a folder of your choice.
   - Select "Properties."
   - Go to the "Sharing" tab.
   - Click "Advanced Sharing."

5. **In the "Advanced Sharing" window, check the "Share this folder" box.**

6. **You can give the folder a name or keep the default one. Remember this share name; you'll need it to access the shared folder.**

7. **Click the "Permissions" button to set who can access the shared folder. Ensure that the users or groups you intend to share with have "Read + Execute" permissions, especially if you plan to run scripts from this folder.**

8. **Click "OK" to close the "Permissions" window.**

9. **Click "OK" again to close the "Advanced Sharing" window.**

10. **Click "Apply" and then "OK" to close the folder properties window.**

**You've successfully placed the TightVNC MSI installer file in a shared folder accessible from your Active Directory server. You're now ready for the next steps in the deployment process.**

![Shared Folder](https://github.com/DorArlaki/Remote-TightVNC-Installer/assets/107101354/50c64be4-9a53-43bf-9760-f35631f94b46)
