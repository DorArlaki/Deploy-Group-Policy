# Import the Active Directory module if not already loaded
if (-not (Get-Module -Name ActiveDirectory -ErrorAction SilentlyContinue)) {
    Import-Module ActiveDirectory
}

# Disable "PasswordNeverExpires" for accounts that have it set to true
Get-ADUser -Filter {PasswordNeverExpires -eq $true} | ForEach-Object {
    Set-ADUser -Identity $_ -PasswordNeverExpires $false
}

# Set "pwdLastSet" to zero for all users
Get-ADUser -Filter * | ForEach-Object {
    Set-ADUser -Identity $_ -ChangePasswordAtLogon $true -Replace @{pwdLastSet=0}
}

Write-Host "Password policies updated. All domain users will be required to change their passwords at the next logon."
