
$Error.Clear()
cls


try {
    1/0
    Write-Host "Will this print?" -ForegroundColor Green
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Magenta
}


try {
    Get-ChildItem c:\Does-Not-Exist
    Write-Host "Will this print?" -ForegroundColor Green
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Magenta
}



try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
    Write-Host "Will this print?" -ForegroundColor Green
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Magenta
}


$Error[0]
$Error[0] | Select-Object *

$Error.Clear()
cls



Get-ChildItem c:\Does-Not-Exist

$Error[0].Exception | select-object *
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
cls

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    throw
}

$Error[0]

$Error.Clear()
cls

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Error "An error occurred: The specified path does not exist."
}

$Error[0]

$Error[1]



$Error.Clear()

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    throw
    # throw "A custom error message"
    # Write-Error "This is a Write-Error message."
}

$Error[0] | Select-Object *





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


$Error.Clear()

$array = @('.\1.txt', '.\2.txt', '.\3.txt')

foreach ($file in $array) {
    try {
        Get-ChildItem -Path $file -ErrorAction Stop
    } catch {
        Write-Error "Error accessing $file : $_"
        # Throw("Error accessing $file : $_")

        Start-Sleep -Seconds .5
    }
}

$Error


Try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    throw "An error occurred: The specified path does not exist."
} finally {
    Write-Host "This will always execute, even if an error is thrown." -ForegroundColor Magenta
}


# Throw error with an Exception Type
Try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    throw [System.Management.Automation.ItemNotFoundException]::new("test")
} finally {
    Write-Host "This will always execute, even if an error is thrown." -ForegroundColor Magenta
}

