
Get-ChildItem c:\Does-Not-Exist

$Error

$ErrorView # ConciseView, CategoryView, DetailedView, NormalView 

$Error[0] | select *


try {
    Get-ChildItem c:\Does-Not-Exist 
    Write-Host "Moving on to the next command..." -ForegroundColor Magenta
} catch {
    throw "You are missing a directory. Please contact the service desk to resolve this issue."
}

$ErrorActionPreference # Continue, SilentlyContinue, Ignore, Stop, Break, Inquire, Suspend


try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
    1/0
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