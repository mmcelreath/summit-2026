
$Error.Clear()

function Test-Error {
    Get-ChildItem c:\Does-Not-Exist

    Write-Host "Will this Print?" -ForegroundColor Magenta
}

Test-Error



function Test-Error {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop

    Write-Host "Will this Print?" -ForegroundColor Magenta
}

Test-Error



function Test-Error {
    $ErrorActionPreference = "Stop"
    
    Get-ChildItem c:\Does-Not-Exist

    Write-Host "This will not be printed because ErrorActionPreference is set to Stop" -ForegroundColor Magenta
}

Test-Error


function Test-Error {
    throw("An error occurred in Test-Error")

    Write-Host "This will not be printed after a throw statement" -ForegroundColor Magenta
}

Test-Error


$Error.Clear()
$Error

function Test-Error {
    $ErrorActionPreference = "SilentlyContinue"
    
    Get-ChildItem c:\Does-Not-Exist

    Write-Host "This will be printed because ErrorActionPreference is set to SilentlyContinue" -ForegroundColor Magenta
}

Test-Error

$Error