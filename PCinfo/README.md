# PCinfo.ps1

PCinfo.ps1 is a PowerShell script designed to gather system information from Windows computers and log any errors encountered during execution. It is intended to be deployed as a Group Policy Object (GPO) and executed by domain computers.

## Description

This script collects various system information, including hostname, operating system version, CPU details, and RAM size, and exports the data to a CSV file named "PCinfo.csv". Additionally, it logs any errors encountered during execution to a separate file named "ErrorLog.txt".

## Deployment as a Group Policy Object (GPO)

1. Copy the PCinfo.ps1 script to a shared network folder accessible by domain computers. Ensure that only domain computers have permissions to access this folder.
2. Create a new Group Policy Object (GPO) or edit an existing one.
3. Configure the GPO to run the PCinfo.ps1 script as a startup or logon script for domain computers.
4. Link the GPO to an Organizational Unit (OU) containing the desired domain computers.
5. Ensure that the folder specified for storing CSV and log files has appropriate permissions set for domain computers to write data.
