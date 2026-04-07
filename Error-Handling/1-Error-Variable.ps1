
# Let's Generate some errors
1/0
Get-ChildItem c:\Does-Not-Exist
Get-WrongCommand

# Returns an array of error records, with the most recent error at index 0
$Error

# Most recent error
$Error[0]

# The oldest error
$Error[-1]

# Can be used in a catch block to get the current error
$_

try {
    1/0
} catch {
    Write-Host "An error occurred: $_"
}

# Was the last command successful?
Get-WrongCommand
$?

# Clear the error variable
$Error.Clear()
$Error

# Get error details
$Error[0]

$Error[0] | Select-Object *

# Get the most recent error record with more information
Get-Error -Newest 1

# Get a text dump of the most recent error record
$Error[0] | Format-Custom -Force


$Error[0] | Select-Object *

$Error[0].Exception
$Error[0].Exception.StackTrace




$Error.Clear()

try {
    Get-ChildItem c:\Does-Not-Exist
} catch {
    Write-Host "An error occurred: $_"
}

try {
    1/0
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

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch {
    Write-Host "A different error occurred: $_"
}

Get-Error -Newest 1

try {
    Get-ChildItem C:\code -ErrorAction Stop
    1/0
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch {
    Write-Host "A different error occurred: $_" -ForegroundColor Magenta
}

try {
    1/0
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred" -ForegroundColor Magenta
} catch {
    Write-Host "An even different error occurred: $_" -ForegroundColor Magenta
}

try {
    Get-ChildItem2 c:\Does-Not-Exist
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred" -ForegroundColor Magenta
} catch {
    Write-Host "An even different error occurred" -ForegroundColor Magenta
}


try {
    Get-ChildItem2 c:\Does-Not-Exist
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred"
} catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "The specified command was not found."
} catch {
    Write-Host "An even different error occurred"
}


try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Error -ErrorRecord $_
}


try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Error "An error occurred: The specified path does not exist."
}



$callerErrorActionPreference = $ErrorActionPreference

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Error -ErrorRecord $_ -ErrorAction $callerErrorActionPreference
}

