
$Error.Clear()

try {
    Get-ChildItem c:\Does-Not-Exist
} catch {
    Write-Host "An error occurred: $_"
}


try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Magenta
}

$Error[0]
$Error[0] | Select-Object *

$Error.Clear()


function Test-Error {
    # $ErrorActionPreference = "Stop"
    1/0
    Write-Host "Will this Print?" -ForegroundColor Magenta  # This will NOT print
}

Test-Error


try {
    1/0
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Magenta
}

$Error.Clear()


Get-ChildItem c:\Does-Not-Exist

$Error[0] | select-object *
Get-Error -Newest 1

$Error.Clear()

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found." -ForegroundColor Magenta
} catch {
    Write-Host "A different error occurred: $_" -ForegroundColor Red
}

Get-Error -Newest 1

try {
    Get-ChildItem C:\code -ErrorAction Stop
    1/0
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found." -ForegroundColor Magenta
} catch {
    Write-Host "A different error occurred: $_" -ForegroundColor Red
}


try {
    1/0
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found." -ForegroundColor Magenta
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred" -ForegroundColor Red
} catch {
    Write-Host "An even different error occurred: $_" -ForegroundColor DarkGreen
}

try {
    Get-ChildItem2 c:\Does-Not-Exist
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found." -ForegroundColor Magenta
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred" -ForegroundColor Red
} catch {
    Write-Host "An even different error occurred" -ForegroundColor DarkGreen
}

$Error.Clear()

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    $_
}

$Error

$Error.Clear()

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Error "An error occurred: The specified path does not exist."
}

$Error[0]
$Error[1]


$ErrorActionPreference = 'Continue'

function Test-Error {
    $callerErrorActionPreference = $ErrorActionPreference
    try {
        Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
    } catch {
        Write-Error -ErrorRecord $_ -ErrorAction $callerErrorActionPreference
    }
}

Test-Error


function Test-Error {
    $callerErrorActionPreference = $ErrorActionPreference
    try {
        Get-ChildItem c:\Does-Not-Exist -ErrorAction $callerErrorActionPreference
    } catch {
        throw
    }
}

Test-Error


Try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    throw "An error occurred: The specified path does not exist."
} finally {
    Write-Host "This will always execute, even if an error is thrown." -ForegroundColor Magenta
}

