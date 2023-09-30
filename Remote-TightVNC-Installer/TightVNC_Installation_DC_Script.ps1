# Basic silent installation
msiexec /i "C:\Share\GPO\Scripts\tightvnc-2.8.81-gpl-setup-64bit.msi" /quiet /norestart

# Install only the server part
msiexec /i "C:\Share\GPO\Scripts\tightvnc-2.8.81-gpl-setup-64bit.msi" /quiet /norestart ADDLOCAL=Server

# Enable VNC authentication with a password
msiexec /i "C:\Share\GPO\Scripts\tightvnc-2.8.81-gpl-setup-64bit.msi" /quiet /norestart SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=your_password_here

# Enable control interface authentication with a password
msiexec /i "C:\Share\GPO\Scripts\tightvnc-2.8.81-gpl-setup-64bit.msi" /quiet /norestart SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=your_password_here
