
Get-ChildItem c:\Does-Not-Exist


try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
    Write-Host "Moving on to the next command..." -ForegroundColor Magenta
} catch {
    throw "You are missing a directory. Please contact the service desk to resolve this issue."
}



try {
    Get-ChildItem C:\code -ErrorAction Stop
    Write-Host "Moving on to the next command..." -ForegroundColor Magenta
} catch {
    throw "You are missing a directory. Please contact the service desk to resolve this issue."
}