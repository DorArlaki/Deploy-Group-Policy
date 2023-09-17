# 🚀 Welcome to the TightVNC GPO Deployment Guide!

Are you tired of manually installing TightVNC on your Windows PCs within an Active Directory environment? Say goodbye to the hassle with our straightforward TightVNC Group Policy (GPO) deployment guide. ✨

## Requirements 🧙‍♂️

Before you start, make sure you have:

- An Active Directory environment in place.
- Administrative access to the target PCs.
- The TightVNC MSI installer file.

## 📥 Download the TightVNC Installer

### Step 1: Download the TightVNC MSI installer from the official website:
[Download TightVNC MSI Installer](https://www.tightvnc.com/download.php)

**Step 2:** Place the downloaded MSI installer file in a shared folder that's accessible from your Active Directory server.
[README-Step_2.md](README-Step_2.md)

## 🛠️ Configuration (Modify `install-tightvnc.ps1`)

### Step 3: Modify the script (`install-tightvnc.ps1`) as follows:

```powershell
# Define the UNC path to the TightVNC installer on the PC
$pcInstallerPath = "\\<DC_IP>\<PathTo>\tightvnc-2.8.81-gpl-setup-64bit.msi"   # Change this to your desired IP + Path

# Define the password
$password = "your_password"  # Change this to your desired password
```
![TightVNC-PC](https://github.com/DorArlaki/Deploy-Group-Policy/assets/107101354/7586df5e-6a26-44ef-82e8-c097d530eb39)
- Set the desired VNC password in `$password`.
- Update `$pcInstallerPath` to point to the `.msi` file path on the PC.

### Step 4: Install TightVNC on your domain controller:

1. Log in to your domain controller with administrative privileges.
2. Open PowerShell ISE as an administrator.
3. Copy and paste the content of "TightVNC_Installation_DC_Script.ps1" into PowerShell ISE and run the code.
![DC-TightVNC](https://github.com/DorArlaki/Deploy-Group-Policy/assets/107101354/3a572ca9-236c-4966-bc3f-edb4af7a1f76)
### Step 5: Set up Group Policy:

1. Create a new Group Policy Object (GPO) or modify an existing one in your Active Directory domain.
2. Navigate to "Computer Configuration" in the GPO and select "Windows Settings" under "Policies."
3. Under GPO settings, go to "Scripts" and select "Startup/Shutdown."
4. Under the 'PowerShell Scripts' tab, click 'Add' -> 'Browse.' Paste the 'install-tightvnc.ps1' script (modified in Step 3), and press 'OK.' Save your changes.

### Step 6: Apply the GPO:

1. Link the GPO to the Organizational Unit (OU) containing the target PCs, ensuring that the members of the GPO are the "Domain Computers" group.
2. Verify read and execute permissions and GPO Security Filtering.

- Now, the importance of applying the GPO to the "Domain Computers" group is high.

**Important Note:**
-  Share the GPO ShareScripts folder on the network.
-  Ensure that the GPO ShareScripts folder is shared with the Domain Computers group.
-  On the security tab of the shared folder, grant the Domain Computers group read and execute permissions.


### POC
![POC](https://github.com/DorArlaki/Deploy-Group-Policy/assets/107101354/218462b1-d704-4296-ab98-f97063027495)
Feel the magic, embrace the ease, and let your VNC GPO Deployment be a spellbinding experience! 🪄✨
