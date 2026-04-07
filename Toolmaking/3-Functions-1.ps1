<#
.SYNOPSIS
Manage Summit services remotely (get, start, stop, restart).

.DESCRIPTION
This script provides small wrapper functions to get and control a named Windows
service on a remote computer using `Invoke-Command`. It exposes a simple
parameterized interface at the top-level so it can be used interactively or
as part of automation.

.PARAMETER ComputerName
The target computer where the service is running. Accepts DNS name or IP.

.PARAMETER ServiceName
The name of the Windows service to manage (as used by `Get-Service`).

.PARAMETER Action
The action to perform. Valid values are: `Get`, `Start`, `Stop`, `Restart`.

.PARAMETER Credential
A PSCredential object used for remote connections where alternate
credentials are required.

.EXAMPLE
PS> .\3-Functions-1.ps1 -ComputerName srv01 -ServiceName "Spooler" -Action Get

.EXAMPLE
PS> .\3-Functions-1.ps1 -ComputerName srv01 -ServiceName "Spooler" -Action Stop

.EXAMPLE
PS> .\3-Functions-1.ps1 -ComputerName srv01 -ServiceName "Spooler" -Action Start

.NOTES
Author: Generated documentation
#>
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