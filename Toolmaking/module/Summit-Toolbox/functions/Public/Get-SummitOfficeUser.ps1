function Get-SummitOfficeUser {
    [CmdletBinding()]
    param (
        [string]$Office
    )

    Get-ADUser -Filter * -SearchBase "OU=summit-users,DC=home,DC=lab" -Properties Name,UserPrincipalName,Description,Office | 
        Where-Object Office -eq $Office | Select-Object Name,UserPrincipalName,Description,Office

}