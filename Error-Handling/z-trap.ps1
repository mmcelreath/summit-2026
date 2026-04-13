trap { Write-Host "An error occurred: $_" -ForegroundColor Magenta }

Get-ChildItem -Path "C:\NonExistentDirectory" -ErrorAction Stop

