
# Exploring commands and parameters in PowerShell

Get-ADUser

Get-Help Get-ADUser

# Getting all users in Active Directory
Get-ADUser -Filter *

# Getting all users with a specific name
Get-ADUser -Filter "Name -like '*Cooper*'"

# Getting all properties for a specific user
Get-ADUser -Filter "Name -like '*Cooper*'" -Properties *

# Filtering and selecting specific properties
Get-ADUser -Filter * -SearchBase "OU=summit-users,DC=home,DC=lab" | Select-Object Name,SamAccountName,UserPrincipalName

# Grouping users by their office location and sorting by count
Get-ADUser -Filter * -Properties * | Group-Object Office | Sort-Object Count -Descending

# Filtering users based on office location and selecting specific properties
Get-ADUser -Filter "Office -eq 'Twin Peaks'" -Properties * | Select-Object Name,Office,Description,whenCreated,LastLogonDate | Format-Table

# Exporting the results to a CSV file
Get-ADUser -Filter "Office -eq 'Twin Peaks'" -Properties * | 
    Select-Object Name,Office,Description,whenCreated,LastLogonDate | Export-Csv -Path ".\ADUsers.csv" -NoTypeInformation