

Get-ADUser -Filter "Office -eq 'Twin Peaks'" -Properties * | 
    Select-Object Name,Office,Description,whenCreated,LastLogonDate | Format-Table





Get-ADUser -Identity "Dale.Cooper" -Properties * | 
    Select-Object Name,Office,Description,whenCreated,LastLogonDate



Set-ADUser -Identity "Dale.Cooper" `
    -Office "Seattle" `
    -Description "Moved to Seattle office"





New-ADUser -Name "Pete Martell" `
    -GivenName "Pete" `
    -Surname "Martell" `
    -SamAccountName "Pete.Martell" `
    -Office "Twin Peaks" `
    -Description "Gone Fishin'" `
    -Path "OU=summit-users,DC=home,DC=lab"

    
Get-ADUser -Identity "Pete.Martell" -Properties * | Select-Object Name,Office,Description,whenCreated,LastLogonDate


Remove-ADUser -Identity "Pete.Martell" 


Remove-ADUser -Identity "Pete.Martell" -Confirm:$false







Set-ADUser -Identity "Dale.Cooper" -Office "Twin Peaks" -Description "Special Agent"