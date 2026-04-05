

Get-ChildItem c:\Does-Not-Exist

$Error

$Error[0]

$Error[0] | Select-Object *

Get-Error -Newest 1
$Error[0] | Format-Custom -Force



$Error[0].Exception
$Error[0].Exception.StackTrace


try {
    Get-ChildItem c:\Does-Not-Exist
} catch {
    Write-Host "An error occurred: $_"
}


try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch {
    Write-Host "An error occurred: $_"
}

try {
    Get-ChildItem c:\Does-Not-Exist -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch {
    Write-Host "A different error occurred: $_"
}

try {
    Get-ChildItem C:\code -ErrorAction Stop
    1/0
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch {
    Write-Host "A different error occurred: $_"
}

try {
    1/0
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred"
} catch {
    Write-Host "An even different error occurred: $_"
}

try {
    Get-ChildItem2 c:\Does-Not-Exist
} catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host "The item was not found."
} catch [System.DivideByZeroException] {
    Write-Host "A divide by zero error occurred"
} catch {
    Write-Host "An even different error occurred"
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

