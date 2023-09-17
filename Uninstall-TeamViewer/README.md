# TeamViewer Removal Script (Startup GPO)

## Overview

Welcome to the TeamViewer Removal Script! This handy PowerShell script is designed to make your life easier by helping you remove TeamViewer from Windows computers using a startup Group Policy Object (GPO). It's like saying goodbye to TeamViewer with a click of a button.

Here's what this script does for you:

1. **Terminate Like a Pro**: It forcefully terminates any running TeamViewer processes. Say goodbye to those pesky background tasks!

2. **Silent Uninstall**: It silently uninstalls TeamViewer, sparing you from those annoying uninstaller prompts.

3. **Clean Slate**: It cleans up residual files and registry entries, leaving your computer squeaky clean.

## Prerequisites

Before you embark on your TeamViewer-removing adventure, make sure you've got the following:

- **Administrator Privileges**: This script needs to be run with administrator privileges. Don't worry; we've got you covered!

## Usage

Let's get started with a step-by-step guide:

1. **Download the Script**: First, grab the `Remove-TeamViewer.ps1` script from this repository and save it on your trusty administrative computer.

2. **Edit with Care**: Open the script in your favorite text editor (or choose the fanciest one). Make sure to check the following variable:

   - `$uninstallerPath`: Ensure it points to TeamViewer's uninstaller (`uninstall.exe`) correctly.

3. **GPO Magic**:

   - Fire up the Group Policy Management Console (GPMC) on your domain controller. It's where the magic begins!

   - Create a new GPO or pick an existing one that you want to use for deploying the script.

4. **Add the Script**:

   - Navigate to the GPO's "Computer Configuration" > "Policies" > "Windows Settings" > "Scripts (Startup/Shutdown)".

   - Double-click "Startup" to edit the startup scripts.

   - Click "Add," and like a skilled explorer, find the `Remove-TeamViewer.ps1` script.

   - Click "OK" to add the script like a boss!

5. **Apply the GPO**:

   - Link the GPO to the Organizational Unit (OU) that houses the target computer objects.

   - Make sure the GPO applies correctly to the computers you're targeting.

6. **Deploy the GPO**:

   - Let's give it some time. Wait for Group Policy to refresh on your target computers, or use some IT magic with `gpupdate /force`.

   - Watch the script do its thing at startup, silently removing TeamViewer. It's like a ninja!

7. **Keep an Eye on It**:

   - Curious to know what's happening? Check out the Windows Event Viewer on your target computers. It might spill some secrets!

## Notes

- Remember, this script is designed for Windows computers and TeamViewer removal. Please use it responsibly and follow your organization's policies.

- Startup GPOs can affect system startup times, so test the script in a controlled environment before going all-in.

- Always have a backup of important data before running scripts that tinker with software.

## Troubleshooting

If you run into any issues or need help, check out the troubleshooting section in the script or reach out to your IT team or friendly community forums. You're not alone on this journey!

Now, go forth and conquer TeamViewer removal with confidence! 🚀
