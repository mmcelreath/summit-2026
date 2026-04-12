Get-ADUser -Filter "Office -eq 'Twin Peaks'" -Properties * | 
    Select-Object Name,Office,Description,whenCreated,LastLogonDate | Format-Table

Get-ADUser -Identity "Dale.Cooper" -Properties * | Select-Object Name,Office,Description,whenCreated,LastLogonDate

Set-ADUser -Identity "Dale.Cooper" -Office "Seattle" -Description "Moved to Seattle office"















Set-ADUser -Identity "Dale.Cooper" -Office "Twin Peaks" -Description "Special Agent"