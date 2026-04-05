param (
    [string]$ComputerName,
    [string]$ServiceName,
    [ValidateSet("Get", "Start", "Stop", "Restart")]
    [string]$Action,
    [PSCredential]$Credential
)

function Get-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}

function Start-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Start-Service -Name $using:ServiceName
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}

function Stop-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Stop-Service -Name $using:ServiceName -Verbose
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}

function Restart-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Restart-Service -Name $using:ServiceName
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}

switch ($Action.ToLower()) {
    "get" {
        Get-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
    }
    "start" {
        Start-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
    }
    "stop" {
        Stop-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
    }
    "restart" {
        Restart-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
    }
    default {
        Write-Error "Invalid action specified. Use 'start', 'stop', or 'restart'."
    }
}

$serviceCheck = Get-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential

if ($serviceCheck.Status -eq "Stopped") {
    Write-Warning "The $($serviceCheck.Name) service is NOT running on $ComputerName. Starting the service..."
    Start-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
} else {
    Write-Warning "The $($serviceCheck.Name) service is already running on $ComputerName. Restarting the service..."
    Restart-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
}